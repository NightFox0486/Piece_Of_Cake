package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatRooms;
import com.E203.pjt.model.entity.Users;

import java.util.List;
import java.util.Optional;

public interface ChatRoomsService {
    ChatRooms createChatRooms(ChatRooms chatRooms);
    Optional<ChatRooms> detailChatRooms(int chatSeq);
    List<ChatRooms> getAllChatRooms();
    void deleteChatRooms(Integer chatSeq);
}
