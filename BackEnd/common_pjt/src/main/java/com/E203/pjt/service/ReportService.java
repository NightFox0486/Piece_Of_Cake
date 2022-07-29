package com.E203.pjt.service;


import com.E203.pjt.model.entity.CrimeCategory;
import com.E203.pjt.model.entity.Report;

import java.util.List;

public interface ReportService {
    Report createReportUser(Report report);
    Report createReportParty(Report report);


}
