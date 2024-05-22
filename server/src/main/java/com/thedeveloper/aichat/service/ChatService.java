package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.thedeveloper.aichat.repository.ChatRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class ChatService {
    private ChatRepository chatRepository;

    public ChatEntity findByUserAndTheme(UserEntity user, ChatTheme theme){
        return chatRepository.findChatEntityByUserAndTheme(user, theme);
    }
    public void save(ChatEntity chatEntity){
        chatRepository.save(chatEntity);
    }
    public void delete(ChatEntity chatEntity){
        chatRepository.delete(chatEntity);
    }
}
