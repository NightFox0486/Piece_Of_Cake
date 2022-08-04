package com.E203.pjt.service.impl;

import java.util.List;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.res.UserResVO;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.UserRepository;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
  private final UserRepository userRepository;

  @Override
  public UserResVO createUser(UserReqVO userReqVO) {
    User user = userReqVO.toEntity();
    User result = userRepository.save(user);
    UserResVO userResVO = new UserResVO();
    userResVO.setUserSeq(result.getUserSeq());
    userResVO.setUserNickname(result.getUserNickname());
    return userResVO;
  }

  @Override
  public void deleteUser(Integer user_seq) {

  }

  @Override
  public List<User> getAllUsers() {
    return userRepository.findAll();
  }
}
