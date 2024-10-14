import React from 'react';
import { Link } from 'react-router-dom';
import './Sidebar.css'; // We'll create this file for styling

const Sidebar = () => {
  return (
    <nav className="sidebar">
      <ul>
        <li><Link to="/">Home</Link></li>
        <li><Link to="/procurement">Procurement</Link></li>
      </ul>
    </nav>
  );
};

export default Sidebar;
