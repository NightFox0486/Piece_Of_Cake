package com.E203.pjt.service.impl;

import com.E203.pjt.model.dto.req.WishReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.repository.WishListRepository;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.WishListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class WishListServiceImpl implements WishListService {
    private final WishListRepository wishListRepository;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;
    private final PartyService partyService;


    @Override
    public List<PartyResVO> listWishList(Integer userSeq) {
        List<PartyResVO> result = new ArrayList<>();
        User user = userRepository.findByUserSeq(userSeq);
        List<WishList> list = wishListRepository.findAllByUser(user);
        Integer partySeqList[] = new Integer[list.size()];
        for (WishList wishList : list) {
            PartyResVO partyResVO = partyService.detailParty(wishList.getParty().getPartySeq());
            result.add(partyResVO);
        }
        return result;
    }

    @Override
    @Transactional
    public WishList insertWishList(WishReqVO wishReqVO) {
        User user = userRepository.findById(wishReqVO.getUserSeq()).get();
        Party party = partyRepository.findById(wishReqVO.getPartySeq()).get();
        WishList wishList = new WishList();
        WishListPK pk = new WishListPK(wishReqVO.getUserSeq(), wishReqVO.getPartySeq());
        wishList.setWishListPK(pk);
        wishList.setUser(user);
        wishList.setParty(party);
        party.setPartyWishCount(party.getPartyWishCount()+1);
        partyRepository.save(party);
        return wishListRepository.save(wishList);
    }

    @Override
    @Transactional
    public boolean deleteWishList(WishReqVO wishReqVO) {
        Integer userSeq = 3;
        WishListPK pk = new WishListPK(userSeq, wishReqVO.getPartySeq());
        WishList wishList = wishListRepository.findById(pk).get();
        Party party = partyRepository.findByPartySeq(wishReqVO.getPartySeq());
        if (wishList!=null) {
            wishListRepository.delete(wishList);
            party.setPartyWishCount(party.getPartyWishCount()-1);
            partyRepository.save(party);
            return true;
        }else {
            return false;
        }
    }
}
