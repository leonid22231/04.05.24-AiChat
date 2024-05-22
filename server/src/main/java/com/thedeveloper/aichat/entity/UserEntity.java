package com.thedeveloper.aichat.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.thedeveloper.aichat.entity.enums.ChatModel;
import com.thedeveloper.aichat.entity.enums.UserGender;
import com.thedeveloper.aichat.entity.enums.UserSubType;
import jakarta.persistence.*;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
@Data
public class UserEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    @Column(unique = true, nullable = false)
    private String uid;
    private String languageCode;
}