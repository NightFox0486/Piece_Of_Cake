package com.E203.pjt.repository;

import com.E203.pjt.model.entity.ChatRooms;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChatRoomsRepository extends JpaRepository<ChatRooms, Integer> {
}
