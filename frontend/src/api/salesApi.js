import axios from 'axios';

const API_URL = 'http://localhost:8000';

export const fetchSalesData = async (startDate, endDate, page = 1, sortBy = 'net_profit', sortOrder = 'desc') => {
  try {
    const response = await axios.get(`${API_URL}/sales`, {
      params: {
        start_date: startDate,
        end_date: endDate,
        page,
        sort_by: sortBy,
        sort_order: sortOrder,
      },
    });
    return response.data;
  } catch (error) {
    console.error('Error fetching sales data:', error);
    throw error;
  }
};
