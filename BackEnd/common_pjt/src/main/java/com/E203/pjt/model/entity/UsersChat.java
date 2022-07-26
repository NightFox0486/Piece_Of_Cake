package com.E203.pjt.model.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users_chat")
public class UsersChat {

    @EmbeddedId
    private UsersChatID usersChatID;

    @ManyToOne(targetEntity = ChatRooms.class)
    @JoinColumn(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    @MapsId("chatSeq")
    private ChatRooms chatRooms;

    @ManyToOne(targetEntity = Users.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    @MapsId("userSeq")
    private Users users;

    @ManyToOne(targetEntity = Parties.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    @MapsId("partySeq")
    private Parties parties;
}
