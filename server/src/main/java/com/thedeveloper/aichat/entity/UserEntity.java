package com.thedeveloper.aichat.entity;

import com.thedeveloper.aichat.entity.enums.UserGender;
import com.thedeveloper.aichat.entity.enums.UserSubType;
import jakarta.persistence.*;
import lombok.Data;

import java.util.Date;

@Entity
@Table(name = "users")
@Data
public class UserEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    private String name;
    @Column(unique = true)
    private String email;
    private String phone_code;
    private String phone_number;
    private String password;
    private String photo;
    private Date date_of_birth;
    private Date register_date;
    @Enumerated(EnumType.STRING)
    private UserGender gender;
    private boolean subscription = false;
    private Date subscription_date;
    @Enumerated(EnumType.STRING)
    private UserSubType subscription_type;
    private boolean active = false;
}