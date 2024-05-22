package com.thedeveloper.aichat.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.thedeveloper.aichat.entity.ChatEntity;
import com.thedeveloper.aichat.entity.MessageEntity;
import com.thedeveloper.aichat.entity.UserEntity;
import com.thedeveloper.aichat.entity.enums.ChatModel;
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
import java.util.Comparator;
import java.util.List;

import static com.theokanning.openai.service.OpenAiService.*;

public class UserBot {
    OpenAiService service;
    ChatCompletionRequest completionRequest;
    List<ChatMessage> messages = new ArrayList<>();
    String model = "gpt-3.5-turbo";
    public UserBot(ChatEntity chat, ChatTheme theme, String languageCode){
        switch (chat.getModel()){
            case gpt_3 -> model = "gpt-3.5-turbo";
            case gpt_4 -> model = "gpt-4-turbo";
        }
        Authenticator proxyAuthenticator = new Authenticator() {
            @Override
            public Request authenticate(Route route, Response response) throws IOException {
                String credential = Credentials.basic("secret", "secret");
                return response.request().newBuilder()
                        .header("Proxy-Authorization", credential)
                        .build();
            }
        };
        ObjectMapper mapper = defaultObjectMapper();
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("45.129.184.209", 8000));
        OkHttpClient client = defaultClient("secret", Duration.ofSeconds(60))
                .newBuilder()
                .proxy(proxy)
                .proxyAuthenticator(proxyAuthenticator)
                .build();
        Retrofit retrofit = defaultRetrofit(client, mapper);
        OpenAiApi api  = retrofit.create(OpenAiApi.class);
        service = new OpenAiService(api);
        messages.add(getLanguage(languageCode));
        messages.add(getDescription(theme));
        Comparator<MessageEntity> comparator = (c1, c2) -> {
            return Long.valueOf(c1.getSend_time().getTime()).compareTo(c2.getSend_time().getTime());
        };
        chat.getMessages().sort(comparator);
        for(MessageEntity message: chat.getMessages()){
            ChatMessageRole chatMessageRole;
            switch (message.getMode()){
                case Ai -> chatMessageRole = ChatMessageRole.ASSISTANT;
                default -> chatMessageRole = ChatMessageRole.USER;
            }
            messages.add(new ChatMessage(chatMessageRole.value(), message.getContent()));
        }
    }
    public List<ChatMessage> create(){
        messages.add(new ChatMessage(ChatMessageRole.USER.value(), "Какое твое назначение ?"));
        completionRequest = ChatCompletionRequest.builder()
                .model(model)
                .messages(messages)
                .maxTokens(512)
                .build();
        return service.createChatCompletion(completionRequest).getChoices().stream().map(ChatCompletionChoice::getMessage).toList();
    }
    public List<ChatMessage> execute(String message){
        messages.add(new ChatMessage(ChatMessageRole.USER.value(), message));
        completionRequest = ChatCompletionRequest.builder()
                .model(model)
                .messages(messages)
                .maxTokens(512)
                .build();
        return service.createChatCompletion(completionRequest).getChoices().stream().map(ChatCompletionChoice::getMessage).toList();
    }
    private ChatMessage getDescription(ChatTheme theme){
        switch (theme){

            default: return generateDescription("Помогать пользователю","Отвечать на вопросы","Консультировать");
        }
    }
    private ChatMessage generateDescription(String... function){
        String functions = "";
        for(int i = 0; i < function.length; i++){
            if(i<function.length - 1)
                functions += function[i] + ",";
            else
                functions += function[i] + ".";
        }
        return new ChatMessage(ChatMessageRole.SYSTEM.value(),"Твоё назначение: "+functions+" Пиши только с учетом своего назначения.Пиши с использованием эмоджи");
    }
    private ChatMessage getLanguage(String lngCode){
        return new ChatMessage(ChatMessageRole.SYSTEM.value(), "Пиши только на языке с кодом "+lngCode+" .");
    }
}
