import React, { useState, useEffect } from 'react';
import { getFinishedGoods } from '../api/finishedGoodsApi';
import FinishedGoodsTable from '../components/FinishedGoodsTable';
import './FinishedGoodsPage.css'; // Add this import

const FinishedGoodsPage = () => {
  const [finishedGoods, setFinishedGoods] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchFinishedGoods = async () => {
      try {
        const data = await getFinishedGoods();
        console.log('Fetched data:', data); // Add this line for debugging
        if (Array.isArray(data) && data.length > 0) {
          setFinishedGoods(data);
        } else {
          console.error('Received invalid data format:', data);
          setError('Received invalid data format from the server');
        }
      } catch (err) {
        console.error('Error fetching finished goods:', err);
        setError(`Failed to fetch finished goods data: ${err.message}`);
      } finally {
        setLoading(false);
      }
    };

    fetchFinishedGoods();
  }, []);

  if (loading) return <div>Loading...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="finished-goods-page">
      {finishedGoods.length > 0 ? (
        <ErrorBoundary>
          <FinishedGoodsTable data={finishedGoods} />
        </ErrorBoundary>
      ) : (
        <div>No finished goods data available</div>
      )}
    </div>
  );
};

class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false, error: null, errorInfo: null };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    this.setState({
      error: error,
      errorInfo: errorInfo
    });
    console.error("Caught an error:", error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return (
        <div>
          <h2>Something went wrong.</h2>
          <details style={{ whiteSpace: 'pre-wrap' }}>
            {this.state.error && this.state.error.toString()}
            <br />
            {this.state.errorInfo && this.state.errorInfo.componentStack}
          </details>
        </div>
      );
    }

    return this.props.children;
  }
}

export default FinishedGoodsPage;
