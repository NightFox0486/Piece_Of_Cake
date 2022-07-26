package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.ReceiptStorage;

public interface ReceiptStorageService {
  ReceiptStorage createReceipt(ReceiptStorage receiptStorage);
  void deleteReceipt(Integer receipt_seq);
  List<ReceiptStorage> getAllReceipts();
}
