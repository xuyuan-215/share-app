package com.soft1851.usercenter.controller;

import com.soft1851.usercenter.common.ResponseResult;
import com.soft1851.usercenter.domain.dto.UserAddBonusMsgDTO;
import com.soft1851.usercenter.domain.entity.User;
import com.soft1851.usercenter.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/23 8:39
 */
@RestController
@RequestMapping(value = "/users")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Slf4j
public class UserController {
    private final UserService userService;

    @GetMapping(value = "/hello")
    public String getHello() {
        log.info("我被调用了");
        return "hello user-center!";
    }

    @GetMapping(value = "/{id}")
    public User findUserById(@PathVariable Integer id) {
        log.info("我被请求了...");
        return this.userService.findById(id);
    }

    @PostMapping("/bonus/new")
    public ResponseResult addBonus(@RequestBody UserAddBonusMsgDTO userAddBonusMsgDTO) {
        System.out.println("添加一条记录");
        return ResponseResult.builder().code(userService.addBonus(userAddBonusMsgDTO)).build();
    }
}
