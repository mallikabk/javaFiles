package com.securisk.config;

import org.springframework.context.annotation.Bean;

import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

public class SwaggerConfig {
	@Bean
	public Docket dock() {
		return new Docket(DocumentationType.SWAGGER_2);
	}

}
