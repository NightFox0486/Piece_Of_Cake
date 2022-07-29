package com.E203.pjt.controller;

import com.E203.pjt.model.entity.UsersChat;
import com.E203.pjt.service.UsersChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class UsersChatController {
    private final UsersChatService usersChatService;

    // 상세
    @GetMapping(value = "/users-chat/{chatSeq}")
    public Optional<UsersChat> detailUsersChat(@PathVariable Integer chatSeq){
        System.out.println(chatSeq);
        return usersChatService.detailUsersChat(chatSeq);
    }

    // 목록
    @GetMapping(value="/users-chat")
    public List<UsersChat> getAllUsersChat() {
        List<UsersChat> usersChatListt = usersChatService.getAllUsersChat();
        for (UsersChat usersChat : usersChatListt) {
            System.out.println(usersChat.getChatSeq() + " : " + usersChat.getUserSeq() + " : " + usersChat.getPartySeq());
        }

        return usersChatListt;
    }

    // 삭제
    @DeleteMapping(value = "/users-chat/{chatSeq}")
    public void deleteUsersChat(@PathVariable Integer chatSeq){
        usersChatService.deleteUsersChat(chatSeq);
        System.out.println(chatSeq);
    }
}
