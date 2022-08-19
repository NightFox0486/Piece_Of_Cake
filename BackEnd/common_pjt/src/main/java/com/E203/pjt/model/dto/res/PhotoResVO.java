package com.E203.pjt.model.dto.res;

import lombok.*;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PhotoResVO {
    private Integer photoSeq;
    private String fileName;
    private String fileUrl;
    private Integer partySeq;
}
