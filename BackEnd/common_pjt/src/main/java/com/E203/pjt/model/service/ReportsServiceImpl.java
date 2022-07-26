package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Reports;
import com.E203.pjt.repository.ReportsRepository;


@Service
public class ReportsServiceImpl implements ReportsService{
    @Autowired
    private ReportsRepository reportRepository;

    @Override
    public Reports createReports(Reports reports) {
        return reportRepository.save(reports);
    }



}
