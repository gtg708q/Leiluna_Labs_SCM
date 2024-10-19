import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from './components/Sidebar';
import ProcurementPage from './pages/ProcurementPage';
import Dashboard from './pages/Dashboard';
import FinishedGoodsPage from './pages/FinishedGoodsPage';
import BOMListPage from './pages/BOMListPage';
import DataImportsPage from './pages/DataImportsPage';  // Add this import
import './App.css';
import ErrorBoundary from './components/ErrorBoundary';

function App() {
  return (
    <Router>
      <div className="app-container">
        <Sidebar />
        <main className="main-content">
          <Routes>
            <Route path="/" element={<div>Home Page</div>} />
            <Route path="/procurement" element={<ProcurementPage />} />
            <Route path="/sales-report" element={<Dashboard />} />
            <Route path="/isku-list" element={
              <ErrorBoundary>
                <FinishedGoodsPage />
              </ErrorBoundary>
            } />
            <Route path="/bom-list" element={
              <ErrorBoundary>
                <BOMListPage />
              </ErrorBoundary>
            } />
            <Route path="/data-imports" element={
              <ErrorBoundary>
                <DataImportsPage />
              </ErrorBoundary>
            } />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;
