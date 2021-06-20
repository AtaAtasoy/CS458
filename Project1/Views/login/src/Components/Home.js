import React from "react";
import { useLocation, useNavigate } from "react-router-dom";

export default function Home(){

    const { state } = useLocation();
    const navigate = useNavigate();

    console.log(state);

    function handleOnClick(e){
        e.preventDefault();
        navigate("/");
    }

    return (
        <div class="Homepage">
            <h1>Welcome {state}!</h1>
            <button onClick={handleOnClick}>Sign Out</button>
        </div>
    );
}