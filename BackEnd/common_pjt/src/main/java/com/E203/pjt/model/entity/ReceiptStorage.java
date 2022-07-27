package com.E203.pjt.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import java.time.LocalDateTime;

import javax.persistence.Column;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "receipt_storage")
public class ReceiptStorage {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "receipt_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer receiptSeq;

  @Column(name = "storage_url", length = 200)
  private String storageUrl;

  @Column(name = "file_name", length = 45)
  private String fileName;

  @Column(name = "file_reg_dt", columnDefinition = "DATETIME")
  private LocalDateTime fileRegDt;

  @ManyToOne(targetEntity = Party.class)
  @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer partySeq;
}
