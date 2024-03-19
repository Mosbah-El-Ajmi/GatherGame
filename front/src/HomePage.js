import './App.css';
import Header from './components/Header.js';

function HomePage() {
  return (
    <div className="App">
	  <Header />
      <footer className="App-header">
        <div className="main">
          <div class="coteacote">
          <form>
            <input type="submit" value="Créer un compte"/>
            <input type="submit" value="Connexion"/>
          </form>
          </div>
          <p>
            Rejoindre une partie
          </p>
          <form>
            <label>
              <input type="text" name="code" placeholder="code"/>
            </label>
            <input type="submit" value="→"/>
          </form>
        </div>
      </footer>
    </div>
  );
}

export default HomePage;