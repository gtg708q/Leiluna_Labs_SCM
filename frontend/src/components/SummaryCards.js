import React from 'react';
import './SummaryCards.css'; // We'll create this file for styling

const formatCurrency = (value) => {
  const absValue = Math.abs(Math.round(value));
  return value < 0 ? `-$${absValue.toLocaleString()}` : `$${absValue.toLocaleString()}`;
};

const formatNumber = (value) => {
  return Math.round(value).toLocaleString();
};

const SummaryCard = ({ title, value, subtitle }) => (
  <div className="summary-card">
    <h3>{title}</h3>
    <p className="value">{value}</p>
    {subtitle && <p className="subtitle">{subtitle}</p>}
  </div>
);

const SummaryCards = ({ summary }) => {
  return (
    <div className="summary-cards-container">
      <SummaryCard
        title="Sales Amount"
        value={`Gross Sales: ${formatCurrency(summary.gross_sales)}`}
        subtitle={`Revenue: ${formatCurrency(summary.revenue)}`}
      />
      <SummaryCard
        title="Sales Volumes"
        value={`Orders: ${formatNumber(summary.orders)}`}
        subtitle={`Units: ${formatNumber(summary.units)}`}
      />
      <SummaryCard
        title="Net Before COGS"
        value={formatCurrency(summary.net_before_cogs)}
        subtitle={`Refunds: ${formatNumber(summary.refunds)} COGS: ${formatCurrency(summary.cogs)}`}
      />
      <SummaryCard
        title="Net Profit"
        value={formatCurrency(summary.net_profit)}
        subtitle={`PPC: ${formatCurrency(summary.ppc_cost)} ROI: ${((summary.net_profit / summary.cogs) * 100).toFixed(2)}%`}
      />
    </div>
  );
};

export default SummaryCards;
