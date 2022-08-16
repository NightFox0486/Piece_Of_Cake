package com.E203.pjt.controller;

import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.service.MyPartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Transactional(readOnly = false)
public class MyPartyController {
    private final MyPartyService myPartyService;

    @PostMapping(value = "/my-party")
    public Boolean insertMyParty(@RequestBody MyPartyReqVO myPartyReqVO) {
        return myPartyService.insertMyParty(myPartyReqVO);
    }

    @DeleteMapping(value = "/my-party")
    public void deleteMyparty(@RequestBody MyPartyReqVO myPartyReqVO) {
        myPartyService.deleteMyParty(myPartyReqVO);
    }


}
