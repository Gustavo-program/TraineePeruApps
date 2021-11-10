package com.modelo.peruapps.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
			
			
			
			
			
			/*ACTUALIZAR*/
			
			@ResponseBody
			@RequestMapping(value = "/actualizaCliente", method = RequestMethod.POST)
			public Map<String, Object> actualizaCliente(
					@RequestParam("idCliente") String idCliente,
					@RequestParam("nombre") String nombre,
					@RequestParam("correo") String correo,
					@RequestParam("password") String password,
					@RequestParam("fechaNacimiento") String fecha
					){
				
				Map<String, Object> salida = new HashMap<>();
				try {
					
					Cliente obj = new Cliente();
					obj.setIdCliente(Integer.parseInt(idCliente));
					obj.setNombre(nombre);
					obj.setCorreo(correo);
					obj.setPassword(password);
					
					Date date1 =new  SimpleDateFormat("yyyy-MM-dd").parse(fecha);
					obj.setFechaNacimiento(date1);
					
					Cliente objSalida = clienteService.insertaActualizaClientes(obj);
					
					if(objSalida == null) {
						salida.put("MENSAJE", "Error en la Actualización");
					}
					else {
						
						salida.put("MENSAJE", "Actualización Exitosa");
						salida.put("inicio", "verIndex");//si actualiza la pagina lo borro
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
			
			
			
			/*ELIMINAR*/
			

			@ResponseBody
			@RequestMapping("eliminaCliente")
			public Map<String, Object> eliminaCliente(int id){
				Map<String, Object> salida=new HashMap<String, Object>();
				
				try {
					Optional<Cliente> opt= clienteService.obtienePorId(id);
					if(opt.isPresent()) {
						clienteService.eliminaCliente(id);
						salida.put("mensaje", "Eliminación Exitosa");
						
					}
					else {
						salida.put("mensaje", "Eliminación Errónea");
					}
						
				} 		
				catch (Exception e) {
					e.printStackTrace();
					salida.put("mensaje", "Se generó un error");
				}
				finally {
					List<Cliente> lista=clienteService.listaCliente();
					salida.put("lista", lista);	
				}
					
				return salida;
			}
			
	
	
	
}
