package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.dto.req.PhotoPostReqVO;
import com.E203.pjt.model.entity.Photo;

public interface PhotoService {
  List<String> listPartyPhoto(Integer partySeq);
  Photo insertPhoto(PhotoPostReqVO photoPostReqVO);
  // void deletePhoto(Integer photoSeq);
  // List<Photo> getAllPhotos();
}
