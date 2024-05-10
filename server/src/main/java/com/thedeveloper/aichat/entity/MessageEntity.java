package com.thedeveloper.aichat.entity;

import com.thedeveloper.aichat.entity.enums.MessageMode;
import com.thedeveloper.aichat.entity.enums.MessageType;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "messages")
@Data
public class MessageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    String id;
    @Enumerated(EnumType.STRING)
    MessageMode mode;
    @Enumerated(EnumType.STRING)
    MessageType type;
    @Column(columnDefinition = "TEXT")
    String content;
    Date send_time;
}
