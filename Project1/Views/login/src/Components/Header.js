import React from "react";

export default function Header(){
    return(
        <div class="header" style={{display: "inline-flex"}}>
            <img style={{marginRight: "300px"}} src="https://w3.bilkent.edu.tr/www/wp-content/uploads/sites/5/2015/05/INGlogo-e1460465121276.jpg" alt="bilkentlogo" height="100px"/>
            <button style={{marginRight: "20px"}}>Language</button>
            <button>Reset Password</button>
        </div>
    );
}