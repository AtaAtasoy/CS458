import React from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { useTranslation } from "react-i18next";

export default function Reset(){

    const navigate = useNavigate();
    const {t, i18n } = useTranslation();

    function handleOnClick(e){
        e.preventDefault();
        navigate("/");
    }

    return (
        <div id="Resetpage">
            <h1>{t('Reset Password Page')}!</h1>
            <button onClick={handleOnClick}>Cancel</button>
        </div>
    );
}