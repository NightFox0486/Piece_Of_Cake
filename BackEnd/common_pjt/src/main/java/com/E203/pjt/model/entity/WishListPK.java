package com.E203.pjt.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Embeddable
public class WishListPK implements Serializable {

    @Column(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    private Integer userSeq;

    @Column(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    private Integer partySeq;
}
