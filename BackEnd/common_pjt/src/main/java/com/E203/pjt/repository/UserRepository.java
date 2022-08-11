package com.E203.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
    User findByUserSeq(int userSeq);
    User findByUserKakaoLoginId(String userKakaoLoginId);
}
