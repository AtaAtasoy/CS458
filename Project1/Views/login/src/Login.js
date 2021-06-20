import './Login.css';
import React, { useState, useEffect } from 'react';
import { useNavigate } from "react-router-dom"

let userCredentials = new Map()

export default function Login() {

    const navigate = useNavigate();
    const [bilkentId, setBilkentId] = useState('');
    const [password, setPassword] = useState('');
    const [showSuccess, setShowSuccess] = useState(false);
    const [validId, setValidId] = useState(true);
    const [validPassword, setValidPassword] = useState(true);
    const [submitted, setSubmitted] = useState(false);

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
        if (bilkentId.length !== 0 && password.length !== 0) {
            if (!userCredentials.has(bilkentId)) {
                setValidId(false);
            }
            else if (userCredentials.get(bilkentId) !== password) {
                setValidId(true);
                setValidPassword(false);
            } else {
                setShowSuccess(true);
                setValidId(true);
                setValidPassword(true);
                navigate("/home", { logged_in_id: bilkentId} );
            }
        }
    }

    const handleSubmit = (event) => {
        event.preventDefault();
        //alert(`Id: ${bilkentId}, Password: ${password}`);
        setSubmitted(true);
        validateCredentials(bilkentId, password);
    }

    return (
        <div className="Login">
            <h1>Bilkent University Login</h1>
            <form onSubmit={handleSubmit}>
                <label>Bilkent ID</label>
                <input type="text" placeholder="Enter your Bilkent ID" name="bilkentId" value={bilkentId} onChange={(e) => setBilkentId(e.target.value)}></input>
                <br />
                <label>Password</label><input type="password" placeholder="Enter your password" name="password" value={password} onChange={(e) => setPassword(e.target.value)}></input>
                <br />
                <input type="submit" style={{ marginTop: "10px" }}></input>
            </form>
            {submitted && bilkentId.length === 0 && <div class="message" id="no_blank_id" style={{ marginTop: "10px" }}>Bilkent ID cannot be blank</div>}
            {submitted && password.length === 0 && <div class="message" id="no_blank_password" style={{ marginTop: "10px" }}>Password cannot be blank</div>}
            {!validPassword && <div class="message" id="invalid_password" style={{ marginTop: "10px" }}>Invalid Password</div>}
            {!validId && <div class="message" id="invalid_id" style={{ marginTop: "10px" }}>Invalid Id</div>}
            {showSuccess && <div class="message" id="success" style={{ marginTop: "10px" }}>Login Successful</div>}
        </div>
    );
}

