package com.soft1851.usercenter.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserRespDTO {
    private  Integer id;

    private  String avatarUrl;

    private  Integer   bonus;

    private   String  wxNickname;
}
