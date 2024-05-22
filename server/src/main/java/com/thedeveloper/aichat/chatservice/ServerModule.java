package com.thedeveloper.aichat.chatservice;

import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.thedeveloper.aichat.service.ChatService;
import com.thedeveloper.aichat.service.UserService;
import com.thedeveloper.aichat.utils.UserBot;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Objects;
import java.util.stream.Collectors;

@Component
@Slf4j
public class ServerModule {
    private final SocketIOServer server;
    private final ServerService serverService;
    @Autowired
    UserService userService;
    @Autowired
    private ChatService chatService;

    public ServerModule(SocketIOServer server, ServerService serverService) {
        this.server = server;
        this.serverService = serverService;
        server.addConnectListener(onConnect());
        server.addDisconnectListener(onDisconnect());
        server.addEventListener("send_message", MessageModel.class, onChatReceived());
    }
    private DataListener<MessageModel> onChatReceived() {
        return (senderClient, data, ackSender) -> {
            log.info(data.toString());
            if(!Objects.equals(senderClient.getHandshakeData().getUrlParams().get("uid").stream().collect(Collectors.joining()), "0")){
                serverService.saveMessage(senderClient, data);
            }
        };
    }

    private ConnectListener onConnect(){
        return  (client) -> {
            var params = client.getHandshakeData().getUrlParams();
            ChatTheme theme = ChatTheme.valueOf(params.get("theme").stream().collect(Collectors.joining()));
            String uid = params.get("uid").stream().collect(Collectors.joining());
            UserEntity user = userService.findByUid(uid);
            String room = user.getId()+"_theme="+theme.name();
            client.joinRoom(room);
            ChatEntity chat = chatService.findByUserAndTheme(user, theme);
            if((chat!=null && chat.getMessages()==null || chat.getMessages().isEmpty())){
                UserBot bot = new UserBot(chat, theme, user.getLanguageCode());
                serverService.saveBotMessage(client, bot.create());
            }
            log.info("Socket ID[{}][{}] - room[{}] - Connected to chat module through", client.getSessionId().toString(), user.getUid(),room);
        };
    }
    private DisconnectListener onDisconnect(){
        return  (client) -> {
            var params = client.getHandshakeData().getUrlParams();
            ChatTheme theme = ChatTheme.valueOf(params.get("theme").stream().collect(Collectors.joining()));
            String uid = params.get("uid").stream().collect(Collectors.joining());
            UserEntity user = userService.findByUid(uid);
            String room = user.getId()+"_theme="+theme.name();
            client.leaveRoom(room);

            log.info("Socket ID[{}][{}] - room[{}] disconnected to chat module through", client.getSessionId().toString(), user.getUid(),room);
        };
    }
}
