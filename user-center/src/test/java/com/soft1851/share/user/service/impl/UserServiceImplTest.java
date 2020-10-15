package com.soft1851.share.user.service.impl;

import com.soft1851.share.user.domain.dto.UserSignInDTO;
import lombok.RequiredArgsConstructor;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
class UserServiceImplTest {
    private final UserServiceImpl userService;

    @Test
    void checkIsSign() {
        UserSignInDTO userSignInDTO = UserSignInDTO.builder()
                .userId(28)
                .build();
        System.out.println(userService.checkIsSign(userSignInDTO));
    }
}