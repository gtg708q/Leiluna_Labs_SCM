import React, { useState, useEffect } from 'react';
import { getBOMs } from '../api/bomApi';
import BOMTable from '../components/BOMTable';
import './BOMListPage.css';

const BOMListPage = () => {
  const [boms, setBOMs] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchBOMs = async () => {
      try {
        const data = await getBOMs();
        if (Array.isArray(data) && data.length > 0) {
          setBOMs(data);
        } else {
          console.error('Received invalid data format:', data);
          setError('Received invalid data format from the server');
        }
      } catch (err) {
        console.error('Error fetching BOMs:', err);
        setError(`Failed to fetch BOM data: ${err.message}`);
      } finally {
        setLoading(false);
      }
    };

    fetchBOMs();
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="bom-list-page">
      {boms.length > 0 ? (
        <BOMTable data={boms} />
      ) : (
        <div>No BOM data available</div>
      )}
    </div>
  );
};

export default BOMListPage;
