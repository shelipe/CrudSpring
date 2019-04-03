<%-- 
    Document   : editar
    Created on : 27-03-2019, 15:00:05
    Author     : fmunozc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>Editar</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4">
            <h1>Modificación </h1>
            <div class="card border-info">
                <div class="card-hearder bg-info">
                    <h4>Editar del Jugador</h4>
                </div>
                <div class="card-body"> 
                    <form method="POST">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="${lista[0].nombre}"/>
                        <label>Correo</label>
                        <input type="text" name="correo" class="form-control" value="${lista[0].correo}"/>
                        <label>Edad</label>
                        <input type="text" name="edad"   class="form-control" value="${lista[0].edad}"/>
                        <br>
                        <input type="submit" value="Actualizar" class="btn btn-success" />
                        <a href="index.htm">Regresar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
