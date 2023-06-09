package com.api.automation.util;

import com.github.javafaker.Faker;

public class Util {
    public static String randomName(){
        Faker faker = new Faker();
        return faker.name().firstName();
    }

    public static String cutName(String name){
        return name.substring(0, 3);
    }

}
