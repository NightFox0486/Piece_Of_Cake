package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.entity.Photo;

public interface PhotoService {
  Photo insertPhoto(Photo photo);
  void deletePhoto(Integer photoSeq);
  List<Photo> getAllPhotos();
}
