package com.E203.pjt.model.entity;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Embeddable
public class UsersChatPK implements Serializable {

    @ManyToOne(targetEntity = ChatRoom.class)
    @JoinColumn(name = "chat_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer chatSeq;
}
