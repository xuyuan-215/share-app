package com.soft1851.content.feignclient;

import com.soft1851.content.domain.dto.UserDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name = "user-center")
public interface TestUserCenterFeignClient {
    @GetMapping("/user/q")
    UserDto query(@SpringQueryMap UserDto userDto);
}
