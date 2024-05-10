package com.thedeveloper.aichat.utils.storage;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Getter
@Setter
@ConfigurationProperties("user.photo")
public class UserProfilePhotoProperties {
    private String location = "storage";
}