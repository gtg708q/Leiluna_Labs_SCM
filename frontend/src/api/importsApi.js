import axiosInstance from './axiosConfig';

export const runImport = async (importName) => {
  try {
    console.log(`Attempting to run import for: ${importName}`);
    console.log(`URL: ${axiosInstance.defaults.baseURL}/imports/run`);
    const response = await axiosInstance.post('/imports/run', { import_name: importName });
    console.log('Import response:', response.data);
    return response.data;
  } catch (error) {
    console.error('Error in runImport:', error.response || error);
    throw error;
  }
};

export const getLastImportDate = async (importName) => {
  try {
    console.log(`Attempting to get last import date for: ${importName}`);
    console.log(`URL: ${axiosInstance.defaults.baseURL}/imports/last-date/${importName}`);
    const response = await axiosInstance.get(`/imports/last-date/${importName}`);
    console.log('Last import date response:', response.data);
    return response.data.lastImportDate ? new Date(response.data.lastImportDate).toLocaleString() : 'Never';
  } catch (error) {
    console.error('Error in getLastImportDate:', error.response || error);
    return 'Never';
  }
};
