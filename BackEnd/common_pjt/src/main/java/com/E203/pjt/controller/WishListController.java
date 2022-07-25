package com.E203.pjt.controller;

import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListID;
import com.E203.pjt.repository.UsersRepository;
import com.E203.pjt.repository.WishListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
public class WishListController {

    private final UsersRepository usersRepository;
    private final WishListRepository wishListRepository;

    @GetMapping(value = "/wish")
    public List<WishList> listWishList() {
        System.out.println("[WishListController] listWishList() called");
        List<WishList> list = wishListRepository.findAll();
        for(WishList wl : list) {
            System.out.println(wl.getUser()+""+wl.getParty());
        }
        return list;
    }

    @PostMapping(value = "/wish/{party_seq}")
    public void insertWishList(@PathVariable("party_seq") int partySeq) {
        int userSeq = 1;

        System.out.println("[WishListController] createWishList() called");
    }

    @DeleteMapping(value="/wish/{party_seq}")
    public void deleteWishList(@PathVariable("party_seq") int partySeq) {
        int userSeq = 1;

        System.out.println("[WishListController] deleteWishList() called");
    }
}
