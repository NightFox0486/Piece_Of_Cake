package com.E203.pjt.service.impl;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.res.UserResVO;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.LoginService;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
    private final UserRepository userRepository;
    private final UserService userService;

    @Override
    public UserResVO kakaoLogin(UserReqVO userReqVO) {
        User user = userRepository.findByUserKakaoLoginId(userReqVO.getUserKakaoLoginId());
        UserResVO userResVO = new UserResVO();
        if (user!=null) {
            user.setUserNickname(userReqVO.getUserNickname());
            userRepository.save(user);

            userResVO.setUserSeq(user.getUserSeq());
            userResVO.setUserEmail(user.getUserEmail());
            userResVO.setUserPhone(user.getUserPhone());
            userResVO.setUserNickname(user.getUserNickname());
            userResVO.setUserPassword(user.getUserPassword());
            userResVO.setUserImage(user.getUserImage());
            userResVO.setUserRating(user.getUserRating());
            userResVO.setUserLat(user.getUserLat());
            userResVO.setUserLng(user.getUserLng());
            userResVO.setUserAccount(user.getUserAccount());
            userResVO.setUserKakaoLoginId(user.getUserKakaoLoginId());
        } else {
            userResVO = userService.createKakaoUser(userReqVO);
        }
        return userResVO;
    }
}
