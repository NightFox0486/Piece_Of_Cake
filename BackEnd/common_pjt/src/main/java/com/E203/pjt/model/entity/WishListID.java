package com.E203.pjt.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.ManyToOne;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class WishListID implements Serializable {
    @Column(name = "user_seq")
    private Integer userSeq;

    @Column(name = "party_seq")
    private Integer partySeq;
}
