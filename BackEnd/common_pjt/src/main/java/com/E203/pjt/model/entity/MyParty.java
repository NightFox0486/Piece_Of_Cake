package com.E203.pjt.model.entity;

import lombok.*;

import java.io.Serializable;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "my_party")
public class MyParty implements Serializable {
    @EmbeddedId
    private MyPartyPK myPartyPK;

    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("partySeq")
    private Party party;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("userSeq")
    private User user;

    // "host" or "guest" : user가 party의 guest인지 host인지
    @Column(name = "my_party_role", length = 5, nullable = false)
    private String myPartyRole;
}
