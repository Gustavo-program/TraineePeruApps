package com.modelo.peruapps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class VistasController {

	@RequestMapping("/verLogin")
	public String verLogin() {
		return "login";
	}
	
	
	@RequestMapping("/verIndex")
	public String verIndex() {
		return "index";
	}
	
	@RequestMapping("/verRegistroCliente")
	public String verRegistroCliente() {
		return "registrar";
	}
}
