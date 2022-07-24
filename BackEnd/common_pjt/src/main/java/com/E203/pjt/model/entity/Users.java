package com.E203.pjt.model.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
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
  @Column(name = "user_seq")
  private Integer userSeq;

  @Column(name = "user_email", length = 45)
  private String userEmail;

  @Column(name = "user_phone", length = 20)
  private String userPhone;

  @Column(name = "user_nickname", length = 20)
  private String userNickname;

  @Column(name = "user_password", length = 20)
  private String userPassword;

  @Column(name = "user_image", length = 45)
  private String userImage;

  @Column(name = "user_rating")
  private Integer userRating;

  @Column(name = "user_lat", length = 20)
  private String userLat;

  @Column(name = "user_lng", length = 20)
  private String userLng;

  @Column(name = "user_account", length = 45)
  private String userAccount;
}
