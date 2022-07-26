package com.E203.pjt.controller;

import com.E203.pjt.model.entity.Parties;
import com.E203.pjt.model.entity.Users;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import com.E203.pjt.repository.PartiesRepository;
import com.E203.pjt.repository.UsersRepository;
import com.E203.pjt.repository.WishListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceUnit;
import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class WishListController {

    private final UsersRepository usersRepository;
    private final PartiesRepository partiesRepository;
    private final WishListRepository wishListRepository;

//    @PersistenceContext
//    EntityManager em;
//
//    @PersistenceUnit
//    EntityManagerFactory emf;

    @GetMapping(value = "/wish")
    public List<WishList> listWishList() {
        System.out.println("[WishListController] listWishList() called");
        List<WishList> list = wishListRepository.findAll();
        for(WishList wl : list) {
            System.out.println(wl.getWishListPK());
        }
        return list;
    }

    @PostMapping(value = "/wish/{party_seq}")
    @ResponseBody
    public WishList insertWishList(@PathVariable("party_seq") Integer partySeq) {
        System.out.println("[WishListController] createWishList() called");
        Integer userSeq = 1;
        Optional<Users> user = usersRepository.findById(userSeq);
        Optional<Parties> party = partiesRepository.findById(partySeq);

        WishListPK pk = new WishListPK(userSeq, partySeq);
        WishList wishList = new WishList();
        wishList.setWishListPK(pk);
        wishList.setUser(user.get());
        wishList.setParty(party.get());
        wishListRepository.save(wishList);
//        em.persist(wishList);
//        em.find(WishList.class, wishList);
        System.out.println(wishList);
        return wishList;
    }

    @DeleteMapping(value="/wish/{party_seq}")
    public void deleteWishList(@PathVariable("party_seq") int partySeq) {
        int userSeq = 1;

        System.out.println("[WishListController] deleteWishList() called");
    }
}
