package com.cavaliers.campus_connect_API.module1.services;

import com.cavaliers.campus_connect_API.module1.model.Etudiant;
import com.cavaliers.campus_connect_API.module1.model.Offre;
import com.cavaliers.campus_connect_API.module1.repository.CategorieRepository;
import com.cavaliers.campus_connect_API.module1.repository.EtudiantRepository;
import com.cavaliers.campus_connect_API.module1.repository.OffreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.UUID;

@Service
public class OffreService {
    @Autowired
    private OffreRepository offreRepository;
    @Autowired
    private CategorieRepository categorieRepository;
    @Autowired
    private EtudiantRepository etudiantRepository;

    public Offre createOffre(Offre offre){
        offre.setCreatedDate(LocalDate.now());
        return offreRepository.save(offre);
    }
    public Offre updateOffre(UUID id, Offre offre){
        Optional<Object> s = Optional.ofNullable(offreRepository.findById(id).map(a -> {
            a.setDescription(offre.getDescription());
            a.setTitre(offre.getTitre());
            a.setPays(offre.getPays());
            a.setTime(offre.getTime());
            a.setQuartier(offre.getQuartier());
            a.setVille(offre.getVille());
            a.setExperiance(offre.getExperiance());
            a.setSalaire(offre.getSalaire());
            a.setEntreprise(offre.getEntreprise());
            return offreRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return offreRepository.findById(id).get();
    }
    public List<Offre> getAll(){
        return offreRepository.findAll();
    }
    public List<Offre> getActive(){
        return offreRepository.findActive(true);
    }
    public List<Offre> findByCategory(UUID id){
        return offreRepository.findByCategorie(categorieRepository.findById(id).get());
    }
    public Offre activate(UUID id){
        Optional<Object> s = Optional.ofNullable(offreRepository.findById(id).map(a -> {
            a.setActive(true);
            return offreRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return offreRepository.findById(id).get();
    }
    public Offre deactivate(UUID id){
        Optional<Object> s = Optional.ofNullable(offreRepository.findById(id).map(a -> {
            a.setActive(false);
            return offreRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return offreRepository.findById(id).get();
    }
    public Offre getById(UUID id){
        return offreRepository.findById(id).orElseThrow(() -> new EntityNotFoundException("Offre introuvable"));
    }

    public Offre postuler(UUID idOffre, UUID idEtudiant) {
        Etudiant etudiant = etudiantRepository.findById(idEtudiant).orElseThrow(() -> new EntityNotFoundException("Etudiant introuvable"));
        Optional<Object> s = Optional.ofNullable(offreRepository.findById(idOffre).map(a -> {
            a.getPostulants().add(etudiant);
            return offreRepository.save(a);
        }).orElseThrow(() -> new EntityNotFoundException("Offre introuvable")));
        return offreRepository.findById(idOffre).get();
    }
}
