import React, { useState, useMemo } from 'react';
import { useTable, useGlobalFilter, useFilters } from 'react-table';
import Select from 'react-select';

const FinishedGoodsTable = ({ data }) => {
  console.log('FinishedGoodsTable received data:', JSON.stringify(data, null, 2));

  const defaultColumns = [
    'isku', 'asin', 'phoenix_class', 'brand', 'material_cost', 
    'labor_cost', 'total_unit_cost', 'amz_safety_days', 
    'wh_safety_days', 'lead_time', 'status'
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
      height: '38px', // Increase height to match search box
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

  try {
    console.log('Rendering table with props:', { columns, data });
    return (
      <div>
        <div className="finished-goods-controls">
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
            value={null} // This ensures the placeholder is always shown
            formatOptionLabel={({ label, value }) => (
              <div>
                {selectedColumns.includes(value) ? '✓ ' : ''}
                {label}
              </div>
            )}
          />
        </div>
        <table {...getTableProps()} className="finished-goods-table">
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
  } catch (error) {
    console.error('Error rendering FinishedGoodsTable:', error);
    return <div>Error rendering table: {error.message}</div>;
  }
};

export default FinishedGoodsTable;
