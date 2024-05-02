import React, { useState } from 'react'
import './../../styles/student_style.css'
import img_login_stud from "../../assets/img_login_stud.png"
import {  Person, RemoveRedEye } from '@mui/icons-material'
import { json, useNavigate } from "react-router-dom"


export default function Login() {
    const [etudiant, setEtudiat] = useState({
        matricule: "",
        password: ""
    })
    const navigate = useNavigate()
    const login = () => {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        const raw = JSON.stringify({
            "matricule": etudiant.matricule,
            "password": etudiant.password
        });

        const requestOptions = {
            method: "POST",
            headers: myHeaders,
            body: raw,
            redirect: "follow"
        };

        fetch("http://localhost:4000/etudiant/authenticate", requestOptions)
            .then((response) => response.text())
            .then((result) => {
                let r = JSON.parse(result)
                console.log(r);
                if (r.id) {
                    localStorage.setItem("etudiant", JSON.stringify(r));
                    navigate("/home");
                }else{
                    alert("Matriclule ou Mot de passe incorrect")
                }
            })
            .catch((error) => console.error(error));
    }
    return (
        <div className='etudiant'>
            <section id="student_login">
                <div id="img_login_stud">
                    <img src={img_login_stud} alt="img_login_stud" />
                </div>
                <div id="student_form">
                    <fieldset>
                        <h3> Student </h3>
                        <form>
                            <div id="user_name">
                                <div id="form_input">
                                    <label htmlFor="user_name">Matricule : </label>
                                    <input id="name_input" value={etudiant.matricule} onChange={(e) => setEtudiat({ ...etudiant, matricule: e.target.value })} type="text" name="user_name" />
                                </div>
                                <span className="toggle_button">
                                    <Person />
                                </span>
                            </div>
                            <div id="password_form" >
                                <div id="password">
                                    <div className="form-input">
                                        <label htmlFor="mdp">password:</label>
                                        <input id="password_input" value={etudiant.password} onChange={(e) => setEtudiat({ ...etudiant, password: e.target.value })} type="password" name="pwd" />
                                    </div>
                                    <span className="toggle_button">
                                        <RemoveRedEye />
                                    </span>
                                </div>
                            </div>
                        </form>
                        <div className="submit_login">
                            <div className="">
                                <button name="submssion" className='btn' onClick={()=>login()}>Login</button>
                            </div>
                        </div>
                    </fieldset>
                    <div id="not_sign">
                        <p>
                            you don't have an account ?
                        </p>
                        <a href="Sign.com"> Sign in </a>
                    </div>
                </div>
            </section>
        </div>
    )
}
