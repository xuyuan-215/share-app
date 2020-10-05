package com.soft1851.content.feignclient;

import com.soft1851.content.configuration.UserCenterFeignConfiguration;
import com.soft1851.content.domain.entity.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(name="user-center",configuration = UserCenterFeignConfiguration.class)
public interface UserCenterFeignClient {
    @GetMapping("/user/one/{userId}")
    User findById(@PathVariable Integer userId);
}
