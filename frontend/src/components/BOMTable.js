import React, { useState, useMemo } from 'react';
import { useTable, useGlobalFilter, useFilters } from 'react-table';
import Select from 'react-select';

const BOMTable = ({ data }) => {
  const defaultColumns = [
    'bom_id', 'component_type', 'phx_class', 'supplier_manufacturer', 
    'supplier_mfg_lt', 'transit_lt', 'amz_safety_days', 'wh_safety_days', 
    'po_issue_days', 'moq', 'ordering_uom', 'landed_cost', 'total_lt_bom_master'
  ];

  const allColumns = useMemo(() => {
    if (!Array.isArray(data) || data.length === 0) {
      console.error('Invalid or empty data received');
      return [];
    }

    const sampleItem = data[0];
    return Object.keys(sampleItem).map(key => ({
      Header: key.charAt(0).toUpperCase() + key.slice(1).replace(/_/g, ' '),
      accessor: key,
    }));
  }, [data]);

  const [selectedColumns, setSelectedColumns] = useState(defaultColumns);

  const columns = useMemo(
    () => allColumns.filter(column => selectedColumns.includes(column.accessor)),
    [allColumns, selectedColumns]
  );

  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    rows,
    prepareRow,
    setGlobalFilter,
  } = useTable(
    {
      columns,
      data: data || [],
    },
    useFilters,
    useGlobalFilter
  );

  const handleColumnChange = (selectedOption) => {
    const columnAccessor = selectedOption.value;
    setSelectedColumns(prevSelected => 
      prevSelected.includes(columnAccessor)
        ? prevSelected.filter(col => col !== columnAccessor)
        : [...prevSelected, columnAccessor]
    );
  };

  const customStyles = {
    control: (provided) => ({
      ...provided,
      width: '200px',
      height: '38px',
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

  if (!Array.isArray(data) || data.length === 0) {
    return <div>No data available</div>;
  }

  return (
    <div>
      <div className="bom-controls">
        <input
          type="text"
          placeholder="Search..."
          onChange={e => setGlobalFilter(e.target.value)}
          className="search-input"
        />
        <Select
          options={allColumns.map(col => ({ 
            value: col.accessor, 
            label: col.Header,
          }))}
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
      </div>
      <table {...getTableProps()} className="bom-table">
        <thead>
          {headerGroups.map((headerGroup, i) => (
            <tr {...headerGroup.getHeaderGroupProps()} key={i}>
              {headerGroup.headers.map((column, j) => (
                <th {...column.getHeaderProps()} key={j}>
                  {column.render('Header')}
                </th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody {...getTableBodyProps()}>
          {rows.map((row, i) => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps()} key={i}>
                {row.cells.map((cell, j) => {
                  return (
                    <td {...cell.getCellProps()} key={j}>
                      {cell.render('Cell')}
                    </td>
                  );
                })}
              </tr>
            );
          })}
        </tbody>
      </table>
    </div>
  );
};

export default BOMTable;
