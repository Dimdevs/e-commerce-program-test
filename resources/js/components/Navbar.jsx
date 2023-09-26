import React from 'react';
import ReactDOM from 'react-dom/client';

function Navbar() {
    return (
        <nav className="navbar navbar-expand-lg bg-primary">
        <div className="container">
          <a className="navbar-brand text-white fw-bold" href="#">E - Commerce</a>
          <button className="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav ms-auto">
              <li className="nav-item">
                <a className="nav-link text-white active" aria-current="page" href="#">Home</a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-white" href="#">Product</a>
              </li>
              <li className="nav-item">
                <a className="nav-link text-white" href="#">About</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
  
export default Navbar;

if (document.getElementById('navbar')) {
    const Index = ReactDOM.createRoot(document.getElementById("navbar"));
    Index.render(
        <React.StrictMode>
            <Navbar/>
        </React.StrictMode>
    )
}
