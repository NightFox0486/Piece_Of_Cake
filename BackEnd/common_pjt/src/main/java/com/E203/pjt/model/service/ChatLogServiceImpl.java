package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatLog;
import com.E203.pjt.repository.ChatLogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ChatLogServiceImpl implements ChatLogService {

    @Autowired
    private ChatLogRepository chatLogRepository;


    @Override
    public List<ChatLog> getAllChatLogs() {
        return chatLogRepository.findAll();
    }

    @Override
    public Optional<ChatLog> detailChatLog(int chatLogSeq) {
        return chatLogRepository.findById(chatLogSeq);
    }

    @Override
    public ChatLog createChatLogs(ChatLog chatLog) {
        return chatLogRepository.save(chatLog);
    }
}
