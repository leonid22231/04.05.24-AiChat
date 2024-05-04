package com.thedeveloper.aichat.controller.v1;

import com.thedeveloper.aichat.entity.CodeEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.CodeStatus;
import com.thedeveloper.aichat.entity.enums.UserGender;
import com.thedeveloper.aichat.security.PasswordEncoder;
import com.thedeveloper.aichat.service.CodeService;
import com.thedeveloper.aichat.service.UserService;
import com.thedeveloper.aichat.utils.Globals;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.Instant;
import java.util.Date;

@RestController
@RequestMapping("/api/v1")
public class UserController {
    PasswordEncoder passwordEncoder;
    UserService userService;
    CodeService codeService;

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestParam("email")String email, @RequestParam("password")String password){
        UserEntity user = new UserEntity();
        user.setEmail(email);
        user.setPassword(passwordEncoder.passwordEncoder().encode(password));
        user.setActive(false);
        user.setRegister_date(new Date());
        userService.save(user);
        return new ResponseEntity<>(createCode(user), HttpStatus.OK);
    }
    private String createCode(UserEntity user){
        CodeEntity codeEntity = new CodeEntity();
        codeEntity.setCode(Globals.codeGenerator());
        codeEntity.setUser(user);
        codeEntity.setStatus(CodeStatus.wait);
        codeService.save(codeEntity);
        Globals.sendCode(codeEntity);
        return  codeEntity.getCode();
    }
    @GetMapping("/resendCode")
    public ResponseEntity<?> resendCode(@RequestParam("email")String email){
        UserEntity user = userService.findByEmail(email);
        CodeEntity active_code = codeService.findActive(user);
        active_code.setStatus(CodeStatus.end);
        codeService.save(active_code);
        return new ResponseEntity<>(createCode(user), HttpStatus.OK);
    }
    @GetMapping("/registerConfirm")
    public ResponseEntity<?> registerConfirm(@RequestParam("email")String email,@RequestParam("name")String name, @RequestParam("phone_code")String phoneCode, @RequestParam("phone")String phone, @RequestParam("gender")UserGender gender, @RequestParam("date_of_birth")Date dateOfBirth, @RequestBody(required = false) MultipartFile file){
        UserEntity user = userService.findByEmail(email);
        user.setName(name);
        user.setGender(gender);
        user.setDate_of_birth(dateOfBirth);
        user.setPhone_code(phoneCode);
        user.setPhone_number(phone);
        user.setActive(true);
        userService.save(user);
    }
}
