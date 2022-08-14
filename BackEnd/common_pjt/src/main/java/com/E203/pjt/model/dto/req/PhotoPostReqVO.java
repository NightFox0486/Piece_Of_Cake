package com.E203.pjt.model.dto.req;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PhotoPostReqVO {
    private String fileName;
    private String fileUrl;
    private Integer partySeq;
}
