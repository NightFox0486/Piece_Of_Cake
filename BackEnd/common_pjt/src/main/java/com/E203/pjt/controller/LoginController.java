package com.E203.pjt.controller;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.res.UserResVO;
import com.E203.pjt.service.LoginService;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
public class LoginController {
    private final LoginService loginService;
    private final UserService userService;

    //  kakao login
    //  service에서 detail을 kakao와 일반 따로 둔 이유는 kakao는 객체로 받고 일반은 seq로 받기 때문
    //  kakao를 객체로 받는 이유는 kakao login 하면 회원이면 userKakaoLoginId만 가지고 판별이 되지만
    //      회원이 아니면 생성해야하기 때문
    @PostMapping(value = "/kakao-login")
    public UserResVO kakaoLogin(@RequestBody UserReqVO userReqVO, HttpSession session) {
        System.out.println("[LoginController] kakaoLogin() called");
        UserResVO userResVO = loginService.kakaoLogin(userReqVO);
        session.setAttribute("userSeq", userResVO.getUserSeq());
        return userResVO;
    }

//    @GetMapping(value = "login")
//    public UserResVO login(@RequestParam UserLoginVO userLoginVO) {
//
//    }
}
