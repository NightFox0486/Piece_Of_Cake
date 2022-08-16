package com.E203.pjt.model.entity;

import javax.persistence.*;


import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "photos")
public class Photo {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "photo_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer photoSeq;

  @JsonBackReference
  @ManyToOne(targetEntity = Party.class)
  @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
//  @MapsId("partySeq")
  private Party party;

  @Column(name = "file_url", length = 200)
  private String fileUrl;

  @Column(name = "file_name", length = 45)
  private String fileName;
}
