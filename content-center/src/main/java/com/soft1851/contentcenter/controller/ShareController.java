package com.soft1851.contentcenter.controller;

import com.alibaba.nacos.common.utils.StringUtils;
import com.soft1851.contentcenter.domain.dto.ShareContributeDto;
import com.soft1851.contentcenter.domain.dto.ShareDto;
import com.soft1851.contentcenter.domain.dto.UserDTO;
import com.soft1851.contentcenter.domain.entity.Share;
import com.soft1851.contentcenter.feignclient.TestUserCenterFeignClient;
import com.soft1851.contentcenter.service.ShareService;
import com.soft1851.contentcenter.util.JwtOperator;
import io.jsonwebtoken.Claims;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.List;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/29 15:43
 */
@RestController
@RequestMapping(value = "/shares")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "分享接口", value = "提供分享相关的Rest API")
@Slf4j
public class ShareController {
    private final ShareService shareService;
    private final JwtOperator jwtOperator;
    private final TestUserCenterFeignClient testUserCenterFeignClient;

    @GetMapping(value = "/{id}")
    @ApiOperation(value = "查询指定id的分享详情", notes = "查询指定id的分享详情")
    public ShareDto findById(@PathVariable Integer id) {
        return this.shareService.findById(id);
    }

    @GetMapping(value = "/hello")
    @ApiIgnore
    public String getHello() {
        return this.shareService.getHello();
    }

    @GetMapping("/test-q")
    @ApiIgnore
    public UserDTO query(UserDTO userDTO) {
        return testUserCenterFeignClient.query(userDTO);
    }

    @GetMapping("/query")
    @ApiOperation(value = "分享列表", notes = "分享列表")
    public List<Share> query(
            @RequestParam(required = false) String title,
            @RequestParam(required = false, defaultValue = "1") Integer pageNo,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize,
            @RequestHeader(value = "X-Token", required = false) String token) throws Exception {
        if (pageSize > 100) {
            pageSize = 100;
        }
        Integer userId = null;
        if (StringUtils.isNotBlank(token)) {
            Claims claims = this.jwtOperator.getClaimsFromToken(token);
            log.info(claims.toString());
            userId = (Integer) claims.get("id");
        } else {
            log.info("没有token");
        }
        return this.shareService.query(title, pageNo, pageSize, userId).getList();
    }

    @PostMapping("/contribute")
    public int contribute(@RequestBody ShareContributeDto shareContributeDto){
        return shareService.contribute(shareContributeDto);
    }
}
