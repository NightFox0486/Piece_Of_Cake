package com.E203.pjt.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Report;
import com.E203.pjt.model.service.ReportService;



@RestController
@RequestMapping("/report")
public class ReportController {
    @Autowired
    private final ReportService reportService;



    public ReportController(ReportService reportService) {
        this.reportService = reportService;

    }

    //유저신고
    @PostMapping(value = "/chat")
    public void createReportUser(@RequestBody Report report) {
        System.out.println(report);
        System.out.println(reportService.createReportUser(report));
    }

    //게시글신고
    @PostMapping(value = "/party")
    public void createReportParty(@RequestBody Report report) {
        System.out.println(report);
        System.out.println(reportService.createReportParty(report));
    }

    }



