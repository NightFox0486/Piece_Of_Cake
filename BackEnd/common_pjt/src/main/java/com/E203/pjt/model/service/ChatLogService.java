package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatLog;

import java.util.List;
import java.util.Optional;

public interface ChatLogService {
    List<ChatLog> getAllChatLogs();
    Optional<ChatLog> detailChatLog(int chatLogSeq);
    ChatLog createChatLogs(ChatLog chatLog);
}
