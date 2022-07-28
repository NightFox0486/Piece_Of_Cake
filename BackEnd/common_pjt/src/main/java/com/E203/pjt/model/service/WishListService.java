package com.E203.pjt.model.service;

import com.E203.pjt.model.entity.WishList;

public interface WishListService {
    WishList insertWishList(Integer partySeq);
    boolean deleteWishList(Integer partySeq);
}
