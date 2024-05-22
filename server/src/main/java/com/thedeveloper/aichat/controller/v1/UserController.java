package com.thedeveloper.aichat.controller.v1;

import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
@AllArgsConstructor
public class UserController {
    PasswordEncoder passwordEncoder;
    UserService userService;
    @GetMapping("/login")
    public ResponseEntity<?> login(@RequestParam String uid, @RequestParam String languageCode){
        UserEntity user = userService.findByUid(uid);
        if(user==null){
            user = new UserEntity();
            user.setUid(uid);
            user.setLanguageCode(languageCode);
            userService.save(user);
        }
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
