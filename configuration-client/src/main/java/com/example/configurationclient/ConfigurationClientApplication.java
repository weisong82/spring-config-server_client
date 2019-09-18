package com.example.configurationclient;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class ConfigurationClientApplication {

    public static void main(String[] args) {
        SpringApplication.run(ConfigurationClientApplication.class, args);
    }
}

@RefreshScope
@RestController
class MessageRestController {

    //from https://github.com/spring-cloud-samples/config-repo/blob/master/samplebackendservice-development.properties
    @Value("${bar:Hello default}")
    private String message;

    //from https://github.com/spring-cloud-samples/config-repo/blob/master/samplebackendservice.properties
    @Value("${foo:Hello default}")
    private String message2;


    @RequestMapping("/message")
    String getMessage() {
        return this.message;
    }

    @RequestMapping("/message2")
    String getMessage2() {
        return this.message2;
    }
}
