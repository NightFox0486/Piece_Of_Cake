package com.E203.pjt.model.entity;

import java.time.LocalDateTime;

import javax.persistence.*;

import lombok.*;

@Entity
//@Getter
//@Setter
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "parties")
public class Party {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer partySeq;

  @ManyToOne(targetEntity = User.class)
  @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  // @Column(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
  private Integer userSeq;

  @Column(name = "party_code", length = 3, nullable = false)
  private String partyCode;

  @Column(name = "party_title", length = 100, nullable = false)
  private String partyTitle;

  @Column(name = "party_content", columnDefinition = "TEXT", nullable = false)
  private String partyContent;

  @Column(name = "party_reg_dt", length = 45, columnDefinition = "DATETIME", nullable = false)
  private LocalDateTime partyRegDt;

  @Column(name = "party_rdv_lat", length = 20)
  private Integer partyRdvLat;

  @Column(name = "party_rdv_lng", length = 20)
  private String partyRdvLng;

  @Column(name = "party_member_num_total", nullable = false)
  private Integer partyMemberNumTotal;

  @Column(name = "party_member_num_current", nullable = false)
  private Integer partyMemberNumCurrent;

  @Column(name = "party_rdv_dt", columnDefinition = "DATETIME")
  private LocalDateTime partyRdvDt;

  @Column(name = "party_addr", length = 100)
  private String partyAddr;

  @Column(name = "party_addr_detail", length = 100)
  private String partyAddrDetail;

  @Column(name = "status", columnDefinition = "TINYINT default '0'", nullable = false)
  private Integer partyStatus;

  @Column(name = "item_link", length = 200)
  private String itemLink;

  @Column(name = "total_amount", length = 20)
  private String totalAmount;
}