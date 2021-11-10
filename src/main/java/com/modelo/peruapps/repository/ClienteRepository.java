package com.modelo.peruapps.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.modelo.peruapps.entidad.Cliente;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer>{
	
	
	/*PLUS, AGREGANDO BUSQUEDA POR NOMBRE*/
	
	@Query("Select a from Cliente a where nombre like :fil")
	public abstract List<Cliente> consultaCliente(@Param("fil") String filtro);
	
	
	
	/*LOGUEARSE*/
	@Query("Select x from Cliente x where x.correo = :#{#usu.correo} and x.password = :#{#usu.password}")
	public abstract Cliente login(@Param(value = "usu") Cliente bean);

}
