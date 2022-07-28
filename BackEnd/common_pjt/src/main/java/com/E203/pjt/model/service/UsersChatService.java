package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.ChatRoom;
import com.E203.pjt.model.entity.UsersChat;

import java.util.List;
import java.util.Optional;

public interface UsersChatService {

    Optional<UsersChat> detailUsersChat(Integer chatSeq);
    List<UsersChat> getAllUsersChat();
    void deleteUsersChat(Integer chatSeq);
}
