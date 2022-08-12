package com.E203.pjt.service;

import com.E203.pjt.model.dto.req.BookmarkReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Bookmark;

import java.util.List;

public interface BookmarkService {
    List<PartyResVO> listBookmark(Integer userSeq);
    Bookmark insertBookmark(BookmarkReqVO bookmarkReqVO);
    boolean deleteBookmark(BookmarkReqVO bookmarkReqVO);
}
