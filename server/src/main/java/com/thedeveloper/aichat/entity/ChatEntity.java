package com.thedeveloper.aichat.entity;

import com.thedeveloper.aichat.entity.enums.ChatTheme;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "chats")
@Data
public class ChatEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    @Enumerated(EnumType.STRING)
    ChatTheme theme;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<MessageEntity> messages = new ArrayList<>();
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user", referencedColumnName = "email")
    UserEntity  user;
}
