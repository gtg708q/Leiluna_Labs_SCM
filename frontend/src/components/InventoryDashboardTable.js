import React, { useState, useEffect, useMemo, useCallback, useRef } from 'react';
import { useTable, useGlobalFilter, useFilters, usePagination, useSortBy } from 'react-table';
import Select from 'react-select';
import { fetchInventoryDashboard, fetchInventoryDashboardColumns, fetchInventoryDashboardStatuses } from '../api/inventoryDashboardApi';
import './InventoryDashboardTable.css';

const InventoryDashboardTable = () => {
  const [inventoryData, setInventoryData] = useState({ items: [], total: 0, page: 1, items_per_page: 100 });
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const [currentPage, setCurrentPage] = useState(1);
  const [statusFilter, setStatusFilter] = useState(null);
  const [allColumns, setAllColumns] = useState([]);
  const [statusOptions, setStatusOptions] = useState([]);

  const defaultColumns = [
    'asin', 'isku', 'brand', 'status', 'phoenix_class', 'inventory_health', 'velocity_7d', 'velocity_30d', 'velocity_60d',
    'final_velocity', 'fba_in_stock_qty', 'fba_in_stock_days', 'total_fba_qty', 'total_fba_days', 'fo_qty', 'fo_date', 'thirty_day_net_profit'
  ];

  const [selectedColumns, setSelectedColumns] = useState(defaultColumns);
  const [isColumnSelectorOpen, setIsColumnSelectorOpen] = useState(false);
  const columnSelectorRef = useRef(null);

  const loadInventoryDashboard = useCallback(async (page = 1, sortBy = [{ id: 'final_velocity', desc: true }]) => {
    try {
      setLoading(true);
      const data = await fetchInventoryDashboard(page, 100, statusFilter?.value, selectedColumns, sortBy);
      setInventoryData(data);
      setCurrentPage(page);
    } catch (err) {
      console.error('Failed to load inventory dashboard:', err);
      setError('Failed to load inventory dashboard. Please try again later.');
    } finally {
      setLoading(false);
    }
  }, [statusFilter, selectedColumns]);

  useEffect(() => {
    let isMounted = true;
    const controller = new AbortController();

    const fetchData = async () => {
      try {
        const [columnsData, statusesData] = await Promise.all([
          fetchInventoryDashboardColumns(controller.signal),
          fetchInventoryDashboardStatuses(controller.signal)
        ]);
        if (isMounted) {
          setAllColumns(columnsData);
          setStatusOptions([{ value: '', label: 'All' }, ...statusesData.map(status => ({ value: status, label: status }))]);
        }
      } catch (err) {
        if (err.name !== 'CanceledError' && isMounted) {
          console.error('Error fetching data:', err);
          setError('Failed to fetch data. Please try again later.');
        }
      }
    };

    fetchData();
    loadInventoryDashboard(1, selectedColumns);

    return () => {
      isMounted = false;
      controller.abort();
    };
  }, [loadInventoryDashboard]);

  const formatNumber = (value) => {
    if (typeof value === 'number') {
      return Math.round(value).toLocaleString();
    }
    return value;
  };

  const formatCurrency = (value) => {
    if (typeof value === 'number') {
      return `$${Math.round(value).toLocaleString()}`;
    }
    return value;
  };

  const formatPercentage = (value) => {
    if (typeof value === 'number') {
      return `${(value * 100).toFixed(2)}%`;
    }
    return value;
  };

  const formatDate = (dateString) => {
    if (!dateString) return 'N/A';
    const date = new Date(dateString);
    return `${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')}-${date.getFullYear().toString().slice(-2)}`;
  };

  const columns = useMemo(
    () => selectedColumns.map(column => ({
      Header: column.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' '),
      accessor: column,
      Cell: ({ value }) => {
        if (value === null || value === undefined) return 'N/A';
        if (column === 'inventory_health') {
          return (
            <div style={{ 
              backgroundColor: value.toLowerCase(), 
              color: '#000000', // Changed to black
              padding: '5px', 
              borderRadius: '4px',
              fontWeight: 'bold' // Added for better visibility
            }}>
              {value}
            </div>
          );
        }
        if (column === 'thirty_day_net_profit') {
          return formatCurrency(value);
        }
        if (column.startsWith('variance_')) {
          return formatPercentage(value);
        }
        if (column === 'fo_date') {
          return formatDate(value);
        }
        if (typeof value === 'number') {
          return formatNumber(value);
        }
        return String(value);
      }
    })),
    [selectedColumns]
  );

  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    page,
    prepareRow,
    setGlobalFilter,
    canPreviousPage,
    canNextPage,
    pageOptions,
    pageCount,
    gotoPage,
    nextPage,
    previousPage,
    setPageSize,
    state: { pageIndex, pageSize, globalFilter, sortBy },
  } = useTable(
    {
      columns,
      data: inventoryData.items || [],
      initialState: { 
        pageIndex: 0, 
        pageSize: 100, 
        sortBy: [{ id: 'final_velocity', desc: true }] 
      },
      manualPagination: true,
      manualSortBy: true,
      pageCount: Math.ceil(inventoryData.total / inventoryData.items_per_page),
    },
    useFilters,
    useGlobalFilter,
    useSortBy,
    usePagination
  );

  useEffect(() => {
    loadInventoryDashboard(currentPage, sortBy);
  }, [loadInventoryDashboard, currentPage, sortBy]);

  const handleColumnChange = useCallback((selectedOption) => {
    if (selectedOption) {
      const columnValue = selectedOption.value;
      setSelectedColumns(prevColumns => {
        if (prevColumns.includes(columnValue)) {
          return prevColumns.filter(col => col !== columnValue);
        } else {
          return [...prevColumns, columnValue];
        }
      });
    }
  }, []);

  const handleStatusChange = useCallback((selectedOption) => {
    setStatusFilter(selectedOption);
    loadInventoryDashboard(1);
  }, [loadInventoryDashboard]);

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
      position: 'absolute',
      zIndex: 2,
    }),
    option: (provided, state) => ({
      ...provided,
      color: state.isSelected ? '#F9FAFB' : '#D1D5DB',
      backgroundColor: state.isSelected ? '#3B82F6' : state.isFocused ? '#374151' : '#1F2937',
    }),
    multiValue: (provided) => ({
      ...provided,
      backgroundColor: '#4B5563',
    }),
    multiValueLabel: (provided) => ({
      ...provided,
      color: '#F9FAFB',
    }),
    multiValueRemove: (provided) => ({
      ...provided,
      color: '#F9FAFB',
      ':hover': {
        backgroundColor: '#6B7280',
        color: '#F9FAFB',
      },
    }),
    singleValue: (provided) => ({
      ...provided,
      color: '#F9FAFB',
    }),
  };

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (columnSelectorRef.current && !columnSelectorRef.current.contains(event.target)) {
        setIsColumnSelectorOpen(false);
      }
    };

    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div className="error-message">{error}</div>;

  return (
    <div>
      <div className="inventory-dashboard-controls">
        <input
          type="text"
          placeholder="Search..."
          value={globalFilter || ''}
          onChange={e => setGlobalFilter(e.target.value)}
          className="search-input"
        />
        <div className="column-selector" ref={columnSelectorRef}>
          <button 
            onClick={() => setIsColumnSelectorOpen(!isColumnSelectorOpen)}
            className="column-selector-button"
          >
            Select Columns
          </button>
          {isColumnSelectorOpen && (
            <div className="column-dropdown">
              {allColumns.map(col => (
                <div key={col} className="column-option">
                  <input
                    type="checkbox"
                    id={col}
                    checked={selectedColumns.includes(col)}
                    onChange={() => handleColumnChange({ value: col })}
                  />
                  <label htmlFor={col}>
                    {col.split('_').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' ')}
                  </label>
                </div>
              ))}
            </div>
          )}
        </div>
        <Select
          options={statusOptions}
          onChange={handleStatusChange}
          styles={customStyles}
          value={statusFilter}
          placeholder="Filter Status"
          isClearable
        />
      </div>
      <table {...getTableProps()} className="inventory-dashboard-table">
        <thead>
          {headerGroups.map(headerGroup => (
            <tr {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map(column => (
                <th {...column.getHeaderProps(column.getSortByToggleProps())}>
                  {column.render('Header')}
                  <span>
                    {column.isSorted
                      ? column.isSortedDesc
                        ? ' 🔽'
                        : ' 🔼'
                      : column.canSort ? ' ⇵' : ''}
                  </span>
                </th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody {...getTableBodyProps()}>
          {page.map((row, i) => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps()}>
                {row.cells.map(cell => (
                  <td {...cell.getCellProps()}>{cell.render('Cell')}</td>
                ))}
              </tr>
            );
          })}
        </tbody>
      </table>
      <div className="pagination">
        <button onClick={() => loadInventoryDashboard(1)} disabled={currentPage === 1}>
          {'<<'}
        </button>
        <button onClick={() => loadInventoryDashboard(currentPage - 1)} disabled={currentPage === 1}>
          {'<'}
        </button>
        <span>
          Page{' '}
          <strong>
            {currentPage} of {Math.ceil(inventoryData.total / inventoryData.items_per_page)}
          </strong>{' '}
        </span>
        <button onClick={() => loadInventoryDashboard(currentPage + 1)} disabled={currentPage === Math.ceil(inventoryData.total / inventoryData.items_per_page)}>
          {'>'}
        </button>
        <button onClick={() => loadInventoryDashboard(Math.ceil(inventoryData.total / inventoryData.items_per_page))} disabled={currentPage === Math.ceil(inventoryData.total / inventoryData.items_per_page)}>
          {'>>'}
        </button>
      </div>
      {inventoryData.items.length === 0 && !loading && !error && (
        <div>No data available. Please adjust your filters or check the database.</div>
      )}
    </div>
  );
};

export default InventoryDashboardTable;
