package com.E203.pjt.controller;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import com.E203.pjt.model.service.PartyService;
import com.E203.pjt.model.service.UserService;
import com.E203.pjt.model.service.WishListService;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.repository.WishListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.relational.core.sql.In;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class WishListController {


    private final UserService userService;
    private final PartyService partyService;
    private final WishListService wishListService;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;
    private final WishListRepository wishListRepository;

//    @PersistenceContext
//    EntityManager em;

    @GetMapping(value = "/wish")
    public List<WishList> listWishList() {
        System.out.println("[WishListController] listWishList() called");
        List<WishList> list = wishListRepository.findAll();
        for(WishList wl : list) {
            System.out.println(wl.getWishListPK());
        }
        return list;
    }

    @PostMapping(value = "/wish")
    @ResponseBody
    public WishList insertWishList(@RequestParam Integer partySeq) {
//    public ResponseEntity<WishList> insertWishList(@RequestParam Integer partySeq) {
        System.out.println("[WishListController] insertWishList() called");
        WishList resWishList = wishListService.insertWishList(partySeq);
        if (resWishList!=null) {
            return resWishList;
//            return new ResponseEntity<>(resWishList, HttpStatus.OK);
        }else {
            return null;
//            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @DeleteMapping(value="/wish")
    public boolean deleteWishList(@RequestParam Integer partySeq) {
        System.out.println("[WishListController] deleteWishList() called");
        boolean res = wishListService.deleteWishList(partySeq);
        if (res) {
            return true;
        }else {
            return false;
        }
    }
}
