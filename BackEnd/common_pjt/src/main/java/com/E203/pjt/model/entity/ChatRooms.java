package com.E203.pjt.model.entity;

import com.sun.istack.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "chat_rooms")
public class ChatRooms {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "chat_seq", unique = true)
    @NotNull
    private Integer chatSeq;

    @Column(name = "party_seq", unique = true)
    @NotNull
    private Integer partySeq;

    @Column(name = "host_seq")
    private Integer hostSeq;

    @Column(name = "host_nickname", length = 45)
    private String hostNickname;

    @Column(name = "guest_seq")
    private Integer guestSeq;

    @Column(name = "guest_nickname", length = 45)
    private String guestNickname;

    @Column(name = "created_at", columnDefinition = "DATETIME")
    @CreationTimestamp
    private LocalDateTime createdAt;

    @Column(name = "chat_log_seq", unique = true)
    @NotNull
    private Integer chatLogSeq;

}
