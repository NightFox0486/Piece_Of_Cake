package com.E203.pjt.controller;

import com.E203.pjt.model.entity.CrimeCategory;
import com.E203.pjt.service.CrimeCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CrimeCategoryController {
    private final CrimeCategoryService crimeCategoryService;

    @GetMapping(value="/crimecode")
    public void getAllCodes() {
        List<CrimeCategory> codeList = crimeCategoryService.getAllCodes();
        for (CrimeCategory code : codeList) {
            System.out.println(code.getCrimeCode() + " : " + code.getCrimeName());
        }

    }
}
