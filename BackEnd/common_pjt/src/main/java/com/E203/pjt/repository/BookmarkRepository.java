package com.E203.pjt.repository;

import com.E203.pjt.model.entity.Bookmark;
import com.E203.pjt.model.entity.BookmarkPK;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookmarkRepository extends JpaRepository<Bookmark, BookmarkPK> {
    Bookmark findBookmarkByUserAndParty(User user, Party party);
    List<Bookmark> findAllByUser(User user);
    List<Bookmark> findAllByParty(Party party);

}
