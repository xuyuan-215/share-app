package com.soft1851.content;

import com.soft1851.content.domain.dto.UserDto;
import com.soft1851.content.feignclient.TestUserCenterFeignClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Random;

@Slf4j
@RestController
@RequestMapping(value = "/test")
public class TestController {

    @Autowired
    private DiscoveryClient discoveryClient;
    @Autowired
    private TestUserCenterFeignClient testUserCenterFeignClient;
    @Autowired
    private RestTemplate restTemplate;

    /**
     * 测试：服务发现，证明内容中心总能找到用户中心
     * @return 用户中心所有实例的地址信息
     */
    @GetMapping("/discovery")
    public List<ServiceInstance> getInstances(){
        //查询指定服务的所有实例的信息
        //consul/eureka/zookeeper...
        System.out.println(this.discoveryClient.getInstances("user-center"));
        return this.discoveryClient.getInstances("user-center");
    }

    @GetMapping("/call/hello")
    public String callUserCenter(){
        //用户中心所有的实例信息
        List<ServiceInstance> instances = discoveryClient.getInstances("user-center");
        Random random = new Random();
        int index = random.nextInt(instances.size());
        String targetUrl = instances.get(index).getUri().toString()+"/user/hello";

        //stream编程、Lambda表达式、函数式编程
//        String targetUrl = instances.stream()
//                .map(instance -> instance.getUri().toString()+"/user/hello")
//                .findFirst()
//                .orElseThrow(()->new IllegalArgumentException("当前没有实例!"));
        log.info(targetUrl);
        return targetUrl+"："+restTemplate.getForObject(targetUrl,String.class);
    }

    @GetMapping(value = "/call/ribbon")
    public String callByRibbon(){
        return restTemplate.getForObject("http://user-center/user/hello",String.class);
    }

    @GetMapping(value = "/test-q")
    public UserDto query(UserDto userDto){
        return testUserCenterFeignClient.query(userDto);
    }

}
