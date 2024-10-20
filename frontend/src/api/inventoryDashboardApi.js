import axios from 'axios';

const API_BASE_URL = process.env.REACT_APP_API_BASE_URL || 'http://localhost:8000/api/v1';

export const fetchInventoryDashboard = async (page, itemsPerPage, status, columns, sortBy, signal) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/inventory-dashboard`, {
      params: {
        page,
        items_per_page: itemsPerPage,
        status: status || undefined,
        columns: columns.join(','),
        sort_by: sortBy.map(sort => `${sort.id},${sort.desc ? 'desc' : 'asc'}`).join(';'),
      },
      signal,
    });
    console.log("API response:", response.data);
    return response.data;
  } catch (error) {
    if (axios.isCancel(error)) {
      console.log('Request canceled:', error.message);
    } else {
      console.error('Error fetching inventory dashboard:', error);
      throw error;
    }
  }
};

export const fetchInventoryDashboardColumns = async (signal) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/inventory-dashboard/columns`, { signal });
    return response.data;
  } catch (error) {
    if (axios.isCancel(error)) {
      console.log('Request canceled:', error.message);
    } else {
      console.error('Error fetching inventory dashboard columns:', error);
      throw error;
    }
  }
};

export const fetchInventoryDashboardStatuses = async (signal) => {
  try {
    const response = await axios.get(`${API_BASE_URL}/inventory-dashboard/statuses`, { signal });
    return response.data;
  } catch (error) {
    if (axios.isCancel(error)) {
      console.log('Request canceled:', error.message);
    } else {
      console.error('Error fetching inventory dashboard statuses:', error);
      throw error;
    }
  }
};
