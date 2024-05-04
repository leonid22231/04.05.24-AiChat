package com.thedeveloper.aichat.service;

import com.thedeveloper.aichat.entity.CodeEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.CodeStatus;
import com.thedeveloper.aichat.repository.CodeRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class CodeService {
    CodeRepository codeRepository;
    public CodeEntity findActive(UserEntity user){
        return codeRepository.findCodeEntityByUserAndStatus(user, CodeStatus.wait);
    }
    public void save(CodeEntity codeEntity) {
        codeRepository.save(codeEntity);
    }
}
