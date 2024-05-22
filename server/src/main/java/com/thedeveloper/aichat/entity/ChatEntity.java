package com.thedeveloper.aichat.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thedeveloper.aichat.entity.enums.ChatModel;
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
    @Enumerated(EnumType.STRING)
    ChatModel model = ChatModel.gpt_3;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    List<MessageEntity> messages = new ArrayList<>();
    @JsonIgnore
    boolean firstLaunch = true;
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user", referencedColumnName = "uid")
    UserEntity  user;
}
