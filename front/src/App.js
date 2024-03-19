import React from 'react';
import { Route, Switch } from 'react-router-dom';
import Header from './components/Header.js';
import HomePage from './HomePage.js';
import CreerMissionPage from './CreerMissionPage.js';

function App() {
  return (
    <div>
      <Header />
      <Switch>
        <Route exact path="/" component={HomePage} />
        <Route path="/creer-mission" component={CreerMissionPage} />
      </Switch>
    </div>
  );
}

export default App;
