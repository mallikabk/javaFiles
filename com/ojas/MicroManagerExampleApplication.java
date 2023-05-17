package com.ojas;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@SpringBootApplication
@EnableDiscoveryClient
public class MicroManagerExampleApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroManagerExampleApplication.class, args);
	}

}
