package com.E203.pjt.service.impl;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.repository.WishListRepository;
import com.E203.pjt.service.WishListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class WishListServiceImpl implements WishListService {
    private final WishListRepository wishListRepository;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;

    @Override
    @Transactional
    public WishList insertWishList(Integer partySeq) {
        Integer userSeq = 1;
        User user = userRepository.findById(userSeq).get();
        Party party = partyRepository.findById(partySeq).get();
        WishList wishList = new WishList();
        WishListPK pk = new WishListPK(userSeq, partySeq);
        wishList.setWishListPK(pk);
        wishList.setUser(user);
        wishList.setParty(party);
        return wishListRepository.save(wishList);
    }

    @Override
    @Transactional
    public boolean deleteWishList(Integer partySeq) {
        Integer userSeq = 3;
        WishListPK pk = new WishListPK(userSeq, partySeq);
        WishList wishList = wishListRepository.findById(pk).get();
        if (wishList!=null) {
            wishListRepository.delete(wishList);
            return true;
        }else {
            return false;
        }
    }
}
