package com.thedeveloper.aichat.entity;

import com.thedeveloper.aichat.entity.enums.CodeStatus;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "codes")
@Data
public class CodeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String code;
    @Enumerated(EnumType.STRING)
    private CodeStatus status;
    @ManyToOne
    @JoinColumn(name = "user", referencedColumnName = "email")
    private UserEntity user;
}
