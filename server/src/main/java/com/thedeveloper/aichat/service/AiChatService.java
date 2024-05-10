package com.thedeveloper.aichat.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.theokanning.openai.client.OpenAiApi;
import com.theokanning.openai.completion.CompletionRequest;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.completion.chat.ChatMessageRole;
import com.theokanning.openai.service.OpenAiService;
import lombok.AllArgsConstructor;
import okhttp3.*;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;
import retrofit2.Retrofit;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

import static com.theokanning.openai.service.OpenAiService.*;

@Service
public class AiChatService implements CommandLineRunner {
    OpenAiService service;
    @Override
    public void run(String... args) throws Exception {
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
        List<ChatMessage> messages = new ArrayList<>();
        ChatMessage message = new ChatMessage(ChatMessageRole.SYSTEM.value(), "Пиши только по Русски.");
        ChatMessage message1 = new ChatMessage(ChatMessageRole.SYSTEM.value(), "Ты самый крутой разработчик на Java, который может предложить решение любой проблемы.");
        ChatMessage userMessage1 = new ChatMessage(ChatMessageRole.USER.value(), "Что ты умеешь ?");
        messages.add(message);
        messages.add(message1);
        messages.add(userMessage1);
        ChatCompletionRequest completionRequest = ChatCompletionRequest.builder()
                .model("gpt-3.5-turbo")
                .messages(messages)
                .maxTokens(256)
                .build();
        service.createChatCompletion(completionRequest).getChoices().forEach(System.out::println);
    }

}
