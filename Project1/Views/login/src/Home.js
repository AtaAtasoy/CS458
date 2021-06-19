import React from "react";
import { useLocation } from "react-router-dom";

export default function Home(){

    const { state } = useLocation();
    console.log(state);

    return (
        <h1>Welcome {state}!</h1>
    );
}