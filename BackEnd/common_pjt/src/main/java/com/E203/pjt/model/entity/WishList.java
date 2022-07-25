package com.E203.pjt.model.entity;

import lombok.*;
import org.springframework.data.relational.core.sql.In;

import javax.persistence.*;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "wish_list")
public class WishList{
    @EmbeddedId
    private WishListID wishListID;

    @ManyToOne(targetEntity = Users.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("userSeq")
    private Users user;

    @ManyToOne(targetEntity = Parties.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED")
    @MapsId("partySeq")
    private Parties party;
}
