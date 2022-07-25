package com.E203.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.Reports;

@Repository
public interface ReportsRepository extends JpaRepository<Reports, Integer>{
}
