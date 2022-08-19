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
  public UserResVO createKakaoUser(UserReqVO userReqVO) {
    User user = userReqVO.toEntity();
    user.setUserRating(50.0);
    User result = userRepository.save(user);
    UserResVO userResVO = new UserResVO();
    userResVO.setUserSeq(result.getUserSeq());
    userResVO.setUserEmail(result.getUserEmail());
    userResVO.setUserPhone(result.getUserPhone());
    userResVO.setUserNickname(result.getUserNickname());
    userResVO.setUserPassword(result.getUserPassword());
    userResVO.setUserImage(result.getUserImage());
    userResVO.setUserRating(result.getUserRating());
    userResVO.setUserLat(result.getUserLat());
    userResVO.setUserLng(result.getUserLng());
    userResVO.setUserAccount(result.getUserAccount());
    userResVO.setUserKakaoLoginId(result.getUserKakaoLoginId());
    return userResVO;
  }

  @Override
  public UserResVO updateUserLatLng(UserReqVO userReqVO) {
    User user = userRepository.findByUserKakaoLoginId(userReqVO.getUserKakaoLoginId());
    user.setUserLat(userReqVO.getUserLat());
    user.setUserLng(userReqVO.getUserLng());
    user = userRepository.save(user);
    UserResVO userResVO = new UserResVO();
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
    return userResVO;
  }

  @Override
  public UserResVO createUser(UserReqVO userReqVO) {
    User user = userReqVO.toEntity();
    User result = userRepository.save(user);
    UserResVO userResVO = new UserResVO();
    userResVO.setUserSeq(result.getUserSeq());
    userResVO.setUserEmail(result.getUserEmail());
    userResVO.setUserPhone(result.getUserPhone());
    userResVO.setUserNickname(result.getUserNickname());
    userResVO.setUserPassword(result.getUserPassword());
    userResVO.setUserImage(result.getUserImage());
    userResVO.setUserRating(result.getUserRating());
    userResVO.setUserLat(result.getUserLat());
    userResVO.setUserLng(result.getUserLng());
    userResVO.setUserAccount(result.getUserAccount());
    userResVO.setUserKakaoLoginId(result.getUserKakaoLoginId());
    return userResVO;
  }

  @Override
  public void deleteUser(Integer user_seq) {

  }

  @Override
  public List<User> getAllUsers() {
    return userRepository.findAll();
  }

  @Override
  public UserResVO detailUser(Integer userSeq) {
    User user = userRepository.findByUserSeq(userSeq);
    UserResVO userResVO = new UserResVO();
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
    return userResVO;
  }
}
