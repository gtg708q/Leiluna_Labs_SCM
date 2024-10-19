import React, { useState } from 'react';

const TableViewSelector = ({ availableColumns, selectedColumns, onColumnChange }) => {
  const [isOpen, setIsOpen] = useState(false);

  const handleColumnToggle = (column) => {
    const updatedColumns = selectedColumns.includes(column)
      ? selectedColumns.filter(c => c !== column)
      : [...selectedColumns, column];
    onColumnChange(updatedColumns);
  };

  return (
    <div className="table-view-selector">
      <button onClick={() => setIsOpen(!isOpen)}>Select Table View</button>
      {isOpen && (
        <div className="column-selector-popup">
          {availableColumns.map(column => (
            <label key={column}>
              <input
                type="checkbox"
                checked={selectedColumns.includes(column)}
                onChange={() => handleColumnToggle(column)}
              />
              {column}
            </label>
          ))}
        </div>
      )}
    </div>
  );
};

export default TableViewSelector;
