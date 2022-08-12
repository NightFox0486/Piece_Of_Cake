package com.E203.pjt.service;

import com.E203.pjt.model.entity.ChatRoom;

import java.util.List;
import java.util.Optional;

public interface ChatRoomService {
    ChatRoom createChatRoom(ChatRoom chatRoom);
    Optional<ChatRoom> detailChatRoom(int chatSeq);
    List<ChatRoom> getAllChatRooms();
    void deleteChatRoom(Integer chatSeq);
}
