import React, { useEffect, useState } from 'react'
import "../style/home.css"
import AddIcon from '@mui/icons-material/Add';

export default function Home() {
    const [ajout, setAjout] = useState(false)
    const [edit, setEdit] = useState(false)
    const [data, setData] = useState([{
        titre: "",
        description: ""
    }])
    const [tache, setTache] = useState({
        id: 1,
        active: true,
        description: "",
        titre: ""
    })

    const ajoutTache = () => {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        const raw = JSON.stringify({
            "titre": tache.title,
            "description": tache.description
        });

        const requestOptions = {
            method: "POST",
            headers: myHeaders,
            body: raw,
            redirect: "follow"
        };

        fetch("http://localhost:4000/task/create", requestOptions)
            .then((response) => response.text())
            .then((result) => {
                console.log(result)
                window.location.reload()
            })
            .catch((error) => console.error(error));
    }

    const editTache = () => {
        const myHeaders = new Headers();
        myHeaders.append("Content-Type", "application/json");

        const raw = JSON.stringify({
            "titre": tache.titre,
            "description": tache.description
        });

        const requestOptions = {
            method: "PUT",
            headers: myHeaders,
            body: raw,
            redirect: "follow"
        };

        fetch("http://localhost:4000/task/" + tache.id, requestOptions)
            .then((response) => response.text())
            .then((result) => {
                console.log(result)
                window.location.reload()
            })
            .catch((error) => console.error(error));
    }

    const deleteTache = (id) => {
        const requestOptions = {
            method: "DELETE",
            redirect: "follow"
        };

        fetch("http://localhost:4000/task/" + id, requestOptions)
            .then((response) => response.text())
            .then((result) => {
                console.log(result)
                window.location.reload()
            })
            .catch((error) => console.error(error));
    }

    useEffect(() => {
        const requestOptions = {
            method: "GET",
            redirect: "follow"
        };

        fetch("http://localhost:4000/task", requestOptions)
            .then((response) => response.text())
            .then((result) => {
                setData(JSON.parse(result))
            })
            .catch((error) => console.error(error));
    }, [])
    return (
        <div>
            {ajout && <div className="modal">
                <div className="card">
                    <div className="card-header">
                        <center>
                            <h1>
                                {!edit ?
                                    <span>Ajouter Une Tâche</span>
                                    :
                                    <span>Editer Une Tâche</span>
                                }

                            </h1>
                        </center>
                        <hr />
                    </div>
                    <div className="body">
                        <p>
                            <label htmlFor="title">Titre</label>
                            <input type="text" id='title' name='title' value={tache.titre}
                                onChange={(e) => { setTache({ ...tache, titre: e.target.value }) }}
                            />
                        </p>
                        <p>
                            <label htmlFor="description">Description</label>
                            <input type="text" id='description' name='description' value={tache.description}
                                onChange={(e) => { setTache({ ...tache, description: e.target.value }) }}
                            />
                        </p>
                    </div>
                    <div className="bottom">
                        <button onClick={() => setAjout(false)}>Annuler</button>
                        {!edit ?
                            <button onClick={() => { ajoutTache() }}>Valider</button>
                            :
                            <button onClick={() => { editTache() }}>Edit</button>
                        }
                    </div>
                </div>
            </div>}

            <div className="contenu">
                <div className="titre">TÂCHE</div>
                <hr />
                <div className="corps">
                    <table>
                        <thead>
                            <tr>
                                <th>Titre</th>
                                <th>Description</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            {data.map((item, idx) => <tr key={idx}>
                                <td>{item.titre}</td>
                                <td>{item.description}</td>
                                <td>
                                    <button className=''
                                        onClick={() => {
                                            setAjout(true);
                                            setEdit(true);
                                            setTache(item)
                                        }}
                                    >Edit</button>
                                    <button className='' onClick={() => deleteTache(item.id)}>Delete</button>
                                </td>
                            </tr>)}
                        </tbody>
                    </table>
                </div>
            </div>

            <div className="add" onClick={() => {
                setAjout(true); 
                setEdit(false); 
                setTache({
                    id: 1,
                    active: true,
                    description: "",
                    titre: ""
                })
            }}>
                <AddIcon />
            </div>
        </div>
    )
}
