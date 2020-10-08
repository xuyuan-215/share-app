package com.soft1851.contentcenter.feignclient;

import com.soft1851.contentcenter.domain.dto.UserDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.cloud.openfeign.SpringQueryMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/30 11:03
 */
@FeignClient(name = "user-center")
public interface TestUserCenterFeignClient {

    @GetMapping("/user/test/q")
    UserDTO query(@SpringQueryMap UserDTO userDTO);
}
