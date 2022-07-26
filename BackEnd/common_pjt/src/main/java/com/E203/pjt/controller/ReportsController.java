package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.E203.pjt.model.entity.Reports;
import com.E203.pjt.model.service.ReportsService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class ReportsController {
    @Autowired
    private final ReportsService reportsService;

    public ReportsController(ReportsService reportsService) {
        this.reportsService = reportsService;
    }

    @PostMapping(value = "/reports")
    public void createUsers(Reports reports) {
        System.out.println(reports);
        System.out.println(reportsService.createReports(reports));
    }

}
