package com.E203.pjt.controller;

import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.service.WishListService;
import com.E203.pjt.repository.WishListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class WishListController {

    private final WishListService wishListService;
    private final WishListRepository wishListRepository;

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
