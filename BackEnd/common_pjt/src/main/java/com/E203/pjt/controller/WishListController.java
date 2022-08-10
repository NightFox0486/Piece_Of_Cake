package com.E203.pjt.controller;

import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Party;
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

    @GetMapping(value = "/wish/{userSeq}")
    public List<PartyResVO> listWishList(@PathVariable Integer userSeq) {
        System.out.println("[WishListController] listWishList() called");
        List<PartyResVO> list = wishListService.listWishList(userSeq);
        for(PartyResVO partyResVO : list) {
            System.out.println(partyResVO);
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
