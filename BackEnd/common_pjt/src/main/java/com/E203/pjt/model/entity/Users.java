package com.E203.pjt.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class Users {
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

  @Column(name = "user_password", nullable = false, length = 20)
  private String userPassword;

  @Column(name = "user_image", nullable = false, length = 45)
  private String userImage;

  @Column(name = "user_rating", nullable = false)
  private Integer userRating;

  @Column(name = "user_lat", nullable = false, length = 20)
  private String userLat;

  @Column(name = "user_lng", nullable = false, length = 20)
  private String userLng;

  @Column(name = "user_account", nullable = false, length = 45)
  private String userAccount;
}
