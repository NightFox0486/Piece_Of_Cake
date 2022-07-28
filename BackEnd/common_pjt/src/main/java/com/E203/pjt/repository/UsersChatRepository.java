package com.E203.pjt.repository;

import com.E203.pjt.model.entity.UsersChat;

import com.E203.pjt.model.entity.UsersChatPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsersChatRepository extends JpaRepository<UsersChat, Integer> {
}
