package com.E203.pjt.model.entity;

import lombok.*;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "wish_list")
@Transactional(readOnly = true)
public class WishList implements Serializable {

    @EmbeddedId
    private WishListPK wishListPK;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("userSeq")
    private Users user;

    @ManyToOne(fetch = FetchType.LAZY)
    @MapsId("partySeq")
    private Parties party;

}
