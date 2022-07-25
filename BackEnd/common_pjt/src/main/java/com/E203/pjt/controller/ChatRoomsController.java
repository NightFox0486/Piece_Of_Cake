package com.E203.pjt.controller;

import com.E203.pjt.model.entity.ChatRooms;
import com.E203.pjt.model.service.ChatRoomsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ChatRoomsController {

    @Autowired
    private final ChatRoomsService chatRoomsService;

    public ChatRoomsController(ChatRoomsService chatRoomsService) {
        this.chatRoomsService = chatRoomsService;
    }

    @GetMapping(value="/chat-rooms")
    public List<ChatRooms> getAllChatRooms() {
        List<ChatRooms> chatRoomsList = chatRoomsService.getAllChatRooms();
        for (ChatRooms chatRoom : chatRoomsList) {
            System.out.println(chatRoom.getChatSeq() + " : " + chatRoom.getHostNickname());
        }

        return chatRoomsList;
    }

    @PostMapping(value = "/chat-rooms")
    public ChatRooms createChatRooms(ChatRooms chatRoom) {
        System.out.println(chatRoom);
        System.out.println(chatRoomsService.createChatRooms(chatRoom));
        return chatRoomsService.createChatRooms(chatRoom);
    }

    @DeleteMapping(value = "/chat-rooms/{chatSeq}")
    public void deleteChatRooms(@PathVariable Integer chatSeq){
        System.out.println(chatSeq);
    }
}
