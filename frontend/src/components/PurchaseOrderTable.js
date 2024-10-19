import React, { useState, useEffect, useMemo, useCallback } from 'react';
import { useTable, useGlobalFilter, useFilters, usePagination } from 'react-table';
import Select from 'react-select';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import { fetchPurchaseOrders, fetchPurchaseOrderColumns } from '../api/procurementApi';
import './PurchaseOrderTable.css';

function formatDate(dateString) {
  if (!dateString) return 'N/A';
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { year: 'numeric', month: '2-digit', day: '2-digit' });
}

function formatCurrency(amount) {
  if (amount == null) return 'N/A';
  return `$${amount.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
}

const PurchaseOrderTable = () => {
  const [purchaseOrders, setPurchaseOrders] = useState({ items: [], total: 0, page: 1, items_per_page: 20 });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [startDate, setStartDate] = useState(new Date(Date.now() - 30 * 24 * 60 * 60 * 1000));
  const [endDate, setEndDate] = useState(new Date());
  const [currentPage, setCurrentPage] = useState(1);
  const [statusFilter, setStatusFilter] = useState(null);
  const [allColumns, setAllColumns] = useState([]);

  const defaultColumns = [
    'date_issued', 'po_number', 'bom_id', 'qty', 'uom', 'supplier', 'status', 'current_expected_arrival_date', 'total_amount'
  ];

  const [selectedColumns, setSelectedColumns] = useState(defaultColumns);

  const loadPurchaseOrders = useCallback(async (page = 1) => {
    try {
      setLoading(true);
      const data = await fetchPurchaseOrders(startDate, endDate, page, 20, statusFilter);
      setPurchaseOrders(data);
      setCurrentPage(page);
    } catch (err) {
      if (err.name !== 'CanceledError') {
        console.error('Failed to load purchase orders:', err);
        setError('Failed to load purchase orders. Please try again later.');
      }
    } finally {
      setLoading(false);
    }
  }, [startDate, endDate, statusFilter]);

  useEffect(() => {
    let isMounted = true;
    const controller = new AbortController();

    const fetchData = async () => {
      try {
        const [ordersData, columnsData] = await Promise.all([
          fetchPurchaseOrders(startDate, endDate, currentPage, 20, statusFilter, controller.signal),
          fetchPurchaseOrderColumns(controller.signal)
        ]);
        if (isMounted) {
          setPurchaseOrders(ordersData);
          setAllColumns(columnsData);
        }
      } catch (err) {
        if (err.name !== 'CanceledError' && isMounted) {
          console.error('Error fetching data:', err);
          setError('Failed to fetch data. Please try again later.');
        }
      } finally {
        if (isMounted) setLoading(false);
      }
    };

    fetchData();

    return () => {
      isMounted = false;
      controller.abort();
    };
  }, [startDate, endDate, statusFilter, currentPage]);

  const columns = useMemo(
    () => allColumns
      .filter(column => selectedColumns.includes(column))
      .map(column => ({
        Header: column.charAt(0).toUpperCase() + column.slice(1).replace(/_/g, ' '),
        accessor: column,
        Cell: ({ value }) => {
          if (column === 'date_issued' || column === 'current_expected_arrival_date') {
            return formatDate(value);
          }
          if (column === 'total_amount') {
            return formatCurrency(value);
          }
          return value;
        }
      })),
    [allColumns, selectedColumns]
  );

  const statusOptions = useMemo(() => {
    if (!purchaseOrders.items) return [];
    const statuses = [...new Set(purchaseOrders.items.map(po => po.status))];
    return statuses.map(status => ({ value: status, label: status }));
  }, [purchaseOrders.items]);

  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    page,
    prepareRow,
    setGlobalFilter,
    setFilter,
    canPreviousPage,
    canNextPage,
    pageOptions,
    pageCount,
    gotoPage,
    nextPage,
    previousPage,
    setPageSize,
    state: { pageIndex, pageSize },
  } = useTable(
    {
      columns,
      data: purchaseOrders.items || [],
      initialState: { pageIndex: 0, pageSize: 20 },
      manualPagination: true,
      pageCount: Math.ceil(purchaseOrders.total / purchaseOrders.items_per_page),
    },
    useFilters,
    useGlobalFilter,
    usePagination
  );

  const handleColumnChange = (selectedOption) => {
    const columnAccessor = selectedOption.value;
    setSelectedColumns(prevSelected => 
      prevSelected.includes(columnAccessor)
        ? prevSelected.filter(col => col !== columnAccessor)
        : [...prevSelected, columnAccessor]
    );
  };

  const handleStatusChange = (selectedOption) => {
    setStatusFilter(selectedOption ? selectedOption.value : null);
  };

  const customStyles = {
    control: (provided) => ({
      ...provided,
      width: '200px',
      backgroundColor: '#374151',
      borderColor: '#4B5563',
    }),
    menu: (provided) => ({
      ...provided,
      backgroundColor: '#1F2937',
    }),
    option: (provided, state) => ({
      ...provided,
      color: state.isSelected ? '#F9FAFB' : '#D1D5DB',
      backgroundColor: state.isSelected ? '#3B82F6' : state.isFocused ? '#374151' : '#1F2937',
    }),
    singleValue: (provided) => ({
      ...provided,
      color: '#F9FAFB',
    }),
  };

  if (loading) return <div>Loading...</div>;
  if (error) return <div className="error-message">{error}</div>;

  return (
    <div>
      <div className="purchase-order-controls">
        <input
          type="text"
          placeholder="Search..."
          onChange={e => setGlobalFilter(e.target.value)}
          className="search-input"
        />
        <Select
          options={allColumns.map(col => ({ value: col, label: col.charAt(0).toUpperCase() + col.slice(1).replace(/_/g, ' ') }))}
          onChange={handleColumnChange}
          styles={customStyles}
          isMulti={false}
          placeholder="Choose Columns"
          value={null}
          formatOptionLabel={({ label, value }) => (
            <div>
              {selectedColumns.includes(value) ? '✓ ' : ''}
              {label}
            </div>
          )}
        />
        <Select
          options={statusOptions}
          onChange={handleStatusChange}
          styles={customStyles}
          isClearable
          placeholder="Filter Status"
        />
        <div className="date-range-picker">
          <DatePicker
            selected={startDate}
            onChange={date => setStartDate(date)}
            selectsStart
            startDate={startDate}
            endDate={endDate}
          />
          <DatePicker
            selected={endDate}
            onChange={date => setEndDate(date)}
            selectsEnd
            startDate={startDate}
            endDate={endDate}
            minDate={startDate}
          />
        </div>
      </div>
      <table {...getTableProps()} className="purchase-order-table">
        <thead>
          {headerGroups.map(headerGroup => (
            <tr {...headerGroup.getHeaderGroupProps()} key={headerGroup.id}>
              {headerGroup.headers.map(column => (
                <th {...column.getHeaderProps()} key={column.id}>{column.render('Header')}</th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody {...getTableBodyProps()}>
          {page.map((row, i) => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps()} key={row.original.id || `row-${i}`}>
                {row.cells.map((cell, cellIndex) => (
                  <td {...cell.getCellProps()} key={`${row.original.id || i}-${cellIndex}`}>
                    {cell.render('Cell')}
                  </td>
                ))}
              </tr>
            );
          })}
        </tbody>
      </table>
      <div className="pagination">
        <button onClick={() => loadPurchaseOrders(1)} disabled={currentPage === 1}>
          {'<<'}
        </button>
        <button onClick={() => loadPurchaseOrders(currentPage - 1)} disabled={currentPage === 1}>
          {'<'}
        </button>
        <span>
          Page{' '}
          <strong>
            {currentPage} of {Math.ceil(purchaseOrders.total / purchaseOrders.items_per_page)}
          </strong>{' '}
        </span>
        <button onClick={() => loadPurchaseOrders(currentPage + 1)} disabled={currentPage === Math.ceil(purchaseOrders.total / purchaseOrders.items_per_page)}>
          {'>'}
        </button>
        <button onClick={() => loadPurchaseOrders(Math.ceil(purchaseOrders.total / purchaseOrders.items_per_page))} disabled={currentPage === Math.ceil(purchaseOrders.total / purchaseOrders.items_per_page)}>
          {'>>'}
        </button>
      </div>
    </div>
  );
};

export default PurchaseOrderTable;
