package com.web.billy.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class controller {	
	 
	@GetMapping({"/", "/index"})
	public String index() {
		return"index";
	}
	
	
	@GetMapping("/introduction")
	public String introduction() {
		return"introduction";
	}
	
	@GetMapping("/login")
	public String login() {
		return"login";
	}	

	@GetMapping("/memberShipCenter")
	public String memberShipCenter() {
		return"memberShipCenter";
	}
	
	@GetMapping("/memberEdit")
	public String memberEdit() {
		return"memberEdit";
	}
	
	@GetMapping("/memberCreate")
	public String memberCreate() {
		return"memberCreate";
	}	
	
	@GetMapping("/service")
	public String service() {
		return"service";
	}
	
	@GetMapping("/reservationSearch")
	public String reservationSearch() {
		return"reservationSearch";
	}
	
	
}
