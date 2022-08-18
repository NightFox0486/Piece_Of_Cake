package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.res.UserResVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.service.UserService;


@RestController
@RequiredArgsConstructor
public class UserController {
  private final UserService userService;

  @GetMapping(value="/user")
  public List<User> getAllUsers() {
    List<User> userList = userService.getAllUsers();
//    for (User user : userList) {
//      System.out.println(user.getUserSeq() + " : " + user.getUserNickname());
//    }
    return userList;
  }

  @GetMapping(value = "/user/{userSeq}")
  public UserResVO detailUser(@PathVariable Integer userSeq) {
    UserResVO userResVO = userService.detailUser(userSeq);
    return userResVO;
  }

  @PutMapping(value = "/user")
  public UserResVO updateUserLatLng(@RequestBody UserReqVO userReqVO) {
    System.out.println("[UserController] updateUserLatLng");
    System.out.println("userReqVO"+userReqVO);
    UserResVO userResVO = userService.updateUserLatLng(userReqVO);
    return userResVO;
  }

  @PostMapping(value = "/user")
  @ResponseBody
  public UserResVO createUsers(@RequestBody UserReqVO userReqVO) {
//    System.out.println("[UserController] createUsers() called");
//    System.out.println("userReqVO: "+userReqVO);
    UserResVO userResVO = userService.createUser(userReqVO);
//    System.out.println("userResVO: "+userResVO);
    return userResVO;
  }


}
