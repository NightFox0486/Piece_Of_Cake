package com.E203.pjt.service.impl;

import java.util.List;

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
  public User createUser(User user) {
    return userRepository.save(user);
  }

  @Override
  public void deleteUser(Integer user_seq) {

  }

  @Override
  public List<User> getAllUsers() {
    return userRepository.findAll();
  }
}
