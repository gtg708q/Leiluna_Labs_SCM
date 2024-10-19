import React from 'react';
import './SalesTable.css'; // We'll create this file for styling

const formatCurrency = (value) => {
  const absValue = Math.abs(Math.round(value));
  return value < 0 ? `-$${absValue.toLocaleString()}` : `$${absValue.toLocaleString()}`;
};

const formatNumber = (value) => {
  return Math.round(value).toLocaleString();
};

const SalesTable = ({ data, columns, onSort, sortBy, sortOrder }) => {
  const handleSort = (column) => {
    onSort(column);
  };

  if (!data || data.length === 0) {
    return <p>No data available</p>;
  }

  const formatValue = (column, value) => {
    if (['revenue', 'net_profit'].includes(column)) {
      return formatCurrency(value);
    } else if (column === 'velocity') {
      return value.toFixed(2);
    } else if (['orders', 'units'].includes(column)) {
      return formatNumber(value);
    } else if (Array.isArray(value)) {
      return value.join(', ');
    }
    return value;
  };

  return (
    <div className="sales-table-container">
      <table className="sales-table">
        <thead>
          <tr>
            {columns.map(column => (
              <th key={column} onClick={() => handleSort(column)}>
                {column}
                {sortBy === column && (sortOrder === 'asc' ? ' ▲' : ' ▼')}
              </th>
            ))}
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={item.id || index} className={index % 2 === 0 ? 'even-row' : 'odd-row'}>
              {columns.map(column => (
                <td key={column}>
                  {item[column] !== undefined ? formatValue(column, item[column]) : 'N/A'}
                </td>
              ))}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default SalesTable;
