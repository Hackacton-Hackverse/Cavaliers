import { useState } from 'react'
import "./styles/index.css"
import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Home from './pages/etudiant/Home'
import Login from './pages/etudiant/Login'
import Register from './pages/etudiant/Register'
import AdminLogin from './pages/admin/AdminLogin'
import AdminDashboard from './pages/admin/AdminDashboard'
import AdminCategorie from './pages/admin/AdminCategorie'
import AdminEtudiant from './pages/admin/AdminEtudiant'

function App() {

  return (
    <BrowserRouter>
      <Routes>
        <Route element={<Home/>} path='/home'/>
        <Route element={<Login/>} path='/'/>
        <Route element={<Register/>} path='/register'/>
        <Route element={<AdminLogin/>} path='/admin/login'/>
        <Route element={<AdminDashboard/>} path='/admin/dashboard'/>
        <Route element={<AdminCategorie/>} path='/admin/categorie'/>
        <Route element={<AdminEtudiant/>} path='/admin/etudian'/>
      </Routes>
    </BrowserRouter>
  )
}

export default App
