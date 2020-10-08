package com.soft1851.contentcenter.configuration;

import feign.Logger;
import org.springframework.context.annotation.Bean;

/**
 * @author tengf
 * @Description:  这个类不要@Configuration注解，否则必须挪到@ComponentScan能扫描的包以外
 * @date: 2020/9/29 19:13
 */
public class GlobalFeignConfiguration {
    @Bean
    public Logger.Level level(){
        // 让feign打印所有请求的细节
        return Logger.Level.FULL;
    }
}
