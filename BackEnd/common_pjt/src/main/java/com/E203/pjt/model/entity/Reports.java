package com.E203.pjt.model.entity;


import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "reports")
public class Reports {

    @Id
    @GeneratedValue
    @Column(name = "report_seq", nullable = false)
    private Integer reportSeq;

    @Column(name = "report_content", columnDefinition = "TEXT", nullable = true)
    private String reportContent;

    @Column(name = "crime_code", length = 3, nullable = false, unique = true)
    private String crimeCode;

    @Column(name = "reporting_user_seq", nullable = false)
    private Integer reportingUserSeq;

    @Column(name = "reported_user_seq", nullable = false)
    private Integer reportedUserSeq;
}
