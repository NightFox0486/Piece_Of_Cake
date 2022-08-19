package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.entity.Receipt;

public interface ReceiptService {
  Receipt insertReceipt(Receipt receipt);
  void deleteReceipt(Integer receiptSeq);
  List<Receipt> getAllReceipts();
}
