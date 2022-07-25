package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatRooms;
import com.E203.pjt.model.entity.Users;
import com.E203.pjt.repository.ChatRoomsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatRoomsServiceImpl implements ChatRoomsService{
    @Autowired
    private ChatRoomsRepository chatRoomsRepository;

    @Override
    public ChatRooms createChatRooms(ChatRooms chatRooms) {
        return chatRoomsRepository.save(chatRooms);
    }

    @Override
    public List<ChatRooms> getAllChatRooms() {
        return chatRoomsRepository.findAll();
    }

    @Override
    public void deleteChatRooms(Integer chatSeq) {
        chatRoomsRepository.deleteById(chatSeq);
    }
}
