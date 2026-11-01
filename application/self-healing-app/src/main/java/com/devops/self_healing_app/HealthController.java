
package com.devops.self_healing_app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
public class HealthController {

    @GetMapping("/")
    public String home() {
        return "Self-Healing DevOps Platform is Running!";
    }

    @GetMapping("/health")
    public Map<String, String> health() {
        return Map.of(
            "status", "UP",
            "application", "self-healing-app"
        );
    }

    @GetMapping("/version")
    public Map<String, String> version() {
        return Map.of(
            "version", "1.0",
            "environment", "AWS"
        );
    }
}
