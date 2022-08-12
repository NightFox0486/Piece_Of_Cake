package com.E203.pjt.model.entity;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "bookmarks")
public class Bookmark implements Serializable {
    @EmbeddedId
    private BookmarkPK bookmarkPK;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("userSeq")
    private User user;

    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("partySeq")
    private Party party;

}
