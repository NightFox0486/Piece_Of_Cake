package com.E203.pjt.controller;

import com.E203.pjt.model.dto.req.BookmarkReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Bookmark;
import com.E203.pjt.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class BookmarkController {

    private final BookmarkService bookmarkService;

    @GetMapping(value = "/bookmark/{userSeq}")
    public List<PartyResVO> listBookmarkParty(@PathVariable Integer userSeq) {
//        System.out.println("[BookmarkController] listBookmarkParty() called");
        List<PartyResVO> list = bookmarkService.listBookmark(userSeq);
//        for(PartyResVO partyResVO : list) {
//            System.out.println(partyResVO);
//        }
        return list;
    }

    @PostMapping(value = "/bookmark")
    @ResponseBody
    public Bookmark insertBookmark(@RequestBody BookmarkReqVO bookmarkReqVO) {
//    public ResponseEntity<WishList> insertWishList(@RequestParam Integer partySeq) {
//        System.out.println("[BookmarkController] insertBookmark() called");
//        System.out.println("wishReqVO: "+ bookmarkReqVO);
        Bookmark resBookmark = bookmarkService.insertBookmark(bookmarkReqVO);
        return resBookmark;
//        if (resBookmark!=null) {
//            return resBookmark;
////            return new ResponseEntity<>(resBookmark, HttpStatus.OK);
//        }else {
//            return null;
////            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
//        }
    }

    @DeleteMapping(value= "/bookmark")
    public boolean deleteBookmark(@RequestBody BookmarkReqVO bookmarkReqVO) {
//    public boolean deleteWishList(@RequestParam Integer partySeq) {
//        System.out.println("[BookmarkController] deleteBookmark() called");
        boolean res = bookmarkService.deleteBookmark(bookmarkReqVO);
        if (res) {
            return true;
        }else {
            return false;
        }
    }
}
