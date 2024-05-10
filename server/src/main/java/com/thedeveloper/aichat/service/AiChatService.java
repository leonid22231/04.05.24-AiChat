package com.thedeveloper.aichat.service;

import lombok.AllArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class OpenAiService implements CommandLineRunner {

    @Override
    public void run(String... args) throws Exception {
        OpenAiService service = new OpenAiService("your_token");
    }
}
