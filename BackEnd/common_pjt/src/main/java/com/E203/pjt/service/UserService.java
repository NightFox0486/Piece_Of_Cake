package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.entity.User;

public interface UserService {
  User createUser(User user);
  void deleteUser(Integer user_seq);
  List<User> getAllUsers();
}
