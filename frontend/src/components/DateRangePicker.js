import React, { useState, useEffect, useRef, useCallback } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import './DateRangePicker.css'; // We'll create this file for styling

const DateRangePicker = ({ onDateRangeChange }) => {
  const [dateRange, setDateRange] = useState([null, null]);
  const [startDate, endDate] = dateRange;
  const [isModalOpen, setIsModalOpen] = useState(false);
  const modalRef = useRef(null);
  const initialRenderRef = useRef(true);

  useEffect(() => {
    if (initialRenderRef.current) {
      // Set default selection to yesterday
      const yesterday = new Date();
      yesterday.setDate(yesterday.getDate() - 1);
      setDateRange([yesterday, yesterday]);
      onDateRangeChange(yesterday, yesterday);
      initialRenderRef.current = false;
      console.log('Set initial date range to yesterday:', yesterday);
    }
  }, [onDateRangeChange]);

  useEffect(() => {
    const handleClickOutside = (event) => {
      if (modalRef.current && !modalRef.current.contains(event.target)) {
        setIsModalOpen(false);
      }
    };

    if (isModalOpen) {
      document.addEventListener('mousedown', handleClickOutside);
    }

    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, [isModalOpen]);

  const handleDateChange = useCallback((update) => {
    setDateRange(update);
    if (update[0] && update[1]) {
      console.log('Date range changed:', update);
      onDateRangeChange(update[0], update[1]);
      setIsModalOpen(false);
    }
  }, [onDateRangeChange]);

  const handlePresetSelect = (preset) => {
    let start, end;
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    switch (preset) {
      case 'today':
        start = end = today;
        break;
      case 'yesterday':
        start = end = new Date(today);
        start.setDate(today.getDate() - 1);
        break;
      case 'dayBeforeYesterday':
        start = end = new Date(today);
        start.setDate(today.getDate() - 2);
        break;
      case '3days':
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setDate(end.getDate() - 2);
        break;
      case '7days':
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setDate(end.getDate() - 6);
        break;
      case 'thisWeek':
        start = new Date(today);
        start.setDate(today.getDate() - today.getDay());
        end = today;
        break;
      case 'lastWeek':
        end = new Date(today);
        end.setDate(today.getDate() - today.getDay() - 1);
        start = new Date(end);
        start.setDate(end.getDate() - 6);
        break;
      case 'thisMonth':
        start = new Date(today.getFullYear(), today.getMonth(), 1);
        end = today;
        break;
      case 'thisQuarter':
        start = new Date(today.getFullYear(), Math.floor(today.getMonth() / 3) * 3, 1);
        end = today;
        break;
      case 'thisSemester':
        start = new Date(today.getFullYear(), Math.floor(today.getMonth() / 6) * 6, 1);
        end = today;
        break;
      case 'yearToDate':
        start = new Date(today.getFullYear(), 0, 1);
        end = today;
        break;
      case 'lastMonth':
        start = new Date(today.getFullYear(), today.getMonth() - 1, 1);
        end = new Date(today.getFullYear(), today.getMonth(), 0);
        break;
      case 'lastQuarter':
        start = new Date(today.getFullYear(), Math.floor(today.getMonth() / 3) * 3 - 3, 1);
        end = new Date(today.getFullYear(), Math.floor(today.getMonth() / 3) * 3, 0);
        break;
      case '3months':
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setMonth(start.getMonth() - 3);
        break;
      case 'oneYear':
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setFullYear(start.getFullYear() - 1);
        break;
      case 'twoYears':
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setFullYear(start.getFullYear() - 2);
        break;
      case 'lastYear':
        start = new Date(today.getFullYear() - 1, today.getMonth(), 1);
        end = new Date(today.getFullYear() - 1, today.getMonth(), today.getDate());
        break;
      case 'sameDayLastYear':
        start = new Date(today.getFullYear() - 1, today.getMonth(), today.getDate());
        end = new Date(today.getFullYear() - 1, today.getMonth(), today.getDate());
        break;
      case 'sameMonthLastYear':
        start = new Date(today.getFullYear() - 1, today.getMonth(), 1);
        end = new Date(today.getFullYear() - 1, today.getMonth(), today.getDate());
        break;
      case 'sameQuarterLastYear':
        start = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 3) * 3, 1);
        end = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 3) * 3, today.getDate());
        break;
      case 'sameSemesterLastYear':
        start = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 6) * 6, 1);
        end = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 6) * 6, today.getDate());
        break;
      case 'lastMonthLastYear':
        start = new Date(today.getFullYear() - 1, today.getMonth() - 1, 1);
        end = new Date(today.getFullYear() - 1, today.getMonth() - 1, today.getDate());
        break;
      case 'lastQuarterLastYear':
        start = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 3) * 3 - 3, 1);
        end = new Date(today.getFullYear() - 1, Math.floor(today.getMonth() / 3) * 3 - 3, today.getDate());
        break;
      case 'monthToDateLastYear':
        start = new Date(today.getFullYear() - 1, 0, 1);
        end = new Date(today.getFullYear() - 1, today.getMonth(), today.getDate());
        break;
      case '15days':
      case '30days':
      case '60days':
      case '90days':
      case '180days':
        const days = parseInt(preset);
        end = new Date(today);
        end.setDate(today.getDate() - 1);
        start = new Date(end);
        start.setDate(end.getDate() - days + 1);
        break;
      // Add cases for the remaining presets
      default:
        return;
    }

    setDateRange([start, end]);
    console.log('Preset selected:', preset, 'Date range:', [start, end]);
    onDateRangeChange(start, end);
    setIsModalOpen(false);
  };

  const formatDateRange = () => {
    if (startDate && endDate) {
      return `${startDate.toLocaleDateString()} - ${endDate.toLocaleDateString()}`;
    }
    return 'Select Date Range';
  };

  return (
    <div className="date-range-picker-container">
      <button onClick={() => setIsModalOpen(true)} className="date-range-button">{formatDateRange()}</button>
      {isModalOpen && (
        <div className="date-range-modal">
          <div className="modal-content" ref={modalRef}>
            <h2>Select Date Range</h2>
            <div className="preset-options">
              <div className="preset-column">
                <h3>Recently</h3>
                <button onClick={() => handlePresetSelect('today')}>Today</button>
                <button onClick={() => handlePresetSelect('yesterday')}>Yesterday</button>
                <button onClick={() => handlePresetSelect('dayBeforeYesterday')}>Day before Yesterday</button>
                <button onClick={() => handlePresetSelect('3days')}>3 Days</button>
                <button onClick={() => handlePresetSelect('7days')}>7 Days</button>
              </div>
              <div className="preset-column">
                <h3>Weeks</h3>
                <button onClick={() => handlePresetSelect('thisWeek')}>This Week</button>
                <button onClick={() => handlePresetSelect('lastWeek')}>Last Week</button>
              </div>
              <div className="preset-column">
                <h3>Number of Days</h3>
                <button onClick={() => handlePresetSelect('15days')}>15 Days</button>
                <button onClick={() => handlePresetSelect('30days')}>30 Days</button>
                <button onClick={() => handlePresetSelect('60days')}>60 Days</button>
                <button onClick={() => handlePresetSelect('90days')}>90 Days</button>
                <button onClick={() => handlePresetSelect('180days')}>180 Days</button>
              </div>
              <div className="preset-column">
                <h3>Ongoing Periods</h3>
                <button onClick={() => handlePresetSelect('thisMonth')}>This Month</button>
                <button onClick={() => handlePresetSelect('thisQuarter')}>This Quarter</button>
                <button onClick={() => handlePresetSelect('thisSemester')}>This Semester</button>
                <button onClick={() => handlePresetSelect('yearToDate')}>Year to Date</button>
              </div>
              <div className="preset-column">
                <h3>Past Periods</h3>
                <button onClick={() => handlePresetSelect('lastMonth')}>Last Month</button>
                <button onClick={() => handlePresetSelect('lastQuarter')}>Last Quarter</button>
                <button onClick={() => handlePresetSelect('3months')}>3 Months</button>
                <button onClick={() => handlePresetSelect('oneYear')}>One Year</button>
                <button onClick={() => handlePresetSelect('twoYears')}>Two Years</button>
              </div>
              <div className="preset-column">
                <h3>Last Year</h3>
                <button onClick={() => handlePresetSelect('lastYear')}>Last Year</button>
                <button onClick={() => handlePresetSelect('sameDayLastYear')}>Same Day Last Year</button>
                <button onClick={() => handlePresetSelect('sameMonthLastYear')}>Same Month Last Year</button>
                <button onClick={() => handlePresetSelect('sameQuarterLastYear')}>Same Quarter Last Year</button>
                <button onClick={() => handlePresetSelect('sameSemesterLastYear')}>Same Semester Last Year</button>
                <button onClick={() => handlePresetSelect('lastMonthLastYear')}>Last Month Last Year</button>
                <button onClick={() => handlePresetSelect('lastQuarterLastYear')}>Last Quarter Last Year</button>
                <button onClick={() => handlePresetSelect('monthToDateLastYear')}>Month To Date, Last Year</button>
              </div>
            </div>
            <div className="custom-range">
              <h3>Custom</h3>
              <DatePicker
                selectsRange={true}
                startDate={startDate}
                endDate={endDate}
                onChange={handleDateChange}
                inline
              />
            </div>
            <div className="modal-actions">
              <button onClick={() => setIsModalOpen(false)} className="cancel-button">Cancel</button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default DateRangePicker;
