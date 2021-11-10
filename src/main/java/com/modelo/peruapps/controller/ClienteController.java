package com.modelo.peruapps.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	
	/*

	@ResponseBody
	@RequestMapping("/registraCliente")
	public Map<String, Object> registro(Cliente obj){
		Map<String, Object> salida=new HashMap<>();
		try {
			
			Cliente objSalida = clienteService.insertaActualizaClientes(obj);
			
			if(objSalida==null) {
				salida.put("MENSAJE", "Error en el Registro");
			}
			else {
				salida.put("MENSAJE", "Registro exitoso");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			salida.put("MENSAJE", "Se genero un error");
		}
		finally {
			List<Cliente> lista=clienteService.listaCliente();
			salida.put("lista",lista);
		}
		return salida;
	}
	
	*/
	
	
	
	
	//REGISTRO DE CLIENTES
	
			@ResponseBody
			@RequestMapping(value = "/insertaCliente", method = RequestMethod.POST)
			public Map<String, Object> insertaEventosProximos(
					@RequestParam("nombre") String nombre,
					@RequestParam("correo") String correo,
					@RequestParam("password") String password,
					@RequestParam("fechaNacimiento") String fecha
					){
				
				Map<String, Object> salida = new HashMap<>();
				try {
					
					Cliente obj = new Cliente();
					
					obj.setNombre(nombre);
					obj.setCorreo(correo);
					obj.setPassword(password);
					
					Date date1 =new  SimpleDateFormat("yyyy-MM-dd").parse(fecha);
					obj.setFechaNacimiento(date1);
					
					
					
					
					Cliente objSalida = clienteService.insertaActualizaClientes(obj);
					
					if(objSalida == null) {
						salida.put("MENSAJE", "Error en el Registro");
					}
					else {
						
						salida.put("MENSAJE", "Registro Exitoso");
						salida.put("inicio", "verIndex");
					}
					
				} 
				
				catch (Exception e) {
					e.printStackTrace();
					salida.put("MENSAJE", "Se generó un error");
				}
				
				finally {
					List<Cliente> lista=clienteService.listaCliente();
					salida.put("lista", lista);
				}
				
				return salida;
				
			}
			
	
	
	
}
