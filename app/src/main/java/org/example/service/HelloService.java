package org.example.service;

import org.example.model.HelloResponse;
import org.springframework.stereotype.Service;

@Service
public class HelloService {
    public HelloResponse getGreeting() {
        return new HelloResponse("Привет от микросервиса!");
    }
}

