package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Users;
import com.E203.pjt.model.service.UsersService;


@RestController
public class UsersController {
  @Autowired
  private final UsersService usersService;

  public UsersController(UsersService usersService) {
    this.usersService = usersService;
  }

  @GetMapping(value="/users")
  public void getAllUsers() {
    List<Users> userList = usersService.getAllUsers();
    for (Users user : userList) {
      System.out.println(user.getUserSeq() + " : " + user.getUserNickname());
    }

  }

  @PostMapping(value = "/users")
  public void createUsers(Users user) {
    System.out.println(user);
    System.out.println(usersService.createUsers(user));
  }


}
