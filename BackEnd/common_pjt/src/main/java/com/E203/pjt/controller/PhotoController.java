package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.dto.req.PhotoPostReqVO;
import com.E203.pjt.model.dto.res.PhotoResVO;
import com.E203.pjt.model.entity.Photo;
import com.E203.pjt.service.PhotoService;

import lombok.RequiredArgsConstructor;
import org.springframework.data.relational.core.sql.In;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;


@RestController
@RequiredArgsConstructor
public class PhotoController {
  private final PhotoService PhotoService;

  // @GetMapping(value="/party")
  // public List<PhotoResVO> listParty() {
  //   List<PhotoResVO> PhotoResVOList = PhotoService.listParty();
  //   for (PhotoResVO PhotoResVO : PhotoResVOList) {
  //     System.out.println(PhotoResVO.getPartySeq() + " : " + partyResVO.getPartyTitle());
  //   }
  //   return photoResVOList;
  // }

  @PostMapping(value = "/party")
  public Photo createParty(@RequestBody PhotoPostReqVO photoPostReqVO, HttpSession session) {
    System.out.println(photoPostReqVO);
    Photo result = PhotoService.insertPhoto(photoPostReqVO);
    return result;
  }
}
