package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.CrimeCategory;
import com.E203.pjt.repository.CrimeCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CrimeCategoryServiceImpl implements CrimeCategoryService{

    @Autowired
    private CrimeCategoryRepository crimeCategoryRepository;
    @Override
    public List<CrimeCategory> getAllCodes() {
        return crimeCategoryRepository.findAll();
    }

}
