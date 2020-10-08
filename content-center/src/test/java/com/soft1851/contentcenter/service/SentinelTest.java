package com.soft1851.contentcenter.service;

import org.springframework.web.client.RestTemplate;

/**
 * @author tengf
 * @Description:
 * @date: 2020/10/6 15:53
 */

public class SentinelTest {
    public static void main(String[] args) throws InterruptedException {
        RestTemplate restTemplate = new RestTemplate();
        for (int i = 0; i < 100; i++) {
            String object = restTemplate.getForObject("http://localhost:8888/test/byResource", String.class);
            System.out.println("ok");
//            Thread.sleep(200);
        }
    }
}
