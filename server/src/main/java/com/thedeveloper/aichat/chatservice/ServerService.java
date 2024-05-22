package com.thedeveloper.aichat.chatservice;

import com.corundumstudio.socketio.SocketIOClient;
import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.MessageEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.thedeveloper.aichat.entity.enums.MessageMode;
import com.thedeveloper.aichat.entity.enums.MessageType;
import com.thedeveloper.aichat.service.ChatService;
import com.thedeveloper.aichat.service.MessageService;
import com.thedeveloper.aichat.service.UserService;
import com.thedeveloper.aichat.utils.UserBot;
import com.theokanning.openai.completion.chat.ChatMessage;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class ServerService {
    MessageService messageService;
    UserService userService;
    ChatService chatService;
    public void sendSocketMessage(SocketIOClient senderClient, MessageEntity message, String room, boolean bot) {
        for (SocketIOClient client : senderClient.getNamespace().getRoomOperations(room).getClients()) {
            if (!client.getSessionId().equals(senderClient.getSessionId()) || bot) {
                client.sendEvent("read_message", message);
            }
        }
    }
    public void saveMessage(SocketIOClient client, MessageModel message){
        var params = client.getHandshakeData().getUrlParams();
        ChatTheme theme = ChatTheme.valueOf(params.get("theme").stream().collect(Collectors.joining()));
        String uid = params.get("uid").stream().collect(Collectors.joining());
        UserEntity user = userService.findByUid(uid);
        MessageEntity messageEntity = new MessageEntity();
        messageEntity.setContent(message.getContent());
        messageEntity.setMode(MessageMode.User);
        messageEntity.setSend_time(new Date());
        messageEntity.setType(MessageType.Text);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        chat.getMessages().add(messageEntity);
        chatService.save(chat);
        UserBot userBot = new UserBot(chat, theme,uid);
        saveBotMessage(client, userBot.execute(message.getContent()));
    }
    public void saveBotMessage(SocketIOClient client, List<ChatMessage> list_messages){
        var params = client.getHandshakeData().getUrlParams();
        ChatTheme theme = ChatTheme.valueOf(params.get("theme").stream().collect(Collectors.joining()));
        String uid = params.get("uid").stream().collect(Collectors.joining());
        UserEntity user = userService.findByUid(uid);
        ChatEntity chat = chatService.findByUserAndTheme(user, theme);
        String room = user.getId()+"_theme="+theme.name();
        for(ChatMessage message : list_messages){
            MessageEntity messageEntity = new MessageEntity();
            messageEntity.setContent(message.getContent());
            messageEntity.setType(MessageType.Text);
            messageEntity.setMode(MessageMode.Ai);
            messageEntity.setSend_time(new Date());
            chat.getMessages().add(messageEntity);
            chatService.save(chat);
            sendSocketMessage(client, messageEntity, room, true);
        }
    }
}
