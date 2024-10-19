import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import './Sidebar.css'; // We'll create this file for styling

const Sidebar = () => {
  const [salesDropdownOpen, setSalesDropdownOpen] = useState(false);
  const [finishedGoodsDropdownOpen, setFinishedGoodsDropdownOpen] = useState(false);
  const [bomsDropdownOpen, setBomsDropdownOpen] = useState(false);
  const [isCollapsed, setIsCollapsed] = useState(false);

  const toggleSalesDropdown = () => {
    setSalesDropdownOpen(!salesDropdownOpen);
  };

  const toggleFinishedGoodsDropdown = () => {
    setFinishedGoodsDropdownOpen(!finishedGoodsDropdownOpen);
  };

  const toggleBomsDropdown = () => {
    setBomsDropdownOpen(!bomsDropdownOpen);
  };

  const toggleSidebar = () => {
    setIsCollapsed(!isCollapsed);
  };

  return (
    <nav className={`sidebar ${isCollapsed ? 'collapsed' : ''}`}>
      <ul className="sidebar-menu">
        <li><Link to="/">Home</Link></li>
        <li className="has-submenu">
          <button onClick={toggleSalesDropdown} className="dropdown-toggle">
            Sales
            <span className={`arrow ${salesDropdownOpen ? 'open' : ''}`}></span>
          </button>
          {salesDropdownOpen && (
            <ul className="submenu">
              <li className="submenu-item"><Link to="/sales-report">Sales Report</Link></li>
            </ul>
          )}
        </li>
        <li className="has-submenu">
          <button onClick={toggleFinishedGoodsDropdown} className="dropdown-toggle">
            Finished Goods
            <span className={`arrow ${finishedGoodsDropdownOpen ? 'open' : ''}`}></span>
          </button>
          {finishedGoodsDropdownOpen && (
            <ul className="submenu">
              <li className="submenu-item"><Link to="/isku-list">iSKU List</Link></li>
            </ul>
          )}
        </li>
        <li className="has-submenu">
          <button onClick={toggleBomsDropdown} className="dropdown-toggle">
            BOMs
            <span className={`arrow ${bomsDropdownOpen ? 'open' : ''}`}></span>
          </button>
          {bomsDropdownOpen && (
            <ul className="submenu">
              <li className="submenu-item"><Link to="/bom-list">BOM List</Link></li>
            </ul>
          )}
        </li>
        <li><Link to="/procurement">Procurement</Link></li>
        <li><Link to="/inventory">Inventory</Link></li>
        <li><Link to="/shipping">Shipping</Link></li>
        <li><Link to="/accounting">Accounting</Link></li>
        <li><Link to="/data-imports">Data Imports</Link></li>
      </ul>
      <button className="sidebar-collapse-btn" onClick={toggleSidebar}>
        {isCollapsed ? '>' : '<'}
      </button>
    </nav>
  );
};

export default Sidebar;
