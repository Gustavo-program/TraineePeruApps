<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${sessionScope.objCliente == null}">
	<c:set var="mensaje" value="Debe autenticarse para ingresar al sistema" scope="request"/>
	<jsp:forward page="/WEB-INF/vistas/login.jsp" />
</c:if>

