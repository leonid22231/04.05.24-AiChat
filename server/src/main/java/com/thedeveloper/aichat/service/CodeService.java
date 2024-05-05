package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.entity.CodeEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.CodeStatus;
import com.thedeveloper.aichat.repository.CodeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class CodeService {
    CodeRepository codeRepository;
    public List<CodeEntity> findByUser(UserEntity user){
        return codeRepository.findCodeEntitiesByUser(user);
    }
    public CodeEntity findActive(UserEntity user){
        return codeRepository.findCodeEntityByUserAndStatus(user, CodeStatus.wait);
    }
    public void delete(CodeEntity codeEntity){
        codeRepository.delete(codeEntity);
    }
    public void save(CodeEntity codeEntity) {
        codeRepository.save(codeEntity);
    }
}
