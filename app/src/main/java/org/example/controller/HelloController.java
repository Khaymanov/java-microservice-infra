package org.example.controller;

import org.example.model.HelloResponse;
import org.example.service.HelloService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private final HelloService helloService;

    public HelloController(HelloService helloService) {
        this.helloService = helloService;
    }

    @GetMapping("/")
    public HelloResponse hello() {
        return helloService.getGreeting();
    }

    @GetMapping("/info")
    public String info() { return "Информация о микросервисе"; }
    
}

