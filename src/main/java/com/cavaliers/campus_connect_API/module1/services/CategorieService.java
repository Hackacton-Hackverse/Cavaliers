package com.cavaliers.campus_connect_API.module1.services;

import com.cavaliers.campus_connect_API.module1.model.Categorie;
import com.cavaliers.campus_connect_API.module1.repository.CategorieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class CategorieService {
    @Autowired
    private CategorieRepository categorieRepository;
    public Categorie createCategorie(Categorie c){
        return categorieRepository.save(c);
    }
    public List<Categorie> getAll(){
        return categorieRepository.findAll();
    }
    public Categorie getById(UUID id){
        return categorieRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Categorie introuvable"));
    }
    public Categorie update(UUID id, Categorie categorie){
        Optional<Object> s = Optional.ofNullable(categorieRepository.findById(id).map(a -> {
            a.setDescription(categorie.getDescription());
            a.setTitre(categorie.getTitre());
            return categorieRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return categorieRepository.findById(id).get();
    }
    public Boolean delete(UUID id){
        categorieRepository.deleteById(id);
        return true;
    }
}
