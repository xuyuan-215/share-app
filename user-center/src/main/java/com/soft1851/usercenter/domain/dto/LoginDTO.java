package com.soft1851.usercenter.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginDTO {
    private  String  WxId;
    private  String openId;
    private  String loginCode;
    private  String wxNickname;
    private  String avatarUrl;
}
