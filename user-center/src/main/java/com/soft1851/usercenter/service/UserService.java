package com.soft1851.usercenter.service;

import com.soft1851.usercenter.domain.dto.LoginDTO;
import com.soft1851.usercenter.domain.dto.UserAddBonusMsgDTO;
import com.soft1851.usercenter.domain.entity.User;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/29 19:23
 */
public interface UserService {
    /**
     * 根据id获得用户详情
     * @param id
     * @return User
     */
    User findById(Integer id);

    /**
     * 添加一条积分记录
     *
     * @param userAddBonusMsgDTO
     */
    int addBonus(UserAddBonusMsgDTO userAddBonusMsgDTO);

    /**
     * 用户登录
     * @param loginDTO
     * @param openId
     * @return
     */
    User login(LoginDTO loginDTO, String openId);
}
