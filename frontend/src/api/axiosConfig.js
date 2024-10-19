import axios from 'axios';

export const API_BASE_URL = 'http://localhost:8000/api/v1';  // Adjust if necessary

const api = axios.create({
  baseURL: API_BASE_URL,
});

export default api;
