import React, { useState, useEffect } from 'react';
import DateRangePicker from '../components/DateRangePicker';
import SummaryCard from '../components/SummaryCard';
import SalesTable from '../components/SalesTable';
import { fetchSalesData } from '../api/salesApi';

const Dashboard = () => {
  const [salesData, setSalesData] = useState(null);
  const [dateRange, setDateRange] = useState({ startDate: new Date(), endDate: new Date() });
  const [currentPage, setCurrentPage] = useState(1);
  const [sortBy, setSortBy] = useState('revenue');
  const [sortOrder, setSortOrder] = useState('desc');

  useEffect(() => {
    fetchData();
  }, [dateRange, currentPage, sortBy, sortOrder]);

  const fetchData = async () => {
    try {
      const data = await fetchSalesData(
        dateRange.startDate.toISOString().split('T')[0],
        dateRange.endDate.toISOString().split('T')[0],
        currentPage,
        sortBy,
        sortOrder
      );
      setSalesData(data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  const handleDateRangeChange = (startDate, endDate) => {
    setDateRange({ startDate, endDate });
    setCurrentPage(1);
  };

  const handleSort = (column) => {
    if (column === sortBy) {
      setSortOrder(sortOrder === 'asc' ? 'desc' : 'asc');
    } else {
      setSortBy(column);
      setSortOrder('desc');
    }
    setCurrentPage(1);
  };

  if (!salesData) return <div>Loading...</div>;

  return (
    <div className="dashboard">
      <h1>Sales Dashboard</h1>
      <DateRangePicker onDateRangeChange={handleDateRangeChange} />
      <div className="summary-cards">
        <SummaryCard title="Sales" value={`$${salesData.summary.sales.toFixed(2)}`} />
        <SummaryCard title="Sales Volumes" value={salesData.summary.sales_volumes} />
        <SummaryCard title="Net Before COGS" value={`$${salesData.summary.net_before_cogs.toFixed(2)}`} />
        <SummaryCard title="Net Profit" value={`$${salesData.summary.net_profit.toFixed(2)}`} />
      </div>
      <SalesTable data={salesData.details} onSort={handleSort} />
      {/* Add pagination controls here */}
    </div>
  );
};

export default Dashboard;
