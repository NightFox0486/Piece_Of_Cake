package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
  @Autowired
  private UserRepository userRepository;

  @Override
  public User createUser(User user) {
    return userRepository.save(user);
  }

  @Override
  public void deleteUser(Integer user_seq) {
    // TODO Auto-generated method stub
    
  }

  @Override
  public List<User> getAllUsers() {
    return userRepository.findAll();
  }
  
}
