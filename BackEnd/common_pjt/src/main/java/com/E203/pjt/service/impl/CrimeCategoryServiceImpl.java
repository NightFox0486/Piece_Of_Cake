package com.E203.pjt.service.impl;

import com.E203.pjt.model.entity.CrimeCategory;
import com.E203.pjt.repository.CrimeCategoryRepository;
import com.E203.pjt.service.CrimeCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CrimeCategoryServiceImpl implements CrimeCategoryService {
    private final CrimeCategoryRepository crimeCategoryRepository;

    @Override
    public List<CrimeCategory> getAllCodes() {
        return crimeCategoryRepository.findAll();
    }
}
