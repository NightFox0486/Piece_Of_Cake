package com.E203.pjt.service;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.res.UserResVO;
import org.springframework.stereotype.Service;

public interface LoginService {
    UserResVO kakaoLogin(UserReqVO userReqVO);
}
