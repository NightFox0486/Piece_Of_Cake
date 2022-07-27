package com.E203.pjt.controller;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
import com.E203.pjt.model.service.PartyService;
import com.E203.pjt.model.service.UserService;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.repository.WishListRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.relational.core.sql.In;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class WishListController {


    private final UserService userService;
    private final PartyService partyService;
    private final UserRepository userRepository;
    private final PartyRepository partyRepository;
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

    @PostMapping(value = "/wish")
    @ResponseBody
    public WishList insertWishList(@RequestParam Integer partySeq) {
        System.out.println("[WishListController] insertWishList() called");
        Integer userSeq = 1;
        User user = userRepository.findById(userSeq).get();
        Party party = partyRepository.findById(partySeq).get();
        System.out.println(user);
        System.out.println(party);
        WishList wishList = new WishList();
//        List<Party> parties = partyService.getAllParties();
//        for (Party p : parties) {
//            System.out.println(p);
//        }
//        List<User> users = userService.getAllUsers();
//        for (User u : users) {
//            System.out.println(u);
//        }
        return wishList;
    }

    @DeleteMapping(value="/wish/{party_seq}")
    public void deleteWishList(@PathVariable("party_seq") int partySeq) {
        int userSeq = 1;

        System.out.println("[WishListController] deleteWishList() called");
    }
}
