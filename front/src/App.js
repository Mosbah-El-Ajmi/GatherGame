import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p>
          Adventure Assemble
        </p>
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
      </header>
    </div>
  );
}

export default App;
