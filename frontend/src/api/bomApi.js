import axios from 'axios';
import { API_BASE_URL } from './axiosConfig';

export const getBOMs = async () => {
  try {
    const response = await axios.get(`${API_BASE_URL}/boms`);
    return response.data;
  } catch (error) {
    console.error('Error fetching BOMs:', error);
    throw error;
  }
};
