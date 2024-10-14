import React from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Sidebar from './components/Sidebar';
import ProcurementPage from './pages/ProcurementPage';
import './App.css'; // Add this line

function App() {
  return (
    <Router>
      <div className="app-container">
        <Sidebar />
        <main className="main-content">
          <Routes>
            <Route path="/" element={<div>Home Page</div>} />
            <Route path="/procurement" element={<ProcurementPage />} />
          </Routes>
        </main>
      </div>
    </Router>
  );
}

export default App;
