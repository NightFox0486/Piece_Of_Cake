package com.E203.pjt.repository;

import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface WishListRepository extends JpaRepository<WishList, WishListID> {
}
