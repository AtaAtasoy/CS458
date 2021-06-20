import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useTranslation } from "react-i18next";

export default function Home(){

    const { state } = useLocation();
    const navigate = useNavigate();
    const {t, i18n } = useTranslation();

    console.log(state);

    function handleOnClick(e){
        e.preventDefault();
        navigate("/");
    }

    return (
        <div class="Homepage">
            <h1>{t('Welcome') + ' ' + state}!</h1>
            <button onClick={handleOnClick}>Sign Out</button>
        </div>
    );
}