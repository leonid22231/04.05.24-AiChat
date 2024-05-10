package com.thedeveloper.aichat.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.thedeveloper.aichat.entity.MessageEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatTheme;
import com.theokanning.openai.client.OpenAiApi;
import com.theokanning.openai.completion.chat.ChatCompletionChoice;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.completion.chat.ChatMessageRole;
import com.theokanning.openai.service.OpenAiService;
import okhttp3.*;
import retrofit2.Retrofit;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import static com.theokanning.openai.service.OpenAiService.*;

public class UserBot {
    OpenAiService service;
    ChatCompletionRequest completionRequest;
    List<ChatMessage> messages = new ArrayList<>();
    public UserBot(List<MessageEntity> latest_messages, ChatTheme theme){
        Authenticator proxyAuthenticator = new Authenticator() {
            @Override
            public Request authenticate(Route route, Response response) throws IOException {
                String credential = Credentials.basic("mrTkLW", "8c3FrC");
                return response.request().newBuilder()
                        .header("Proxy-Authorization", credential)
                        .build();
            }
        };
        ObjectMapper mapper = defaultObjectMapper();
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("45.129.184.209", 8000));
        OkHttpClient client = defaultClient("sk-proj-jgNdE5l1BXIxVCrzt7zyT3BlbkFJ0XfgwEPFCd9YORIjrBs4", Duration.ofSeconds(60))
                .newBuilder()
                .proxy(proxy)
                .proxyAuthenticator(proxyAuthenticator)
                .build();
        Retrofit retrofit = defaultRetrofit(client, mapper);
        OpenAiApi api  = retrofit.create(OpenAiApi.class);
        service = new OpenAiService(api);
        messages.add(getLanguage());
        messages.add(getDescription(theme));
        for(MessageEntity message: latest_messages){
            ChatMessageRole chatMessageRole;
            switch (message.getMode()){
                case Ai -> chatMessageRole = ChatMessageRole.ASSISTANT;
                default -> chatMessageRole = ChatMessageRole.USER;
            }
            messages.add(new ChatMessage(chatMessageRole.value(), message.getContent()));
        }
    }
    public List<ChatMessage> create(){
        messages.add(new ChatMessage(ChatMessageRole.USER.value(), "Что ты умеешь ?"));
        completionRequest = ChatCompletionRequest.builder()
                .model("gpt-3.5-turbo")
                .messages(messages)
                .maxTokens(256)
                .build();
        return service.createChatCompletion(completionRequest).getChoices().stream().map(ChatCompletionChoice::getMessage).toList();
    }
    public List<ChatMessage> execute(String message){
        messages.add(new ChatMessage(ChatMessageRole.USER.value(), message));
        completionRequest = ChatCompletionRequest.builder()
                .model("gpt-3.5-turbo")
                .messages(messages)
                .maxTokens(256)
                .build();
        return service.createChatCompletion(completionRequest).getChoices().stream().map(ChatCompletionChoice::getMessage).toList();
    }
    private ChatMessage getDescription(ChatTheme theme){
        switch (theme){
            case more_assistant: return  new ChatMessage(ChatMessageRole.SYSTEM.value(), "Ты самый крутой ассистент для помощи людям, который поможет и проконсультирует в любом вопросе .");
            default: return  new ChatMessage(ChatMessageRole.SYSTEM.value(), "Ты самый крутой ассистент для помощи людям, который поможет и проконсультирует в любом вопросе .");
        }
    }
    private ChatMessage getLanguage(){
        return new ChatMessage(ChatMessageRole.SYSTEM.value(), "Пиши только по Русски.");
    }
}
