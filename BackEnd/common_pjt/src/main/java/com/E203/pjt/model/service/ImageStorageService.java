package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.ImageStorage;

public interface ImageStorageService {
  ImageStorage createImage(ImageStorage imageStorage);
  void deleteImage(Integer image_seq);
  List<ImageStorage> getAllImages();
}
