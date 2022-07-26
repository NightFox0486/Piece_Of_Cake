package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.ReceiptStorage;
import com.E203.pjt.repository.ReceiptStorageRepository;

@Service
public class ReceiptStorageServiceImpl implements ReceiptStorageService{
  @Autowired
  private ReceiptStorageRepository receiptStorageRepository;

  @Override
  public ReceiptStorage createReceipt(ReceiptStorage receiptStorage) {
    return receiptStorageRepository.save(receiptStorage);
  }

  @Override
  public void deleteReceipt(Integer receipt_seq) {
    receiptStorageRepository.deleteById(receipt_seq);
  }

  @Override
  public List<ReceiptStorage> getAllReceipts() {
    return receiptStorageRepository.findAll();
  }
}
