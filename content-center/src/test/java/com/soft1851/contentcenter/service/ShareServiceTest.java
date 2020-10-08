package com.soft1851.contentcenter.service;

import com.github.pagehelper.PageInfo;
import com.soft1851.contentcenter.domain.entity.Share;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;


/**
 * @author tengf
 * @Description:
 * @date: 2020/10/4 21:36
 */
@SpringBootTest
class ShareServiceTest {

    @Autowired
    private ShareService shareService;

    @Test
    void findById() {
    }

    @Test
    void query() {
        PageInfo<Share> query = shareService.query(null, 1, 10, 1);
        List<Share> list = query.getList();
        list.forEach(item -> System.out.print(item.getTitle() + "," + item.getDownloadUrl()));

    }
}