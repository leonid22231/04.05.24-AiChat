package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.repository.MessageRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class MessageService {
    MessageRepository messageRepository;
}
