package com.E203.pjt.controller;

import com.E203.pjt.model.entity.ChatLog;
import com.E203.pjt.model.service.ChatLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class ChatLogController {

    @Autowired
    private final ChatLogService chatLogService;

    public ChatLogController(ChatLogService chatLogService) {
        this.chatLogService = chatLogService;
    }

    @GetMapping(value = "/chat-log")
    public List<ChatLog> getAllChatLogs(){
        List<ChatLog> chatLogList = chatLogService.getAllChatLogs();
        for (ChatLog chatLog : chatLogList) {
            System.out.println(chatLog.getChatLogSeq() + " : " + chatLog.getUserNickname() + " : " + chatLog.getChatContent());
        }
        return chatLogList;
    }

    @GetMapping(value = "/chat-log/{chatLogSeq}")
    public Optional<ChatLog> detailChatLog(@PathVariable int chatLogSeq){
        System.out.println(chatLogSeq);
        return chatLogService.detailChatLog(chatLogSeq);
    }

    @PostMapping(value = "/chat-log")
    public ChatLog createChatLogs(ChatLog chatLog) {
        System.out.println(chatLog);
        System.out.println(chatLogService.createChatLogs(chatLog));
        return chatLogService.createChatLogs(chatLog);
    }
}
