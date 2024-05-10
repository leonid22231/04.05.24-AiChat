package com.thedeveloper.aichat.chatservice;

import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.ConnectListener;
import com.corundumstudio.socketio.listener.DataListener;
import com.corundumstudio.socketio.listener.DisconnectListener;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Objects;
import java.util.stream.Collectors;

@Component
@Slf4j
public class ServerModel {
    private final SocketIOServer server;
    private final ServerService serverService;

    public ServerModel(SocketIOServer server, ServerService serverService) {
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
            }else{
                serverService.saveServerMessage(senderClient, data);
            }
        };
    }

    private ConnectListener onConnect(){
        return  (client) -> {

        };
    }
    private DisconnectListener onDisconnect(){
        return  (client) -> {

        };
    }
}
