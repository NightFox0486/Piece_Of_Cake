package com.E203.pjt.controller;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.service.UserService;


@RestController
@RequiredArgsConstructor
public class UserController {
  private final UserService userService;

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
