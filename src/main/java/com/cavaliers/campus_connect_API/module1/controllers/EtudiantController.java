package com.cavaliers.campus_connect_API.module1.controllers;

import com.cavaliers.campus_connect_API.module1.model.Etudiant;
import com.cavaliers.campus_connect_API.module1.services.EtudiantService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "/etudiant")
@CrossOrigin("*")
@Tag(name = "Etudiant")
public class EtudiantController {
     @Autowired
     private EtudiantService etudiantService;

     @PostMapping
     public Etudiant createStudent(@RequestBody Etudiant etudiant){
         return etudiantService.createEtudiant(etudiant);
     }
     @GetMapping
     public List<Etudiant> getAllStudent(){
         return etudiantService.getAllEtudiant();
     }
     @PostMapping(path = "/authenticate")
     public Etudiant autheticate(@RequestBody Etudiant etudiant){
         return etudiantService.autheticate(etudiant);
     }
     @GetMapping(path ="/{id}")
     public Etudiant getById(@PathVariable UUID id){
         return etudiantService.getById(id);
     }
     @PutMapping("/{id}")
     public Etudiant update(@PathVariable UUID id, @RequestBody Etudiant etudiant){
         return etudiantService.update(id, etudiant);
     }
     @PutMapping(path = "/activate/{id}")
     public Etudiant activate(@PathVariable UUID id){
         return etudiantService.activateOrDeactivate(id,true);
     }
    @PutMapping(path = "/deactivate/{id}")
    public Etudiant deactivate(@PathVariable UUID id){
        return etudiantService.activateOrDeactivate(id,true);
    }
}
