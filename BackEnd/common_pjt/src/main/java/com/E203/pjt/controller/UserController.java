package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.service.UserService;


@RestController
public class UserController {
  @Autowired
  private final UserService userService;

  public UserController(UserService userService) {
    this.userService = userService;
  }

  @GetMapping(value="/users")
  public List<User> getAllUsers() {
    List<User> userList = userService.getAllUsers();
    for (User user : userList) {
      System.out.println(user.getUserSeq() + " : " + user.getUserNickname());
    }
    return userList;
  }

  @PostMapping(value = "/users")
  public void createUsers(User user) {
    System.out.println(user);
    System.out.println(userService.createUser(user));
  }


}
