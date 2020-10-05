package com.soft1851.content.controller;

import com.soft1851.content.domain.dto.ShareDto;
import com.soft1851.content.domain.entity.Share;
import com.soft1851.content.service.ShareService;
import com.soft1851.content.service.impl.ShareServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/share")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
@Api(tags = "分享接口",value = "提供分享相关的Rest API")
public class ShareController {
    private final ShareServiceImpl shareService;

    @GetMapping(value = "/one/{id}")
    @ApiOperation(value = "查询指定id的分享详情",notes = "查询指定id的分享详情")
    public ShareDto getShareById(@PathVariable Integer id){
        return shareService.findById(id);
    }

    @GetMapping("/query")
    @ApiOperation(value = "分享列表",notes = "分享列表")
    public List<Share> query(
            @RequestParam(required = false) String title,
            @RequestParam(required = false,defaultValue = "1") Integer pageNo,
            @RequestParam(required = false,defaultValue = "10") Integer pageSize,
            @RequestParam(required = false) Integer userId) throws Exception{
        if (pageSize>100){
            pageSize = 100;
        }
        return this.shareService.query(title,pageNo,pageSize,userId).getList();
    }
}
