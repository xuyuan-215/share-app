package com.soft1851.user.service;

import com.soft1851.user.domain.entity.User;
import com.soft1851.user.mapper.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class UserService {
    private final UserMapper userMapper;

    public User getByUserId(int userId){
        Example example = new Example(User.class);
        example.createCriteria().andEqualTo("id",userId);
        return userMapper.selectOneByExample(example);
    }
}
