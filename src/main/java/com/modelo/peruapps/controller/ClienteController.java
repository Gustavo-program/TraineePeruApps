package com.modelo.peruapps.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.modelo.peruapps.entidad.Cliente;
import com.modelo.peruapps.service.ClienteService;

@Controller
public class ClienteController {
	
	@Autowired
	private ClienteService clienteService;
	
	
	@ResponseBody
	@RequestMapping("/listaClientes")
	public List<Cliente> listaClientes(){
		return clienteService.listaCliente();
	}
	
	
	@ResponseBody
	@RequestMapping("/consultaClientes")
	public List<Cliente> consultaClientes(String filtro){
		return clienteService.consultaCliente("%" + filtro.trim() + "%");
	}

	
	
	
}
