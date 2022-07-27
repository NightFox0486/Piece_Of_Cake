package com.E203.pjt.controller;

import com.E203.pjt.model.entity.CrimeCategory;
import com.E203.pjt.model.service.CrimeCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CrimeCategoryController {

    @Autowired
    private final CrimeCategoryService crimeCategoryService;

    public CrimeCategoryController(CrimeCategoryService crimeCategoryService) {
        this.crimeCategoryService = crimeCategoryService;
    }

    @GetMapping(value="/crimecode")
    public void getAllCodes() {
        List<CrimeCategory> codeList = crimeCategoryService.getAllCodes();
        for (CrimeCategory code : codeList) {
            System.out.println(code.getCrimeCode() + " : " + code.getCrimeName());
        }

    }
}
