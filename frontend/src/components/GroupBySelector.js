import React from 'react';
import Select from 'react-select';

const GroupBySelector = ({ groupBy, onGroupByChange }) => {
  const options = [
    { value: 'asin', label: 'ASIN' },
    { value: 'sku', label: 'SKU' },
  ];

  return (
    <div className="group-by-selector">
      <Select
        options={options}
        value={options.find(option => option.value === groupBy)}
        onChange={(selectedOption) => onGroupByChange(selectedOption.value)}
        placeholder="Group By"
        className="react-select-container"
        classNamePrefix="react-select"
      />
    </div>
  );
};

export default GroupBySelector;
