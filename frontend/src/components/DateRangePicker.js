import React, { useState } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';

const DateRangePicker = ({ onDateRangeChange }) => {
  const [dateRange, setDateRange] = useState([null, null]);
  const [startDate, endDate] = dateRange;

  const handleDateChange = (update) => {
    setDateRange(update);
    if (update[0] && update[1]) {
      onDateRangeChange(update[0], update[1]);
    }
  };

  return (
    <div className="date-range-picker-container" style={{ marginLeft: '20px' }}>
      <DatePicker
        selectsRange={true}
        startDate={startDate}
        endDate={endDate}
        onChange={handleDateChange}
        dateFormat="yyyy-MM-dd"
        isClearable={true}
        placeholderText="Select date range"
      />
    </div>
  );
};

export default DateRangePicker;
