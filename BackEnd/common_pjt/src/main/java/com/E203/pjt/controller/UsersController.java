package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.E203.pjt.model.entity.Users;
import com.E203.pjt.model.service.UsersService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class UsersController {
  @Autowired
  private final UsersService usersService;

  public UsersController(UsersService usersService) {
    this.usersService = usersService;
  }

  @PostMapping(value = "/users")
  public void createUsers(Users user) {
    System.out.println(user);
    System.out.println(usersService.createUsers(user));
  }

  @GetMapping(value="/users")
  public void getAllUsers(@RequestParam Integer userSeq) {
    List<Users> userList = usersService.getAllUsers();
    for (Users user : userList) {
      System.out.println(user.getUserSeq() + " : " + user.getUserNickname());
    }
  }
}
