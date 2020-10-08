package com.soft1851.usercenter.service.impl;

import com.soft1851.usercenter.dao.BonusEventLogMapper;
import com.soft1851.usercenter.domain.dto.UserAddBonusMsgDTO;
import com.soft1851.usercenter.domain.entity.BonusEventLog;
import com.soft1851.usercenter.domain.entity.User;
import com.soft1851.usercenter.dao.UserMapper;
import com.soft1851.usercenter.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * @author tengf
 * @Description:
 * @date: 2020/9/29 19:24
 */
@Slf4j
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    private final BonusEventLogMapper bonusEventLogMapper;


    @Override
    public User findById(Integer id) {
        return this.userMapper.selectByPrimaryKey(id);

    }

    @Override
    public int addBonus(UserAddBonusMsgDTO userAddBonusMsgDTO) {
        Integer userId = userAddBonusMsgDTO.getUserId();
        System.out.println(userId);
        User user = this.userMapper.selectByPrimaryKey(userId);
        user.setBonus(user.getBonus() + userAddBonusMsgDTO.getBonus());
        this.userMapper.updateByPrimaryKeySelective(user);
        return this.bonusEventLogMapper.insert(BonusEventLog.builder()
                .userId(userId)
                .value(userAddBonusMsgDTO.getBonus())
                .event("CONTRIBUTE")
                .description("投稿加积分")
                .createTime(Timestamp.valueOf(LocalDateTime.now()))
                .build());
    }

}
