package com.E203.pjt.repository;

import com.E203.pjt.model.entity.CrimeCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CrimeCategoryRepository extends JpaRepository<CrimeCategory, String > {
}
