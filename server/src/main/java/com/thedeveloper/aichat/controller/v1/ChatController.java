package com.thedeveloper.aichat.controller.v1;

import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.thedeveloper.aichat.service.ChatService;
import com.thedeveloper.aichat.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.CompletableFuture;

@RestController
@EnableAsync
@RequestMapping("/api/v1/chat")
@AllArgsConstructor
public class ChatController {
    UserService userService;
    ChatService chatService;
    @GetMapping("/{theme}")
    public CompletableFuture<ResponseEntity<?>> findChat(@PathVariable("theme") ChatTheme theme, @RequestParam("email")String email){
        UserEntity user = userService.findByEmail(email);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        if(chat==null){
            chat = new ChatEntity();
            chat.setTheme(theme);
            chat.setUser(user);
        }
        chatService.save(chat);
        return CompletableFuture.completedFuture(new ResponseEntity<>(chat, HttpStatus.OK));
    }
}
