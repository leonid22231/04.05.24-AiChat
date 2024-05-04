package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService {
    UserRepository userRepository;
    public UserEntity findByEmail(String email) {
        return userRepository.findUserEntityByEmail(email);
    }
    public void save(UserEntity user){
        userRepository.save(user);
    }
}
