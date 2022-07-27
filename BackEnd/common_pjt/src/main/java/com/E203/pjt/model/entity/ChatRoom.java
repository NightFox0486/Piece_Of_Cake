package com.E203.pjt.model.entity;

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
public class ChatRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer chatSeq;

    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
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


}
