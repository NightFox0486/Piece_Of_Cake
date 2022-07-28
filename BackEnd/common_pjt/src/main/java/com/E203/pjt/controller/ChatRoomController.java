package com.E203.pjt.controller;

import com.E203.pjt.model.entity.ChatRoom;
import com.E203.pjt.model.service.ChatRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class ChatRoomController {

    @Autowired
    private final ChatRoomService chatRoomService;

    public ChatRoomController(ChatRoomService chatRoomService) {
        this.chatRoomService = chatRoomService;
    }

    @GetMapping(value="/chat-rooms")
    public List<ChatRoom> getAllChatRooms() {
        List<ChatRoom> chatRoomsList = chatRoomService.getAllChatRooms();
        for (ChatRoom chatRoom : chatRoomsList) {
            System.out.println(chatRoom.getChatSeq() + " : " + chatRoom.getHostNickname());
        }

        return chatRoomsList;
    }

    @GetMapping(value = "/chat-rooms/{chatSeq}")
    public Optional<ChatRoom> detailChatRoom(@PathVariable int chatSeq){
        System.out.println(chatSeq);
        return chatRoomService.detailChatRoom(chatSeq);
    }

    @PostMapping(value = "/chat-rooms")
    public ChatRoom createChatRoom(ChatRoom chatRoom) {
        System.out.println(chatRoom);
        System.out.println(chatRoomService.createChatRoom(chatRoom));
        return chatRoomService.createChatRoom(chatRoom);
    }

    @DeleteMapping(value = "/chat-rooms/{chatSeq}")
    public void deleteChatRooms(@PathVariable Integer chatSeq){
        chatRoomService.deleteChatRoom(chatSeq);
        System.out.println(chatSeq);
    }
}
