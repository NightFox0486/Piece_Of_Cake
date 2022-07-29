package com.E203.pjt.service.impl;

import java.util.List;

import com.E203.pjt.model.entity.Photo;
import com.E203.pjt.service.PhotoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.repository.PhotoRepository;

@Service
@RequiredArgsConstructor
public class PhotoServiceImpl implements PhotoService {
  private final PhotoRepository photoRepository;

  @Override
  public Photo insertPhoto(Photo photo) {
    return photoRepository.save(photo);
  }

  @Override
  public void deletePhoto(Integer photoSeq) {
    photoRepository.deleteById(photoSeq);
  }

  @Override
  public List<Photo> getAllPhotos() {
    return photoRepository.findAll();
  }

}
