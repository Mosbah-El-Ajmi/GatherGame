import React from 'react';
import logo from './Gather.png'; // Assurez-vous d'avoir le fichier logo.png dans le dossier assets
import './Header.css';

function Header() {
  return (
    <header>
      <nav>
        <div className="logo">
          <img src={logo} alt="Logo" />
        </div>
        <ul>
          <li><a href="#accueil">Accueil</a></li>
          <li><a href="#mission">Mission</a></li>
          <li><a href="#classement">Classement</a></li>
          <li><a href="#dashboard">Dashboard</a></li>
          <li><a href="#creer-mission">Créer Mission</a></li>
        </ul>
      </nav>
    </header>
  );
}

export default Header;
