import axios from 'axios';

const API_URL = 'http://localhost:8000';  // Make sure this matches your backend port

export const fetchSalesData = async (
  startDate,
  endDate,
  page = 1,
  sortBy = 'net_profit',
  sortOrder = 'desc',
  accountTitles = [],
  search = '',
  groupBy = 'asin'
) => {
  try {
    console.log('salesApi: Fetching sales data with params:', { startDate, endDate, page, sortBy, sortOrder, accountTitles, search, groupBy });
    const response = await axios.get(`${API_URL}/sales-per-day-per-product`, {
      params: {
        start_date: startDate,
        end_date: endDate,
        page,
        sort_by: sortBy,
        sort_order: sortOrder,
        account_titles: accountTitles.join(','),
        search,
        group_by: groupBy,
      },
    });
    console.log('salesApi: Response:', response.data);
    return response.data;
  } catch (error) {
    console.error('salesApi: Error fetching sales data:', error.response ? error.response.data : error.message);
    throw new Error(error.response?.data?.detail || 'An unexpected error occurred while fetching sales data');
  }
};

export const fetchSalesColumns = async (groupBy = 'asin') => {
  try {
    const columns = [
      'id', 'accounts', 'sku', 'fnsku', 'brand', 'orders', 'units', 'canceled_orders',
      'shipped', 'refunded', 'promo_units', 'non_promo_units', 'non_promo_revenue',
      'sales', 'revenue', 'velocity', 'fba_commissions', 'commissions', 'cogs', 'net_profit', 'ppc_orders',
      'ppc_impressions', 'ppc_clicks', 'ppc_sales', 'ppc_cost', 'tacos',
      'ppc_conversions', 'page_views', 'sessions', 'unit_session_percentage',
      'ppc_product_sales', 'ppc_product_cost', 'ppc_product_clicks',
      'ppc_product_impressions', 'ppc_video_sales', 'ppc_video_cost',
      'ppc_video_clicks', 'ppc_video_impressions'
    ];
    return columns;
  } catch (error) {
    console.error('Error fetching sales columns:', error.response ? error.response.data : error.message);
    throw error;
  }
};

export const fetchAccountTitles = async () => {
  try {
    const response = await axios.get(`${API_URL}/account-titles`);
    return response.data;
  } catch (error) {
    console.error('Error fetching account titles:', error.response ? error.response.data : error.message);
    throw error;
  }
};
