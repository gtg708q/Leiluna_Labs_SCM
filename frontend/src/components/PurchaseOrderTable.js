import React, { useState, useEffect } from 'react';
import { fetchPurchaseOrders } from '../api/procurementApi';
import './PurchaseOrderTable.css';

function formatDate(dateString) {
  if (!dateString) return 'N/A';
  const date = new Date(dateString);
  return date.toLocaleDateString('en-US', { year: 'numeric', month: '2-digit', day: '2-digit' });
}

const PurchaseOrderTable = () => {
  const [purchaseOrders, setPurchaseOrders] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    console.log('PurchaseOrderTable useEffect triggered');
    const loadPurchaseOrders = async () => {
      try {
        console.log('Fetching purchase orders...');
        const data = await fetchPurchaseOrders();
        console.log('Received data:', data);
        setPurchaseOrders(data);
      } catch (err) {
        console.error('Failed to load purchase orders:', err);
        console.error('Error details:', err.response?.data);
        setError('Failed to load purchase orders. Please try again later.');
      } finally {
        setLoading(false);
      }
    };

    loadPurchaseOrders();
  }, []);

  console.log('Rendering PurchaseOrderTable', { loading, error, purchaseOrders });

  if (loading) return <div>Loading...</div>;
  if (error) return <div className="error-message">Error loading purchase orders. Please try again later.</div>;

  return (
    <table className="purchase-order-table">
      <thead>
        <tr>
          <th>ID</th>
          <th>Date Issued</th>
          <th>PO Number</th>
          <th>Supplier</th>
          <th>Status</th>
          <th>Total Amount</th>
        </tr>
      </thead>
      <tbody>
        {purchaseOrders.map((po) => (
          <tr key={po.id}>
            <td>{po.id}</td>
            <td>{formatDate(po.date_issued)}</td>
            <td>{po.po_number || 'N/A'}</td>
            <td>{po.supplier || 'N/A'}</td>
            <td>{po.status || 'N/A'}</td>
            <td>{po.total_amount != null ? `$${Number(po.total_amount).toFixed(2)}` : 'N/A'}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
};

export default PurchaseOrderTable;
