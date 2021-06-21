import React from "react";
import { Route, Routes } from "react-router-dom";
import Login from "./Components/Login";
import Home from "./Components/Home";
import Reset from "./Components/Reset";
import Header from "./Components/Header";

function App() {
  return (
    <div>
    <Header />
    <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/home" element={<Home />} />
        <Route path="/reset" element={<Reset /> } />
    </Routes>
    </div>
  );
}

export default App;
