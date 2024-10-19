import React, { useState, useEffect } from 'react';
import { runImport, getLastImportDate } from '../api/importsApi';
import './DataImportsPage.css';

const ImportButton = ({ name, source, onImport }) => {
  const [lastImportDate, setLastImportDate] = useState('Loading...');
  const [importStatus, setImportStatus] = useState(null);

  useEffect(() => {
    getLastImportDate(name)
      .then(setLastImportDate)
      .catch(() => setLastImportDate('Error fetching date'));
  }, [name]);

  const handleImport = async () => {
    setImportStatus('Running...');
    try {
      const result = await runImport(name);
      let statusMessage = `Completed: ${result.message}\n`;
      if (result.details) {
        if (name === "Sales Data" || name === "Sales Statistics") {
          statusMessage += `Total new records: ${result.details.total_new_records}\n`;
          statusMessage += `Total updated records: ${result.details.total_updated_records}\n`;
          statusMessage += `Duration: ${result.details.duration}\n\n`;
          statusMessage += "Account details:\n";
          result.details.account_results.forEach(account => {
            statusMessage += `${account.account}:\n`;
            statusMessage += `  New records: ${account.new_records}\n`;
            statusMessage += `  Updated records: ${account.updated_records}\n`;
          });
        } else if (name === "BOMs") {
          statusMessage += `Updated: ${result.details.updated}\n`;
          statusMessage += `Added: ${result.details.added}\n`;
          statusMessage += `Deleted: ${result.details.deleted}\n`;
        } else if (name === "Purchase Orders" || 
                   name === "Finished Goods" || 
                   name === "BOM Inventory" || 
                   name === "Finished Goods Inventory") {
          statusMessage += `New records: ${result.details.new_records}\n`;
          statusMessage += `Updated records: ${result.details.updated_records}\n`;
          statusMessage += `Duration: ${result.details.duration}\n`;
        }
      }
      setImportStatus(statusMessage);
      // Refresh the last import date
      const newDate = await getLastImportDate(name);
      setLastImportDate(newDate);
    } catch (error) {
      console.error('Error in handleImport:', error);
      setImportStatus(`Error: ${error.response?.data?.detail || error.message}`);
    }
  };

  return (
    <div className="import-button-container">
      <button onClick={handleImport}>{`Import ${name}`}</button>
      <div className="import-info">
        <p>Source: {source}</p>
        <p>Last Import: {lastImportDate}</p>
      </div>
      {importStatus && <pre className="import-status">{importStatus}</pre>}
    </div>
  );
};

const DataImportsPage = () => {
  const imports = [
    { name: 'Sales Data', source: 'SellerLegend API: Sales Per Day Per Product' },
    { name: 'Sales Statistics', source: 'SellerLegend API: Sales Statistics Dashboard' },
    { name: 'BOMs', source: 'Google Sheets: BOM Master Sheet' },
    { name: 'Finished Goods', source: 'Google Sheets: Finished Goods Sheet' },
    { name: 'BOM Inventory', source: 'Google Sheets: BOM Inventory Sheet' },
    { name: 'Finished Goods Inventory', source: 'Google Sheets: Finished Goods Inventory Sheet' },
    { name: 'Purchase Orders', source: 'Google Sheets: Purchase Order Log' },
  ];

  return (
    <div className="data-imports-page">
      <h1>Data Imports</h1>
      {imports.map((importItem) => (
        <ImportButton
          key={importItem.name}
          name={importItem.name}
          source={importItem.source}
        />
      ))}
    </div>
  );
};

export default DataImportsPage;
