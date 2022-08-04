package com.E203.pjt.model.dto.res;

import com.E203.pjt.model.entity.Party;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class UserResVO {
    private Integer userSeq;
    private String userEmail;
    private String userPhone;
    private String userNickname;
    private String userPassword;
    private String userImage;
    private Integer userRating;
    private String userLat;
    private String userLng;
    private String userAccount;
}
