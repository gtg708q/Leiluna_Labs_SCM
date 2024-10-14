import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000',  // Make sure this matches your backend URL
});

export default api;
