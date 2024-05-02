package com.cavaliers.campus_connect_API.module1.repository;

import com.cavaliers.campus_connect_API.module1.model.Categorie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.UUID;

public interface CategorieRepository extends JpaRepository<Categorie, UUID> {
}
