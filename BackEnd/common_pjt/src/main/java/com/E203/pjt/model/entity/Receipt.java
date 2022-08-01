package com.E203.pjt.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


import javax.persistence.Column;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "receipts")
public class Receipt {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "receipt_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer receiptSeq;

  @JsonBackReference
  @ManyToOne(targetEntity = Party.class)
  @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
  private Party party;

  @Column(name = "file_url", length = 200)
  private String fileUrl;

  @Column(name = "file_name", length = 45)
  private String fileName;
}
