import React, { useState } from 'react';
import AuthProvider, { useAuth } from "./auth.js";
import '../App.css';

function CreerLogSignPage() {
  const [logData, setLogData] = useState({
    name: '',
    password: ''
  });
  
  const [signData, setSignData] = useState({
    name: '',
    password: '',
    email: ''
  });

  const [ShowLogin, setShowLogin] = useState(false);
  const [ShowSignin, setShowSignin] = useState(false);
  
  const handleChange = (e) => {
    const { name, value } = e.target;
    setLogData({ ...logData, [name]: value });
    setSignData({ ...signData, [name]: value });
  };

  const auth = useAuth();
  const handleLogin = (e) => {
    e.preventDefault();
    if (logData.name !== '' && logData.password !== ''){
      auth.loginAction(logData);
      setShowLogin(false);
      setShowSignin(false);
      return
    }
    alert("Merci de remplir les deux champs");
  };
  
  const handleSignIn = (e) => {
    e.preventDefault();
    if (signData.name !== '' && signData.password !== '' && signData.email !== ''){
      // à faire
      return
    }
    alert("Merci de remplir les trois champs");
  };

  return (

    <div className="container">
	
	
      <button onClick={() => setShowLogin(true)}>Se connecter</button>
      {ShowLogin && (
        <div className="modal">
          <div className="modal-content">
            <span className="close" onClick={() => setShowLogin(false)}>&times;</span>
            <form onSubmit={handleLogin}>
              <div>
                <label>Nom:</label>
                <input type="text" name="name" value={logData.name} onChange={handleChange} />
              </div>
              <div>
                <label>Mot de passe:</label>
                <textarea name="password" value={logData.password} onChange={handleChange} />
              </div>
              <button type="submit">Connection</button>
            </form>
          </div>
        </div>
      )}
      
      
      <button className="spaceUp" onClick={() => setShowSignin(true)}>S'inscrire</button>
      {ShowSignin && (
        <div className="modal">
          <div className="modal-content">
            <span className="close" onClick={() => setShowSignin(false)}>&times;</span>
            <form onSubmit={handleSignIn}>
              <div>
                <label>Nom:</label>
                <input type="text" name="name" value={signData.name} onChange={handleChange} />
              </div>
              <div>
                <label>Mot de passe:</label>
                <textarea name="password" value={signData.password} onChange={handleChange} />
              </div>
              <div>
                <label>Addresse e-mail:</label>
                <textarea name="email" value={signData.email} onChange={handleChange} />
              </div>
              <button type="submit">Inscription</button>
            </form>
          </div>
        </div>
      )}
	
	</div>

  );
}

export default CreerLogSignPage;
