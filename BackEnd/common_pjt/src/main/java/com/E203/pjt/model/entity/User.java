package com.E203.pjt.model.entity;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
  private Integer userSeq;

  @Column(name = "user_email", nullable = false, length = 45)
  private String userEmail;

  @Column(name = "user_phone", nullable = false, length = 20)
  private String userPhone;

  @Column(name = "user_nickname", nullable = false, length = 20)
  private String userNickname;

  @Column(name = "user_image", nullable = false, length = 200)
  private String userImage;

  @Column(name = "user_password", nullable = true, length = 20)
  private String userPassword;

  @Column(name = "user_rating", nullable = true)
  private Integer userRating;

  @Column(name = "user_lat", nullable = true, length = 20)
  private String userLat;

  @Column(name = "user_lng", nullable = true, length = 20)
  private String userLng;

  @Column(name = "user_account", nullable = true, length = 45)
  private String userAccount;

  // kakao login
  @Column(name = "user_kakao_login_id", nullable = true)
  private String userKakaoLoginId;

  @JsonManagedReference
  @OneToMany(mappedBy="user", cascade = {CascadeType.REMOVE}, orphanRemoval = true)
  private List<Party> partyList;

}
