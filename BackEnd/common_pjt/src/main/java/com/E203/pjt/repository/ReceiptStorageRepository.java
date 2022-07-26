package com.E203.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.ReceiptStorage;

@Repository
public interface ReceiptStorageRepository extends JpaRepository<ReceiptStorage, Integer>{
}
