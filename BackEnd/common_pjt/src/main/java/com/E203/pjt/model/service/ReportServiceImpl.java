package com.E203.pjt.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Report;
import com.E203.pjt.repository.ReportRepository;


@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    private ReportRepository reportRepository;

    @Override
    public Report createReports(Report report) {
        return reportRepository.save(report);
    }



}
