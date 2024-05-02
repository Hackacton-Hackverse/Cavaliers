package com.cavaliers.campus_connect_API.module1.controllers;

import com.cavaliers.campus_connect_API.module1.model.Categorie;
import com.cavaliers.campus_connect_API.module1.services.CategorieService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping(path = "/categorie")
@CrossOrigin("*")
@Tag(name = "Categorie")
public class CategorieController {
    @Autowired
    private CategorieService categorieService;

    @GetMapping(path = "/{id}")
    public Categorie getById(@PathVariable UUID id){
        return categorieService.getById(id);
    }
    @GetMapping
    public List<Categorie> getAll(){
        return categorieService.getAll();
    }
    @PostMapping
    public Categorie createCategorie(@RequestBody Categorie categorie){
        return categorieService.createCategorie(categorie);
    }
    @PutMapping(path = "/{id}")
    public Categorie update(@PathVariable UUID id,@RequestBody Categorie categorie){
        return categorieService.update(id, categorie);
    }
    @DeleteMapping(path = "/{id}")
    public Boolean delete(@PathVariable UUID id){
        return categorieService.delete(id);
    }
}
