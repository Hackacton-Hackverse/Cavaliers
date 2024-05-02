package com.cavaliers.campus_connect_API.module1.controllers;


import com.cavaliers.campus_connect_API.module1.model.Offre;
import com.cavaliers.campus_connect_API.module1.services.OffreService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "/offre")
@CrossOrigin("*")
@Tag(name = "Offre")
public class OffreController {
    @Autowired
    private OffreService offreService;

    @PostMapping
    public Offre createOffre(@RequestBody Offre offre){
        return offreService.createOffre(offre);
    }
    @GetMapping
    public List<Offre> getAll(){
        return offreService.getAll();
    }
    @GetMapping(path = "/active")
    public List<Offre> getActive(){
        return offreService.getActive();
    }
    @GetMapping(path = "/{id}")
    public Offre getById(@PathVariable UUID id){
        return offreService.getById(id);
    }

    @PutMapping(path = "/{id}")
    public Offre update(@PathVariable UUID id, @RequestBody Offre offre){
        return offreService.updateOffre(id, offre);
    }
    @PutMapping(path = "/postuler/{id_offre}/{id_etudiant}")
    public Offre postuler(@PathVariable UUID id_offre,@PathVariable UUID id_etudiant){
        return offreService.postuler(id_offre,id_etudiant);
    }
    @GetMapping(path = "/categorie/{id}")
    public List<Offre> findByCategorie(@PathVariable UUID id){
        return offreService.findByCategory(id);
    }
    @PutMapping(path = "/activate/{id}")
    public Offre activate(@PathVariable UUID id){
        return offreService.activate(id);
    }
    @PutMapping(path = "/deactivate/{id}")
    public Offre deactivate(@PathVariable UUID id){
        return offreService.deactivate(id);
    }
}
