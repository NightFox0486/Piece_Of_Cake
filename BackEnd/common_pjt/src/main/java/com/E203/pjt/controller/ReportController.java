package com.E203.pjt.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.E203.pjt.model.entity.Report;
import com.E203.pjt.model.service.ReportService;


@RestController
public class ReportController {
    @Autowired
    private final ReportService reportService;

    public ReportController(ReportService reportService) {
        this.reportService = reportService;
    }

    @PostMapping(value = "/reports")
    public void createUsers(Report report) {
        System.out.println(report);
        System.out.println(reportService.createReports(report));
    }

}
