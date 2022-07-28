package com.E203.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.Report;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report, Integer>{

}
