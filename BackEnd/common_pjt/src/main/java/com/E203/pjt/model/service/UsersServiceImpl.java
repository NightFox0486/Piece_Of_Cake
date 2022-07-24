package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Users;
import com.E203.pjt.repository.UsersRepository;

@Service
public class UsersServiceImpl implements UsersService{
  @Autowired
  private UsersRepository userRepository;

  @Override
  public Users createUsers(Users users) {
    return userRepository.save(users);
  }

  @Override
  public void deleteUsers(Integer user_seq) {
    // TODO Auto-generated method stub
    
  }

  @Override
  public List<Users> getAllUsers() {
    return userRepository.findAll();
  }
  
}
