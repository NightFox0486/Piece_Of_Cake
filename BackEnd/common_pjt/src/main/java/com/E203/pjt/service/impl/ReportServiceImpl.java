package com.E203.pjt.service.impl;

import com.E203.pjt.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Report;
import com.E203.pjt.repository.ReportRepository;


@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {
    private final ReportRepository reportRepository;

    @Override
    public Report createReportUser(Report report) {
        return reportRepository.save(report);
    }

    @Override
    public Report createReportParty(Report report) {
        return reportRepository.save(report);
    }
}
