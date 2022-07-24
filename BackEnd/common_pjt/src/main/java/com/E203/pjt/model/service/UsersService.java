package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.Users;

public interface UsersService {
  Users createUsers(Users users);
  void deleteUsers(Integer user_seq);
  List<Users> getAllUsers();
}
