import React from 'react';
import PurchaseOrderTable from '../components/PurchaseOrderTable';

const ProcurementPage = () => {
  console.log('Rendering ProcurementPage');
  return (
    <div>
      <h1>Procurement Page</h1>
      <PurchaseOrderTable />
    </div>
  );
};

export default ProcurementPage;
