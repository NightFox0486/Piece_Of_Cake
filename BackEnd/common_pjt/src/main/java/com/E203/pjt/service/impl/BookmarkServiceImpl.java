package com.E203.pjt.service.impl;

import com.E203.pjt.model.dto.req.BookmarkReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Bookmark;
import com.E203.pjt.model.entity.BookmarkPK;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.repository.BookmarkRepository;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.BookmarkService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BookmarkServiceImpl implements BookmarkService {
    private final BookmarkRepository bookmarkRepository;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;
    private final PartyService partyService;


    @Override
    public List<PartyResVO> listBookmark(Integer userSeq) {
        List<PartyResVO> result = new ArrayList<>();
        User user = userRepository.findByUserSeq(userSeq);
        List<Bookmark> list = bookmarkRepository.findAllByUser(user);
//        Integer partySeqList[] = new Integer[list.size()];
        for (Bookmark wishList : list) {
            PartyResVO partyResVO = partyService.detailParty(wishList.getParty().getPartySeq());
            result.add(partyResVO);
        }
        return result;
    }

    @Override
    @Transactional
    public Bookmark insertBookmark(BookmarkReqVO bookmarkReqVO) {
        User user = userRepository.findByUserSeq(bookmarkReqVO.getUserSeq());
        Party party = partyRepository.findByPartySeq(bookmarkReqVO.getPartySeq());
//        Bookmark bookmark = new Bookmark();
//        BookmarkPK pk = new BookmarkPK(bookmarkReqVO.getUserSeq(), bookmarkReqVO.getPartySeq());
//        bookmark.setBookmarkPK(pk);
//        bookmark.setUser(user);
//        bookmark.setParty(party);
//        party.setPartyBookmarkCount(party.getPartyBookmarkCount()+1);
//        partyRepository.save(party);
//        return bookmarkRepository.save(bookmark);

//        Bookmark bookmark = bookmarkRepository.findBookmarkByUserAndParty(user, party);
        if (bookmarkRepository.findBookmarkByUserAndParty(user, party)==null) {
            Bookmark bookmark = new Bookmark();
            BookmarkPK pk = new BookmarkPK(bookmarkReqVO.getUserSeq(), bookmarkReqVO.getPartySeq());
            bookmark.setBookmarkPK(pk);
            bookmark.setUser(user);
            bookmark.setParty(party);
            party.setPartyBookmarkCount(party.getPartyBookmarkCount()+1);
            partyRepository.save(party);
            return bookmarkRepository.save(bookmark);
        } else {
            Bookmark bookmark = bookmarkRepository.findBookmarkByUserAndParty(user, party);
            return bookmark;
        }
    }

    @Override
    @Transactional
    public boolean deleteBookmark(BookmarkReqVO bookmarkReqVO) {
        User user = userRepository.findByUserSeq(bookmarkReqVO.getUserSeq());
        Party party = partyRepository.findByPartySeq(bookmarkReqVO.getPartySeq());
        Bookmark bookmark = bookmarkRepository.findBookmarkByUserAndParty(user, party);
        System.out.println("bookmark: "+bookmark);
        if (bookmark!=null) {
            bookmarkRepository.delete(bookmark);
            party.setPartyBookmarkCount(party.getPartyBookmarkCount()-1);
            partyRepository.save(party);
            return true;
        }else {
            return false;
        }
    }
}
