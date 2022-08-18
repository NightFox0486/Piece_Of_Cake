package com.E203.pjt.controller;


import lombok.RequiredArgsConstructor;

import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Report;
import com.E203.pjt.service.ReportService;



@RestController
@RequiredArgsConstructor
@RequestMapping("/report")
public class ReportController {
    private final ReportService reportService;

    //유저신고
    @PostMapping(value = "/chat/")
    public Report createReportUser(@RequestBody Report report) {
//        System.out.println(report);
//        System.out.println(reportService.createReportUser(report));
        Report result = reportService.createReportUser(report);
        return result;

    }

    //게시글신고
    @PostMapping(value = "/party")
    public Report createReportParty(@RequestBody Report report) {
//        System.out.println(report);
//        System.out.println(reportService.createReportParty(report));
        Report result = reportService.createReportParty(report);
        return result;
    }

    }



