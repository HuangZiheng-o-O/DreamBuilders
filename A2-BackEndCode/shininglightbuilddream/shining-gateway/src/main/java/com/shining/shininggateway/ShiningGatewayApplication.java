package com.shining.shininggateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class ShiningGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(ShiningGatewayApplication.class, args);
    }

}
