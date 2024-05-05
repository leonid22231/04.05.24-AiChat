package com.thedeveloper.aichat.controller.v1;

import com.thedeveloper.aichat.entity.CodeEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.CodeStatus;
import com.thedeveloper.aichat.entity.enums.UserGender;
import com.thedeveloper.aichat.security.PasswordEncoderConfig;
import com.thedeveloper.aichat.service.CodeService;
import com.thedeveloper.aichat.service.UserService;
import com.thedeveloper.aichat.utils.Globals;
import lombok.AllArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/v1")
@AllArgsConstructor
public class UserController {
    PasswordEncoder passwordEncoder;
    UserService userService;
    CodeService codeService;
    @GetMapping("/login")
    public ResponseEntity<?> login(@RequestParam String email, @RequestParam String password){
        UserEntity userEntity = userService.findByEmail(email);
        if(userEntity!=null && passwordEncoder.matches(password, userEntity.getPassword())){
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
    }
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestParam("email")String email, @RequestParam("password")String password){
        UserEntity user = userService.findByEmail(email);
        if(user==null){
            user = new UserEntity();
        }else{
            if(user.isActive()){
                return new ResponseEntity<>("Такой пользователь уже существует", HttpStatus.BAD_REQUEST);
            }else{
                List<CodeEntity> codesByUser = codeService.findByUser(user).stream().toList();
                if(!codesByUser.isEmpty()){
                    for(CodeEntity code : codesByUser){
                        codeService.delete(code);
                    }
                }
                userService.delete(user);
                user = new UserEntity();
            }
        }
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        user.setActive(false);
        user.setRegister_date(new Date());
        userService.save(user);
        return new ResponseEntity<>(createCode(user), HttpStatus.OK);
    }
    @PostMapping("/resendCode")
    public ResponseEntity<?> resendCode(@RequestParam("email")String email){
        UserEntity user = userService.findByEmail(email);
        CodeEntity active_code = codeService.findActive(user);
        active_code.setStatus(CodeStatus.end);
        codeService.save(active_code);
        return new ResponseEntity<>(createCode(user), HttpStatus.OK);
    }
    @PostMapping("/activateUser")
    public ResponseEntity<?> activateUser(@RequestParam("email")String email){
        UserEntity user = userService.findByEmail(email);
        user.setActive(true);
        userService.save(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @PostMapping("/sendInfo")
    public ResponseEntity<?> sendInfo(@RequestParam("email")String email, @RequestParam("name")String name, @RequestParam("phone_code")String phoneCode, @RequestParam("phone")String phone, @RequestParam("gender")UserGender gender, @RequestParam("date_of_birth") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME) LocalDateTime dateOfBirth, @RequestBody(required = false) MultipartFile file){
        UserEntity user = userService.findByEmail(email);
        user.setName(name);
        user.setGender(gender);
        user.setDate_of_birth(convertToDateViaSqlDate(dateOfBirth.toLocalDate()));
        user.setPhone_code(phoneCode);
        user.setPhone_number(phone);
        userService.save(user);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    @GetMapping("/info")
    public ResponseEntity<?> info(@RequestParam("email")String email){
        UserEntity user = userService.findByEmail(email);
        return new ResponseEntity<>(user,HttpStatus.OK);
    }
    public Date convertToDateViaSqlDate(LocalDate dateToConvert) {
        return java.sql.Date.valueOf(dateToConvert);
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
}
