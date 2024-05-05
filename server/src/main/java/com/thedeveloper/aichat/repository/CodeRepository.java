package com.thedeveloper.aichat.repository;

import com.thedeveloper.aichat.entity.CodeEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.CodeStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CodeRepository extends JpaRepository<CodeEntity, Long> {
    CodeEntity findCodeEntityByUserAndStatus(UserEntity user, CodeStatus status);
    List<CodeEntity> findCodeEntitiesByUser(UserEntity user);
}
