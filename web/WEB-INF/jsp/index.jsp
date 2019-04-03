<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Welcome</title>
    </head>
    <body>
        <div class="container mt4">
            <h1>Lista de los Top Jugadores Futbol </h1>
            <div class="card bord-info">
                <div  class="card-header bg-info text-white">
                    <a href="agregar.htm" class="btn btn-light">Nuevo Registro</a>
                </div>
            </div>
            <div  class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>NOMBRE</th>
                            <th>CORREO</th>
                            <th>EDAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dato" items="${lista}">
                            <tr>
                                <td>${dato.id}</td>
                                <td>${dato.nombre}</td>
                                <td>${dato.correo}</td>
                                <td>${dato.edad}</td>
                                <td>
                                    <a href="editar.htm?id=${dato.id}" class="btn btn-warning">Editar</a>
                                    <a href="eliminar.htm?id=${dato.id}" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
