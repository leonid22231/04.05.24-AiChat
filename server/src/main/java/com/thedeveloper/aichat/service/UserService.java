package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService {
    private UserRepository userRepository;
    public UserEntity findById(String id){
        return userRepository.findUserEntityById(id);
    }

    public UserEntity findByUid(String uid) {
        return userRepository.findUserEntityByUid(uid);
    }
    public void delete(UserEntity userEntity){
        userRepository.delete(userEntity);
    }
    public void save(UserEntity user){
        userRepository.save(user);
    }
}
