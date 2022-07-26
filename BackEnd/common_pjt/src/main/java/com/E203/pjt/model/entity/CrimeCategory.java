package com.E203.pjt.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "crime_category")
public class CrimeCategory {
    @Id
    @Column(name = "crime_code", length = 3, nullable = false)
    private String crimeCode;

    @Column(name = "crime_name", length = 45)
    private String crimeName;
}
