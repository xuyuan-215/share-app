package com.soft1851.content.service;

import com.github.pagehelper.PageInfo;
import com.soft1851.content.dao.ShareMapper;
import com.soft1851.content.domain.entity.Share;
import com.soft1851.content.domain.dto.ShareDto;
import com.soft1851.content.domain.entity.User;
import com.soft1851.content.feignclient.UserCenterFeignClient;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;



public interface ShareService {
    /**
     * 分享详情
     * @param id
     * @return
     */
    ShareDto findById(Integer id);

    /**
     * 根据标题模糊查询某个用户的分享列表数据，title为空则为所有数据，查询结果分页
     * @param title
     * @param pageNo
     * @param pageSize
     * @param userId
     * @return PageInfo<Share>
     */
    PageInfo<Share> query(String title,Integer pageNo,Integer pageSize,Integer userId);

}
