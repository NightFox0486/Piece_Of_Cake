package com.E203.pjt.service.impl;

import java.util.List;

import com.E203.pjt.model.dto.req.PhotoPostReqVO;
import com.E203.pjt.model.entity.Photo;
import com.E203.pjt.service.PhotoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.PhotoRepository;

@Service
@RequiredArgsConstructor
public class PhotoServiceImpl implements PhotoService {
  private final PhotoRepository photoRepository;
  private final PartyRepository partyRepository;

  @Override
  public Photo insertPhoto(PhotoPostReqVO photoPostReqVO) {
    Photo photo  = new Photo();
    photo.setFileName(photoPostReqVO.getFileName());
    photo.setFileUrl(photoPostReqVO.getFileUrl());
    photo.setParty(partyRepository.findByPartySeq(photoPostReqVO.getPartySeq()));
    return photoRepository.save(photo);
  }

  // @Override
  // public void deletePhoto(Integer photoSeq) {
  //   photoRepository.deleteById(photoSeq);
  // }

  // @Override
  // public List<Photo> getAllPhotos() {
  //   return photoRepository.findAll();
  // }

}
