import React, { useEffect, useState } from 'react';
import Select from 'react-select';
import { fetchAccountTitles } from '../api/salesApi';

const MarketplaceSelector = ({ selectedMarketplaces, onMarketplaceChange }) => {
  const [options, setOptions] = useState([]);

  useEffect(() => {
    const loadAccountTitles = async () => {
      try {
        const titles = await fetchAccountTitles();
        console.log('Fetched account titles:', titles);
        const allOption = { value: 'all', label: 'All Accounts' };
        const titleOptions = titles.map(title => ({ value: title, label: title }));
        setOptions([allOption, ...titleOptions]);
      } catch (error) {
        console.error('Error loading account titles:', error);
      }
    };
    loadAccountTitles();
  }, []);

  const handleChange = (selectedOptions) => {
    console.log('MarketplaceSelector: Selected options:', selectedOptions);
    if (!selectedOptions || selectedOptions.length === 0) {
      console.log('MarketplaceSelector: No options selected, clearing selection');
      onMarketplaceChange([]);
    } else if (selectedOptions.some(option => option.value === 'all')) {
      console.log('MarketplaceSelector: "All Accounts" selected, clearing other selections');
      onMarketplaceChange([{ value: 'all', label: 'All Accounts' }]);
    } else {
      console.log('MarketplaceSelector: Updating selected marketplaces');
      onMarketplaceChange(selectedOptions);
    }
  };

  const customStyles = {
    control: (provided) => ({
      ...provided,
      minHeight: '38px',
      height: '38px',
    }),
    valueContainer: (provided) => ({
      ...provided,
      height: '38px',
      padding: '0 6px',
    }),
    input: (provided) => ({
      ...provided,
      margin: '0px',
    }),
    indicatorsContainer: (provided) => ({
      ...provided,
      height: '38px',
    }),
    menu: (provided) => ({
      ...provided,
      zIndex: 9999, // Increase this value to ensure the dropdown appears above other elements
    }),
  };

  return (
    <div className="marketplace-selector">
      <Select
        isMulti
        options={options}
        value={selectedMarketplaces}
        onChange={handleChange}
        placeholder="Select Marketplace/Group"
        isClearable={true}
        className="react-select-container"
        classNamePrefix="react-select"
        styles={customStyles}
      />
    </div>
  );
};

export default MarketplaceSelector;
