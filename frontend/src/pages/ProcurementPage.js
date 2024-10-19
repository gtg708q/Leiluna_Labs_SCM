import React from 'react';
import PurchaseOrderTable from '../components/PurchaseOrderTable';
import './ProcurementPage.css';

const ProcurementPage = () => {
  console.log('Rendering ProcurementPage');
  return (
    <div className="procurement-page">
      <PurchaseOrderTable />
    </div>
  );
};

export default ProcurementPage;
