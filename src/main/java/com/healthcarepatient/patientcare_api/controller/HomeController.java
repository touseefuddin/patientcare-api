package com.healthcarepatient.patientcare_api.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "Application is CHANGED ALL GOOF fully running!";
    }

    @GetMapping("/test")
    public String test() {
        return "Test endpoint working!";
    }
}
