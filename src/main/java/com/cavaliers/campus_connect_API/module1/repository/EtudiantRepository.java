package com.cavaliers.campus_connect_API.module1.repository;

import com.cavaliers.campus_connect_API.module1.model.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;
@Repository
public interface EtudiantRepository extends JpaRepository<Etudiant, UUID> {
    @Query("select e from Etudiant e where e.matricule = ?1")
    Etudiant findByMatricule(String matricule);
}
