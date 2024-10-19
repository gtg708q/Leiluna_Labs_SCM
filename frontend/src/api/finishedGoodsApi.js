import api from './axiosConfig';

export const getFinishedGoods = async () => {
  try {
    const response = await api.get('/api/v1/finished-goods');
    console.log('API Response:', response);
    return response.data;
  } catch (error) {
    console.error('Error fetching finished goods:', error);
    throw error;
  }
};
