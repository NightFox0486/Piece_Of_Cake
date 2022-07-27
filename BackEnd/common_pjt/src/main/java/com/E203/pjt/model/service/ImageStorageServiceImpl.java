package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.ImageStorage;
import com.E203.pjt.repository.ImageStorageRepository;

@Service
public class ImageStorageServiceImpl implements ImageStorageService{
  @Autowired
  private ImageStorageRepository imageStorageRepository;

  @Override
  public ImageStorage createImage(ImageStorage imageStorage) {
    return imageStorageRepository.save(imageStorage);
  }

  @Override
  public void deleteImage(Integer image_seq) {
    imageStorageRepository.deleteById(image_seq);
  }

  @Override
  public List<ImageStorage> getAllImages() {
    return imageStorageRepository.findAll();
  }

}
