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

  @GetMapping(value="/users")
  public List<User> getAllUsers() {
    List<User> userList = userService.getAllUsers();
    for (User user : userList) {
      System.out.println(user.getUserSeq() + " : " + user.getUserNickname());
    }
    return userList;
  }

//  @PostMapping(value = "/users")
//  public void createUsers(User user) {
//    System.out.println(user);
//    System.out.println(userService.createUser(user));
//  }

  //ResponseEntity<Map<String, String>>

  @PostMapping(value = "/users")
  @ResponseBody
  public UserResVO createUsers(@RequestBody UserReqVO userReqVO) {
    System.out.println("[UserController] createUsers() called");
    System.out.println("userReqVO: "+userReqVO);
    UserResVO userResVO = userService.createUser(userReqVO);
    System.out.println("userResVO: "+userResVO);
//    Map<String, String> map = new HashMap<>();
//    if (userResVO!=null) {
//      map.put("result", "success");
//      map.put("userSeq", userResVO.getUserSeq().toString());
//      map.put("userNickname", userResVO.getUserNickname());
//      return new ResponseEntity<>(map, HttpStatus.OK);
//    }else {
//      map.put("result", "fail");
//      return new ResponseEntity<>(map, HttpStatus.INTERNAL_SERVER_ERROR);
//    }
    return userResVO;
  }


}
