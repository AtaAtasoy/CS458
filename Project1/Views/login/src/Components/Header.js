import React from "react";
import { useTranslation } from "react-i18next";
import { useNavigate } from "react-router-dom";

export default function Header(){

    const {t, i18n } = useTranslation();
    const navigate = useNavigate();

    const changeLanguageHandler = (lang) =>
    {
        if (i18n.language === "en"){
            i18n.changeLanguage("tr");
        }
        else{
            i18n.changeLanguage("en");
        }
    }

    return(
        <div class="header" style={{display: "inline-flex"}}>
            <img style={{marginRight: "300px"}} src={t('bilkent_logo_url')} alt="bilkentlogo" height="100px"/>
            <button style={{marginRight: "20px"}} onClick={changeLanguageHandler}>{(t('Change Language'))}</button>
            <button onClick={()=> navigate("/reset")}>{t('Reset Password')}</button>
        </div>
    );
}