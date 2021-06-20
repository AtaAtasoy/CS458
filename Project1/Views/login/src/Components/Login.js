import React, { useState, useEffect } from 'react';
import { useNavigate } from "react-router-dom";
import { useTranslation } from "react-i18next";


let userCredentials = new Map()

export default function Login() {

    const {t, i18n } = useTranslation();
    const timeZoneOffset = new Date().getTimezoneOffset();

    const navigate = useNavigate();
    const [bilkentId, setBilkentId] = useState('');
    const [password, setPassword] = useState('');
    const [showSuccess, setShowSuccess] = useState(false);
    const [validId, setValidId] = useState(true);
    const [validPassword, setValidPassword] = useState(true);
    const [submitted, setSubmitted] = useState(false);
    const [validTimezone, setValidTimezone] = useState(true);

    // Initialize the user credentials
    useEffect(() => {

        console.log("1. ", timeZoneOffset);

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
                navigate("/home", { state: bilkentId });
            }
        }
    }

    const handleSubmit = (event) => {
        event.preventDefault();
        setSubmitted(true);
        if (timeZoneOffset !== -180){ // GMT+3 has offset of -180
            setValidTimezone(false);
        }
        else {
            validateCredentials(bilkentId, password);
        }
    }

    return (
        <div className="Login" style={{marginTop: "50px"}}>
            <form onSubmit={handleSubmit}>
                <label>{t('Bilkent ID')}</label>
                <input type="text" name="bilkentId" value={bilkentId} onChange={(e) => setBilkentId(e.target.value)}></input>
                <br />
                <label>{t('Password')}</label>
                <input type="password" name="password" value={password} onChange={(e) => setPassword(e.target.value)}></input>
                <br />
                <input type="submit" style={{ marginTop: "10px" }} value={t('Login')}></input>
            </form>
            {!validTimezone && <div class="message" id="invalid_timezone" style={{ marginTop: "10px" }}>{t('Wrong Timezone')}</div>}
            {submitted && bilkentId.length === 0 && <div class="message" id="no_blank_id" style={{ marginTop: "10px" }}>{t('Empty Bilkent ID Prompt')}</div>}
            {submitted && password.length === 0 && <div class="message" id="no_blank_password" style={{ marginTop: "10px" }}>{t('Empty Password Prompt')}</div>}
            {(!validPassword || !validId )&& <div class="message" id="invalid_password" style={{ marginTop: "10px" }}>{t('Invalid Credential Prompt')}</div>}
        </div>
    );
}

