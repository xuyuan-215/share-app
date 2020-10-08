package com.soft1851.contentcenter.service;

import com.soft1851.contentcenter.domain.entity.Notice;

/**
 * @author tengf
 * @Description:
 * @date: 2020/10/4 20:50
 */
public interface NoticeService {

    /**
     * 查询最新公告
     * @return
     *
     */
    Notice getLatest();
}
