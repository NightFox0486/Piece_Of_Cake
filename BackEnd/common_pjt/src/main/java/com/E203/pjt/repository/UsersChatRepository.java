package com.E203.pjt.repository;

import com.E203.pjt.model.entity.UsersChat;
import com.E203.pjt.model.entity.UsersChatID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersChatRepository extends JpaRepository<UsersChat, UsersChatID> {
}
