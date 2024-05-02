package com.cavaliers.campus_connect_API;

import com.cavaliers.campus_connect_API.module1.model.Admin;
import com.cavaliers.campus_connect_API.module1.services.AdminService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class CampusConnectApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(CampusConnectApiApplication.class, args);
	}
	@Bean
	CommandLineRunner run(AdminService adminService){
		return args -> {
			adminService.createAdmin(new Admin("admin","0000"));
		};
	}
}
