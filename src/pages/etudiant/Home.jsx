import React, { useEffect, useState } from 'react'
import "./../../styles/student_home_style.css"
import notif from "../../assets/notif.png"
import user_img from "../../assets/user_img-2.png"
import { AccountBalanceWallet, Place, Search } from '@mui/icons-material'
import office from "../../assets/office.jpeg"
import agenda from "../../assets/agenda.png"
import home from "../../assets/home.png"
import applied from "../../assets/applied.png"

export default function Home() {
    const [data, setData] = useState([
        {
            "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            "titre": "string",
            "pays": "string",
            "entreprise": "string",
            "ville": "string",
            "quartier": "string",
            "time": "string",
            "experiance": "string",
            "description": "string",
            "active": true,
            "postulants": [
                {
                    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                    "matricule": "string",
                    "lastName": "string",
                    "firstName": "string",
                    "phone": "string",
                    "email": "string",
                    "password": "string",
                    "active": true
                }
            ],
            "categorie": {
                "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                "titre": "string",
                "description": "string"
            },
            "salaire": 0
        }
    ])
    const [job, setJob] = useState({
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "titre": "string",
        "pays": "string",
        "entreprise": "string",
        "ville": "string",
        "quartier": "string",
        "time": "string",
        "experiance": "string",
        "description": "string",
        "active": true,
        "postulants": [
            {
                "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
                "matricule": "string",
                "lastName": "string",
                "firstName": "string",
                "phone": "string",
                "email": "string",
                "password": "string",
                "active": true
            }
        ],
        "categorie": {
            "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
            "titre": "string",
            "description": "string"
        },
        "salaire": 0
    })


    const postuler = () => {
        const requestOptions = {
            method: "PUT",
            redirect: "follow"
        };
        let user = JSON.parse(localStorage.getItem("etudiant"));

        fetch("http://localhost:4000/offre/postuler/" + job.id + "/" + user.id, requestOptions)
            .then((response) => response.text())
            .then((result) => console.log(result))
            .catch((error) => console.error(error));
    }
    useEffect(() => {
        const requestOptions = {
            method: "GET",
            redirect: "follow"
        };

        fetch("http://localhost:4000/offre", requestOptions)
            .then((response) => response.text())
            .then((result) => setData(JSON.parse(result)))
            .catch((error) => console.error(error));
    }, [])
    return (
        <div>
            <section id="Student_home">
                <div id="home_header">
                    <div id="header">
                        <div id="welcome">
                            Hello, let's find <p> Your job !!</p>
                        </div>
                        <div id="user_info">
                            <div id="notif">
                                <img src={notif} alt=""
                                //style="height: 20px; width: 20px;"
                                />
                            </div>
                            <div id="user_pic">
                                <img src={user_img} alt="" />
                            </div>
                            <div id="user_name">
                                Little Isa
                            </div>
                        </div>
                    </div>
                    <div id="label_tab">
                        <div id="find_job">
                            find job
                        </div>
                        <div id="My_job">
                            My job
                        </div>
                        <div id="How_it_works">
                            How it works
                        </div>
                    </div>
                </div>
                <div id="student_content">
                    <div id="search">
                        <div id="search_header">
                            <div id="search_space">
                                <div id="search_zone">
                                    <div>
                                        <Search />
                                        <input type="text" placeholder="Job, Entreprise ..." />
                                    </div>
                                    <div>
                                        <Place />
                                        <input type="text" placeholder="location" />
                                    </div>
                                    <div>
                                        <AccountBalanceWallet />
                                        <input type="text" placeholder="salary" />
                                    </div>
                                </div>
                                <button type="submit">
                                    Find Jobs
                                </button>
                            </div>
                            <div id="results_number">
                                <div id="number">
                                    50 Active job
                                </div>
                                <div id="sort">
                                    Sort by popular job
                                </div>
                            </div>
                        </div>
                        <div id="job_list">
                            {data.map((item, i) => <div className="job1" key={i} onClick={() => setJob(item)}>
                                <div id="job1_header" >
                                    <img src={home} className="logo1" />
                                    <div id="job_tittle">
                                        <h3>{item.titre}</h3>
                                        <div id="categories">
                                            <span>{item.categorie.titre}</span>
                                            <span>{item.experiance} d'expériance </span>
                                            <span>{item.entreprise}</span>
                                        </div>
                                    </div>
                                    <img src={agenda} alt="agd" />
                                </div>
                                <div id="summary">
                                    {item.description}
                                </div>
                                <div className="complement">
                                    <span>
                                        {item.time}
                                    </span>
                                    <span>
                                        <Place />
                                        <p>
                                            {item.pays} | {item.ville} | {item.quartier}
                                        </p>
                                    </span>
                                    <span>
                                        <img src={applied} alt="" />
                                        <p className="number_applied"> {item.postulants.length} </p>
                                        <p> Applied </p>
                                    </span>
                                </div>
                            </div>)}

                        </div>
                    </div>
                    <div id="job_description">
                        <div id="job_img">
                            <img src={office} alt="job_img" />
                        </div>
                        <fieldset id="description">
                            <legend>
                                <img src="images/home.png" alt="" />
                            </legend>
                            <div className="creation_date">
                                created 2 days ago
                            </div>
                            <div className="job_header">
                                <h3>{job.titre}</h3>
                                <img src={agenda} alt="img_agenda" />
                            </div>
                            <div className="location">
                                <span className="society_name">
                                    {job.entreprise}
                                </span>
                                <span className="society_name">
                                    {job.pays}
                                </span>
                                <span className="city">
                                    {job.ville}
                                </span>
                                <span className="country">
                                    {job.quartier}
                                </span>
                            </div>
                            <div className="charact_zone">
                                <div className="charact_tittle">
                                    <span>time</span>
                                    <span>Experience</span>
                                    <span>Month Salary</span>
                                </div>
                                <div className="charact">
                                    <span>{job.time}</span>
                                    <span>{job.experiance}s</span>
                                    <span>XAF  {job.salaire}</span>
                                </div>
                            </div>
                            <div className="about">
                                <h4>About Job</h4>
                                <p>{job.description} </p>
                            </div>
                            <div className="Apply" onClick={() => postuler()}>
                                Postuler
                            </div>
                        </fieldset>
                    </div>
                </div>
            </section>
        </div>
    )
}
