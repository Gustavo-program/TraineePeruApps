package com.modelo.peruapps.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.modelo.peruapps.entidad.Cliente;
import com.modelo.peruapps.repository.ClienteRepository;

@Service
public class ClienteServiceImpl implements ClienteService{

	@Autowired
	private ClienteRepository clienteRepository;
	
	@Override
	public List<Cliente> listaCliente() {
		return clienteRepository.findAll();
	}

	@Override
	public Cliente insertaActualizaClientes(Cliente obj) {
		return clienteRepository.save(obj);
	}

	@Override
	public Optional<Cliente> obtienePorId(int idCliente) {
		return clienteRepository.findById(idCliente);
	}

	@Override
	public void eliminaCliente(int id) {
		clienteRepository.deleteById(id);
		
	}

	@Override
	public List<Cliente> consultaCliente(String filtro) {
		return clienteRepository.consultaCliente(filtro);
	}

	
	
}
