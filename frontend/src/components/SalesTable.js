import React from 'react';

const SalesTable = ({ data, onSort }) => {
  return (
    <table>
      <thead>
        <tr>
          <th onClick={() => onSort('asin')}>ASIN</th>
          <th onClick={() => onSort('title')}>Title</th>
          <th onClick={() => onSort('units')}>Units</th>
          <th onClick={() => onSort('revenue')}>Revenue</th>
          <th onClick={() => onSort('net_profit')}>Net Profit</th>
        </tr>
      </thead>
      <tbody>
        {data.map((item) => (
          <tr key={item.asin}>
            <td>{item.asin}</td>
            <td>{item.title}</td>
            <td>{item.units}</td>
            <td>${item.revenue.toFixed(2)}</td>
            <td>${item.net_profit.toFixed(2)}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default SalesTable;
