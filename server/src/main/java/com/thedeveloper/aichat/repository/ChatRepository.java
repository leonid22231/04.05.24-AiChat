package com.thedeveloper.aichat.repository;

import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ChatRepository extends JpaRepository<ChatEntity, String> {
    ChatEntity findChatEntityByUserAndTheme(UserEntity user, ChatTheme theme);
}
