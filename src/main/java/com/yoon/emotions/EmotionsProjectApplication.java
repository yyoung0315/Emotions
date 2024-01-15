package com.yoon.emotions;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages= {"com.yoon.emotions","com.yoon.emotions.controller"})
public class EmotionsProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(EmotionsProjectApplication.class, args);
	}

}
