package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatRoom;
import com.E203.pjt.model.entity.UsersChat;
import com.E203.pjt.repository.UsersChatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UsersChatServiceImpl implements UsersChatService{

    @Autowired
    private UsersChatRepository usersChatRepository;

    @Override
    public Optional<UsersChat> detailUsersChat(Integer chatSeq) {
        return usersChatRepository.findById(chatSeq);
    }

    @Override
    public List<UsersChat> getAllUsersChat() {
        return usersChatRepository.findAll();
    }

    @Override
    public void deleteUsersChat(Integer chatSeq) {
        usersChatRepository.deleteById(chatSeq);
    }
}