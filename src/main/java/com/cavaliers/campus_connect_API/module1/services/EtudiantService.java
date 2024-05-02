package com.cavaliers.campus_connect_API.module1.services;

import com.cavaliers.campus_connect_API.module1.model.Etudiant;
import com.cavaliers.campus_connect_API.module1.repository.EtudiantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class EtudiantService {
    @Autowired
    private EtudiantRepository etudiantRepository;
    public Etudiant createEtudiant(Etudiant etudiant){
        Etudiant e = null;
        e = etudiantRepository.findByMatricule(etudiant.getMatricule());
        if ( e!=null){
            throw new IllegalArgumentException("Etudiant existant");
        }else{
            etudiant.setActive(true);
            return etudiantRepository.save(etudiant);
        }
    }
    public List<Etudiant> getAllEtudiant(){
        return etudiantRepository.findAll();
    }

    public Etudiant getById(UUID id){
        return etudiantRepository.findById(id).get();
    }
    public Etudiant autheticate(Etudiant etudiant){
        Etudiant e = null;
        e = etudiantRepository.findByMatricule(etudiant.getMatricule());
        if (e==null || !etudiant.getPassword().equals(e.getPassword())|| !e.getActive()){
            throw new IllegalArgumentException("error of information");
        }else {
            return e;
        }
    }
    public Etudiant update(UUID id, Etudiant etudiant){
        Optional<Object> s = Optional.ofNullable(etudiantRepository.findById(id).map(a -> {
            a.setPhone(etudiant.getPhone());
            a.setEmail(etudiant.getEmail());
            a.setFirstName(etudiant.getFirstName());
            a.setLastName(etudiant.getLastName());
            a.setMatricule(etudiant.getMatricule());
            a.setPassword(etudiant.getPassword());
            return etudiantRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return etudiantRepository.findById(id).get();
    }
    public Etudiant activateOrDeactivate(UUID id, Boolean value){
        Optional<Object> s = Optional.ofNullable(etudiantRepository.findById(id).map(a -> {
            a.setActive(value);
            return etudiantRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return etudiantRepository.findById(id).get();
    }

}
