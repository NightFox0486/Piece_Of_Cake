package com.E203.pjt.model.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
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
@Table(name = "chat_log")
public class ChatLog {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "chat_log_seq", unique = true, nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer chatLogSeq;

    @JsonBackReference
    @ManyToOne(targetEntity = ChatRoom.class)
    @JoinColumn(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private ChatRoom chatRoom;

    @Column(name = "user_nickname", length = 45)
    private String userNickname;

    @Column(name = "chat_content", columnDefinition = "TEXT")
    private String chatContent;

    @Column(name = "chat_created_at", columnDefinition = "DATETIME")
    @CreationTimestamp
    private LocalDateTime chatCreatedAt;

    @Column(name = "chat_updated_at", columnDefinition = "DATETIME")
    @CreationTimestamp
    private LocalDateTime chatUpdatedAt;
}
