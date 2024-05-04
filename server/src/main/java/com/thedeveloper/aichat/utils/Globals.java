package com.thedeveloper.aichat.utils;

import com.thedeveloper.aichat.entity.CodeEntity;

import java.util.Random;

public class Globals {
    public static String codeGenerator(){
        Random random = new Random();
        return  String.format("%04d", random.nextInt(10000));
    }
    public static void sendCode(CodeEntity codeEntity){

    }
}
