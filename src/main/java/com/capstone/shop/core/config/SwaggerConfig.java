package com.capstone.shop.core.config;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.annotations.servers.Server;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@OpenAPIDefinition(
        info = @Info(
                title = "Shop API Docs",
                description = "쇼핑몰 API 테스트",
                version = "v1"
        ),
        servers = {
                @Server(url = "http://localhost:8080", description = "로컬에서 8080포트 실행중인 서버입니다."),
                @Server(url = "https://api.induk.shop", description = "aws https 서버입니다.")
        }
)
@Configuration
public class SwaggerConfig {

    private static final String BEARER_TOKEN_PREFIX = "bearer"; // 'bearer'로 수정

    @Bean
    public OpenAPI openAPI() {
        String securityJwtName = "JWT";
        SecurityRequirement securityRequirement = new SecurityRequirement().addList(securityJwtName);
        Components components = new Components()
                .addSecuritySchemes(securityJwtName, new SecurityScheme()
                        .name(securityJwtName)
                        .type(SecurityScheme.Type.HTTP)
                        .scheme(BEARER_TOKEN_PREFIX) // 인증 방식 지정
                        .bearerFormat("JWT")); // Bearer 토큰 형식

        return new OpenAPI()
                .addSecurityItem(securityRequirement)
                .components(components);
    }
}
