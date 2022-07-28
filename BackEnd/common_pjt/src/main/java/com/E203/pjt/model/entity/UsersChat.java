package com.E203.pjt.model.entity;

import lombok.*;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users_chat")
public class UsersChat{

    @EmbeddedId
    private UsersChatPK usersChatPK;

    @ManyToOne(targetEntity = ChatRoom.class)
    @JoinColumn(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    @MapsId("chatSeq")
    private Integer chatSeq;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer userSeq;

    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer partySeq;

}
