import React from 'react';
import InventoryDashboardTable from '../components/InventoryDashboardTable';
import './InventoryDashboardPage.css';

const InventoryDashboardPage = () => {
  return (
    <div className="inventory-dashboard-page">
      <h1>Inventory Dashboard</h1>
      <InventoryDashboardTable />
    </div>
  );
};

export default InventoryDashboardPage;
