package com.E203.pjt.service.impl;

import com.E203.pjt.model.entity.ChatRoom;
import com.E203.pjt.repository.ChatRoomRepository;
import com.E203.pjt.service.ChatRoomService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {
    private final ChatRoomRepository chatRoomRepository;

    @Override
    public ChatRoom createChatRoom(ChatRoom chatRoom) {
        return chatRoomRepository.save(chatRoom);
    }

    @Override
    public Optional<ChatRoom> detailChatRoom(int chatSeq) {
        return chatRoomRepository.findById(chatSeq);
    }

    @Override
    public List<ChatRoom> getAllChatRooms() {
        return chatRoomRepository.findAll();
    }

    @Override
    public void deleteChatRoom(Integer chatSeq) {
        chatRoomRepository.deleteById(chatSeq);
    }
}
