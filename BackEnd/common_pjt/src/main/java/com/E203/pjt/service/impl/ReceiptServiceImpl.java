package com.E203.pjt.service.impl;

import java.util.List;

import com.E203.pjt.service.ReceiptService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Receipt;
import com.E203.pjt.repository.ReceiptRepository;

@Service
@RequiredArgsConstructor
public class ReceiptServiceImpl implements ReceiptService {
  private final ReceiptRepository receiptRepository;

  @Override
  public Receipt insertReceipt(Receipt receipt) {
    return receiptRepository.save(receipt);
  }

  @Override
  public void deleteReceipt(Integer receiptSeq) {
    receiptRepository.deleteById(receiptSeq);
  }

  @Override
  public List<Receipt> getAllReceipts() {
    return receiptRepository.findAll();
  }
}
