import React, { useState, useEffect, useCallback, useRef } from 'react';
import DateRangePicker from '../components/DateRangePicker';
import SummaryCards from '../components/SummaryCards';
import SalesTable from '../components/SalesTable';
import { fetchSalesData, fetchSalesColumns } from '../api/salesApi';
import MarketplaceSelector from '../components/MarketplaceSelector';
import SearchBar from '../components/SearchBar';
import GroupBySelector from '../components/GroupBySelector';
import TableViewSelector from '../components/TableViewSelector';
import Pagination from '../components/Pagination';
import './Dashboard.css'; // We'll create this file for additional styling

const formatDate = (date) => {
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  const year = date.getFullYear().toString().slice(-2);
  return `${month}/${day}/${year}`;
};

const Dashboard = () => {
  const [salesData, setSalesData] = useState({ summary: {}, details: [], current_page: 1, total_pages: 1 });
  const [dateRange, setDateRange] = useState({ startDate: new Date(), endDate: new Date() });
  const [currentPage, setCurrentPage] = useState(1);
  const [sortBy, setSortBy] = useState('net_profit');
  const [sortOrder, setSortOrder] = useState('desc');
  const [selectedMarketplaces, setSelectedMarketplaces] = useState([{ value: 'all', label: 'All Accounts' }]);
  const [searchTerm, setSearchTerm] = useState('');
  const [groupBy, setGroupBy] = useState('asin');
  const [selectedColumns, setSelectedColumns] = useState(['id', 'brand', 'sku', 'orders', 'units', 'velocity', 'revenue', 'net_profit']);
  const [availableColumns, setAvailableColumns] = useState([]);
  const [error, setError] = useState(null);
  const [shouldFetchData, setShouldFetchData] = useState(false);
  const isInitialMount = useRef(true);

  const fetchData = useCallback(async () => {
    if (!shouldFetchData) return;

    try {
      console.log('Fetching data with params:', {
        startDate: formatDate(dateRange.startDate),
        endDate: formatDate(dateRange.endDate),
        currentPage,
        sortBy,
        sortOrder,
        selectedMarketplaces,
        searchTerm,
        groupBy
      });

      const accountTitles = selectedMarketplaces.length === 0 || selectedMarketplaces.some(m => m.value === 'all')
        ? ['all']
        : selectedMarketplaces.map(m => m.value);

      const data = await fetchSalesData(
        formatDate(dateRange.startDate),
        formatDate(dateRange.endDate),
        currentPage,
        sortBy,
        sortOrder,
        accountTitles,
        searchTerm,
        groupBy
      );

      console.log('Received data:', data);
      setSalesData(data);
      setError(null);
    } catch (error) {
      console.error('Error fetching data:', error);
      setError(error.message || 'An unexpected error occurred');
      setSalesData(null);
    } finally {
      setShouldFetchData(false);
    }
  }, [dateRange, currentPage, sortBy, sortOrder, selectedMarketplaces, searchTerm, groupBy, shouldFetchData]);

  useEffect(() => {
    if (shouldFetchData) {
      fetchData();
    }
  }, [fetchData, shouldFetchData]);

  useEffect(() => {
    fetchColumns();
  }, []);

  const fetchColumns = async () => {
    try {
      const columns = await fetchSalesColumns();
      setAvailableColumns(columns);
    } catch (error) {
      console.error('Error fetching columns:', error);
    }
  };

  const handleDateRangeChange = useCallback((startDate, endDate) => {
    console.log('Date range changed in Dashboard:', startDate, endDate);
    setDateRange({ startDate, endDate });
    setCurrentPage(1);
    setShouldFetchData(true);
  }, []);

  const handleSort = (column) => {
    if (column === sortBy) {
      setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
    } else {
      setSortBy(column);
      setSortOrder('desc');
    }
    setCurrentPage(1);
  };

  const handleMarketplaceChange = (marketplaces) => {
    setSelectedMarketplaces(marketplaces);
    setCurrentPage(1);
    setShouldFetchData(true);
  };

  const handleSearch = (term) => {
    setSearchTerm(term);
    setCurrentPage(1);
    setShouldFetchData(true);
  };

  const handleGroupByChange = (group) => {
    setGroupBy(group);
    setCurrentPage(1);
    setShouldFetchData(true);
  };

  const handleColumnChange = (columns) => {
    setSelectedColumns(columns);
  };

  const handlePageChange = (page) => {
    setCurrentPage(page);
    setShouldFetchData(true);
  };

  if (error) {
    console.error('Rendering error state:', error);
    return <div>Error: {error}</div>;
  }
  if (!salesData) {
    console.log('Rendering loading state');
    return <div>Loading...</div>;
  }

  console.log('Rendering dashboard with data');
  return (
    <div className="dashboard">
      <div className="dashboard-controls">
        <div className="control-item">
          <label>Select Date Range</label>
          <DateRangePicker onDateRangeChange={handleDateRangeChange} />
        </div>
        <div className="control-item">
          <label>Select Account</label>
          <MarketplaceSelector
            selectedMarketplaces={selectedMarketplaces}
            onMarketplaceChange={handleMarketplaceChange}
          />
        </div>
        <div className="control-item">
          <label>Group By</label>
          <GroupBySelector groupBy={groupBy} onGroupByChange={handleGroupByChange} />
        </div>
        <div className="control-item">
          <label>Search</label>
          <SearchBar onSearch={handleSearch} />
        </div>
      </div>
      <SummaryCards summary={salesData.summary} />
      <SalesTable
        data={salesData.details}
        columns={selectedColumns}
        onSort={handleSort}
        sortBy={sortBy}
        sortOrder={sortOrder}
      />
      <Pagination
        currentPage={salesData.current_page}
        totalPages={salesData.total_pages}
        onPageChange={handlePageChange}
      />
    </div>
  );
};

export default Dashboard;
