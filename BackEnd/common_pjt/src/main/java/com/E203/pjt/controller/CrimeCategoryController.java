package com.E203.pjt.controller;

import com.E203.pjt.model.entity.CrimeCategory;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.E203.pjt.service.CrimeCategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Api(tags = {"1.CrimeCategory"})
@RestController
@RequestMapping(value = "/crimecategory")
@RequiredArgsConstructor
public class CrimeCategoryController {
    private final CrimeCategoryService crimeCategoryService;

    @GetMapping(value="/crimecode")
    @ApiOperation(value = "죄명 ",notes = "목록")
    public void getAllCodes(HttpServletRequest req, HttpServletResponse res) {
        List<CrimeCategory> codeList = crimeCategoryService.getAllCodes();
        for (CrimeCategory code : codeList) {
            System.out.println(code.getCrimeCode() + " : " + code.getCrimeName());
        }

    }
}
