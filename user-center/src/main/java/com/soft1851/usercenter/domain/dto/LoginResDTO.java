package com.soft1851.usercenter.domain.dto;

import com.soft1851.usercenter.domain.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoginResDTO {
    private UserRespDTO user;
    private JwtTokenRespDTO token;
}