package com.thedeveloper.aichat.repository;

import com.thedeveloper.aichat.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, String> {
    UserEntity findUserEntityByUid(String uid);
    UserEntity findUserEntityById(String id);
}
