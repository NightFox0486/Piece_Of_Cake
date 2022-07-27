package com.E203.pjt.model.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "my_party")
public class MyParty implements Serializable{
    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @ManyToOne(targetEntity = Party.class)
    @JoinColumn(name = "party_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer partySeq;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_seq", nullable = false, columnDefinition = "INT UNSIGNED UNIQUE")
    private Integer userSeq;

    @Column(name = "party_list_code", length = 5, nullable = false)
    private String partyListCode;
}
