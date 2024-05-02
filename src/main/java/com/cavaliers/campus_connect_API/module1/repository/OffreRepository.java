package com.cavaliers.campus_connect_API.module1.repository;

import com.cavaliers.campus_connect_API.module1.model.Categorie;
import com.cavaliers.campus_connect_API.module1.model.Offre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;
@Repository
public interface OffreRepository extends JpaRepository<Offre, UUID> {
    @Query("select o from Offre o where o.categorie = ?1")
    List<Offre> findByCategorie(Categorie c);
    @Query("select o from Offre o where o.active = ?1")
    List<Offre> findActive(Boolean t);
}
