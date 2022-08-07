package com.E203.pjt.model.dto.req;

import com.E203.pjt.model.entity.User;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserReqVO {
    private String userEmail;
    private String userPhone;
    private String userNickname;
    private String userPassword;
    private String userImage;
    private Integer userRating;
    private String userLat;
    private String userLng;
    private String userAccount;
    private String userKakaoLoginId;

    public User toEntity() {
        User user = new User();
        user.setUserEmail(userEmail);
        user.setUserPhone(userPhone);
        user.setUserNickname(userNickname);
        user.setUserPassword(userPassword);
        user.setUserImage(userImage);
        user.setUserRating(userRating);
        user.setUserLat(userLat);
        user.setUserLng(userLng);
        user.setUserAccount(userAccount);
        user.setUserKakaoLoginId(userKakaoLoginId);
        return user;
    }
}
