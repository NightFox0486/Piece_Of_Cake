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
public class BookmarkPK implements Serializable {
    private Integer userSeq;
    private Integer partySeq;
}
