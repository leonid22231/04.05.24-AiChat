package com.thedeveloper.aichat;

import com.thedeveloper.aichat.config.ServerConfig;
import com.thedeveloper.aichat.utils.storage.StorageService;
import com.thedeveloper.aichat.utils.storage.UserProfilePhotoProperties;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@EnableConfigurationProperties({UserProfilePhotoProperties.class, ServerConfig.class})
public class AichatApplication {

    public static void main(String[] args) {
        SpringApplication.run(AichatApplication.class, args);
    }
    @Bean
    CommandLineRunner init(@Qualifier("userPhotoService") StorageService storageService) {
        return (args) -> {
            storageService.init();
        };}
}
