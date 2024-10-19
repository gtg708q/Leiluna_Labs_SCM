import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000',
});

export const fetchPurchaseOrders = async (startDate, endDate, page = 1, limit = 20, status = null, signal) => {
  try {
    const params = {
      page,
      items_per_page: limit,
      start_date: startDate.toISOString().split('T')[0],
      end_date: endDate.toISOString().split('T')[0]
    };
    if (status) {
      params.status = status;
    }
    const response = await api.get('/purchase-orders', { params, signal });
    return response.data;
  } catch (error) {
    if (error.name === 'AbortError') {
      console.log('Request aborted');
    } else {
      console.error('Error fetching purchase orders:', error);
    }
    throw error;
  }
};

export const fetchPurchaseOrderColumns = async (signal) => {
  try {
    const response = await api.get('/purchase-orders/columns', { signal });
    return response.data;
  } catch (error) {
    if (error.name === 'AbortError') {
      console.log('Request aborted');
    } else {
      console.error('Error fetching purchase order columns:', error);
    }
    throw error;
  }
};
