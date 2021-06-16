import './App.css';
import React, { useState, useEffect } from 'react';

let userCredentials = new Map()

function App() {

  const [bilkentId, setBilkentId] = useState('');
  const [password, setPassword] = useState('');
  const [showSuccess, setShowSuccess] = useState(false);
  const [validId, setValidId] = useState(true);
  const [validPassword, setValidPassword] = useState(true);

  // Initialize the user credentials
  useEffect(() => {
    userCredentials.set("54414028", "zAencs1t");
    userCredentials.set("88955417", "e6EFjvaH");
    userCredentials.set("87350380", "KJYKAN60");
    userCredentials.set("78526224", "j1CAZRfC");
    userCredentials.set("78256364", "vZHqjmQ5");
  }, [])

  // Validate the inputs
  function validateCredentials(bilkentId, password) {
    if (!userCredentials.has(bilkentId)) {
      setValidId(false);
    } 
    else if (userCredentials.get(bilkentId) !== password){
      setValidPassword(false);
    } else {
      setShowSuccess(true);
      setValidId(true);
      setValidPassword(true);
    }
  }

  const handleSubmit = (event) => {
    event.preventDefault();
    //alert(`Id: ${bilkentId}, Password: ${password}`);
    validateCredentials(bilkentId, password);
  }

  return (
    <div className="App">
      <h1>Bilkent University Login</h1>
      <form onSubmit={handleSubmit}>
        <label>Bilkent ID</label>
        <input type="text" placeholder="Enter your Bilkent ID" name="bilkentId" value={bilkentId} onChange={(e) => setBilkentId(e.target.value)}></input>
        <br />
        <label>Password</label><input type="password" placeholder="Enter your password" name="password" value={password} onChange={(e) => setPassword(e.target.value)}></input>
        <br />
        <input type="submit" style={{ marginTop: "10px" }}></input>
      </form>
      {!validPassword && <div class="invalid-id" style={{ marginTop: "10px" }}>Invalid Password</div>}
      {!validId && <div class="invalid-id" style={{ marginTop: "10px" }}>Invalid Id</div>}
      {showSuccess && <div class='success-message' style={{ marginTop: "10px" }}>Login Successful</div>}
    </div>
  );
}

export default App;
