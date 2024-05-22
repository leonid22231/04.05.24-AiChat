package com.thedeveloper.aichat.controller.v1;

import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.MessageEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatModel;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.thedeveloper.aichat.service.ChatService;
import com.thedeveloper.aichat.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.Comparator;
import java.util.concurrent.CompletableFuture;

@RestController
@EnableAsync
@RequestMapping("/api/v1/chat")
@AllArgsConstructor
public class ChatController {
    UserService userService;
    ChatService chatService;
    @GetMapping("/{theme}")
    public CompletableFuture<ResponseEntity<?>> findChat(@PathVariable("theme") ChatTheme theme, @RequestParam("uid")String uid){
        UserEntity user = userService.findByUid(uid);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        if(chat==null){
            chat = new ChatEntity();
            chat.setTheme(theme);
            chat.setUser(user);
        }
        chatService.save(chat);
        Comparator<MessageEntity> comparator = (c1, c2) -> {
            return Long.valueOf(c1.getSend_time().getTime()).compareTo(c2.getSend_time().getTime());
        };
        chat.getMessages().sort(comparator);
        return CompletableFuture.completedFuture(new ResponseEntity<>(chat, HttpStatus.OK));
    }
    @DeleteMapping("/{theme}/delete")
    public CompletableFuture<ResponseEntity<?>> deleteChat(@PathVariable("theme")ChatTheme theme, @RequestParam("uid")String uid){
        UserEntity user = userService.findByUid(uid);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        chatService.delete(chat);
        return CompletableFuture.completedFuture(new ResponseEntity<>(HttpStatus.OK));
    }
    @PostMapping("/{theme}/model")
    public CompletableFuture<ResponseEntity<?>> changeModel(@PathVariable("theme")ChatTheme theme, @RequestParam("uid")String uid, @RequestParam("model")ChatModel model){
        UserEntity user = userService.findByUid(uid);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        chat.setModel(model);
        chatService.save(chat);
        return CompletableFuture.completedFuture(new ResponseEntity<>(HttpStatus.OK));
    }
}
