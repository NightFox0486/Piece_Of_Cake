package com.E203.pjt.repository;

import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WishListRepository extends JpaRepository<WishList, WishListPK> {
    List<WishList> findAllByUser(User user);

}
