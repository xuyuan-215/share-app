package com.soft1851.content.configuration;

import org.springframework.cloud.netflix.ribbon.RibbonClient;
import org.springframework.cloud.netflix.ribbon.RibbonClients;
import org.springframework.context.annotation.Configuration;
import ribbonconfig.RibbonConfiguration;

@Configuration
//@RibbonClient(name = "user-center",configuration = RibbonConfiguration.class)
//@RibbonClients(defaultConfiguration =RibbonConfiguration.class) //全局配置  随机策略
public class UserContentRibbonConfig {
}
