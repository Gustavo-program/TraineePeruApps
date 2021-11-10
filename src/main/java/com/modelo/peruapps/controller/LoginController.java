package com.modelo.peruapps.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.modelo.peruapps.entidad.Cliente;
import com.modelo.peruapps.service.ClienteService;

@Controller
public class LoginController {
	
	@Autowired
	private ClienteService clienteService;
	
	

	@RequestMapping("/loginPage")
	public String login(Cliente user, HttpSession session, HttpServletRequest request, ModelMap model) {
		Cliente usuario = clienteService.login(user);
		if(usuario == null) {
			request.setAttribute("mensaje", "El Usuario No existe");
			
			return "login";
		}
		else {
			
			model.addAttribute("ruta", "verIndex");
			session.setAttribute("objCliente", usuario);
			
			return "index";
		}
		
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}
	

}
