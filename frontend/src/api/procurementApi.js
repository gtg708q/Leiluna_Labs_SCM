import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000', // Remove the /api
});

export const fetchPurchaseOrders = async (page = 1, limit = 10) => {
  try {
    console.log('Sending request to:', '/purchase-orders');
    const response = await api.get('/purchase-orders', {
      params: { page, items_per_page: limit }
    });
    console.log('Response:', response);
    return response.data;
  } catch (error) {
    console.error('Error fetching purchase orders:', error);
    console.error('Error response:', error.response);
    throw error;
  }
};
