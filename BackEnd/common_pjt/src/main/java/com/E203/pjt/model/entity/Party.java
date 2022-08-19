package com.E203.pjt.model.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
//@ToString
@Table(name = "parties")
public class Party {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer partySeq;

    @JsonBackReference
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    private User user;

    @Column(name = "party_code", length = 3, nullable = false)
    private String partyCode;

    @Column(name = "party_title", length = 100, nullable = false)
    private String partyTitle;

    @Column(name = "party_content", columnDefinition = "TEXT", nullable = false)
    private String partyContent;

    @Column(name = "party_bookmark_count", columnDefinition = "INT UNSIGNED")
    private Integer partyBookmarkCount;

    @CreationTimestamp
    @Column(name = "party_reg_dt", columnDefinition = "TIMESTAMP default now()")
    private LocalDateTime partyRegDt;

    @CreationTimestamp
    @Column(name = "party_upd_dt", columnDefinition = "TIMESTAMP default now()")
    private LocalDateTime partyUpdDt;

    @CreationTimestamp
    @Column(name = "party_rdv_dt", columnDefinition = "TIMESTAMP default now()")
    private LocalDateTime partyRdvDt;

    @Column(name = "party_rdv_lat", length = 20)
    private String partyRdvLat;

    @Column(name = "party_rdv_lng", length = 20)
    private String partyRdvLng;

    @Column(name = "party_member_num_total", nullable = false)
    private Integer partyMemberNumTotal;

    @Column(name = "party_member_num_current", nullable = false)
    private Integer partyMemberNumCurrent;

    @Column(name = "party_addr", length = 100)
    private String partyAddr;

    @Column(name = "party_addr_detail", length = 100)
    private String partyAddrDetail;

    @Column(name = "party_status", columnDefinition = "TINYINT default '0'")
    private Integer partyStatus;

    @Column(name = "item_link", length = 200)
    private String itemLink;

    @Column(name = "total_amount", length = 20)
    private String totalAmount;

    @Column(name = "party_main_image_url")//, columnDefinition = "default \"assets/images/harry.png\"")
    private String partyMainImageUrl;

    @JsonManagedReference
    @OneToMany(mappedBy = "party", cascade = {CascadeType.REMOVE}, orphanRemoval = true)
//    @OneToMany(mappedBy = "party", cascade = {CascadeType.ALL}, orphanRemoval = true)
    private List<MyParty> myPartyList;

    @JsonManagedReference
    @OneToMany(mappedBy = "party", cascade = {CascadeType.REMOVE}, orphanRemoval = true)
//    @OneToMany(mappedBy = "party", cascade = {CascadeType.ALL}, orphanRemoval = true)
    private List<Bookmark> bookmarkList;

    @JsonManagedReference
    @OneToMany(mappedBy = "party", cascade = {CascadeType.REMOVE}, orphanRemoval = true)
//    @OneToMany(mappedBy = "party", cascade = {CascadeType.ALL}, orphanRemoval = true)
    private List<Photo> photoList;

    @JsonManagedReference
    @OneToMany(mappedBy = "party", cascade = {CascadeType.REMOVE}, orphanRemoval = true)
//    @OneToMany(mappedBy = "party", cascade = {CascadeType.ALL}, orphanRemoval = true)
    private List<Receipt> receiptList;
}
