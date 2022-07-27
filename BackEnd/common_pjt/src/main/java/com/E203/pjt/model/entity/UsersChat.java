package com.E203.pjt.model.entity;

import lombok.*;

import java.io.Serializable;

import javax.persistence.*;

@Entity
//@Data
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users_chat")
public class UsersChat implements Serializable{

    // @EmbeddedId
    // private UsersChatID usersChatID;

    @Id
    @ManyToOne(targetEntity = ChatRoom.class)
    @JoinColumn(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    //@MapsId("chatSeq")
    private Integer chatSeq;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    //@MapsId("userSeq")
    private Integer userSeq;

    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    //@MapsId("partySeq")
    private Integer partySeq;
}
