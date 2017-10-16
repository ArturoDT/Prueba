<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<%
    int gr = Integer.parseInt(request.getParameter("gr"));
    conectarBD c = new conectarBD();
    if (c.conectar()) {
        int verificador = 0;
        ResultSet res1 = c.consultas("Select Id_Grupo from alumno where Id_Grupo=" + gr);
        if (res1 != null) {
            while (res1.next()) {
                verificador = res1.getInt("Id_Grupo");

            }
            if (verificador != 0) {
%>

<script>

    function confirmarEliminacion(clave) {
        alertify.confirm("CONFIRMAR ELIMINACION", function (respuesta) {
            if (respuesta) {
                location.href = "BorrarAlumno.jsp?control=" + clave;

            }
        });
    }
</script>
<div class="title"><h2>Consulta de Alumnos</h2></div>
<hr>
<table class=" bordered-table zebra-striped" id="registro" >
    <thead>
    <th>Numero control</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Telefono</th>
    <th>Sexo</th>
    <th>Ver Domicilio</th>
     <th>Agregar Domicilio</th>
    <th>Agregar Tutor</th>
    <th>Datos del tutor</th>
    <th>Actualizar</th>
</thead>
<tbody>

    <%
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from alumno, grupos, periodoesc where alumno.Id_Grupo=grupos.Id_Grupo and periodoesc.Id_Periodo=grupos.Id_Periodo "
                    + " and periodoesc.Estado=" + 1 + " and alumno.Id_Grupo=" + gr);
            if (res != null) {
                Object[] filas = new Object[7];
                while (res.next()) {
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getInt("Id_Domicilio");
                    filas[5] = res.getString("Sexo");
                    filas[6] = res.getString("Telefono");


    %>
    <tr>
        <td><%=filas[0]%></td> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=filas[6]%></td>
        <td><%=filas[5]%></td>
        <td><center><a href="MostrarDomicilioA.jsp?id=<%=filas[4]%>&idG=<%=gr%>">
                <img src="img/buscarD.png" width="60" height="50" style="border-top-color: #003399">
    </a></center>
</td>
<td><center><a href="FormularioDomicilio.jsp?control=<%=filas[0]%>&opcion=1">
        <img src="img/agregarD.png" width="60" height="50" style="border-top-color: #003399">
    </a></center>
</td>
<td><center><a href="FormularioTutores.jsp?control=<%=filas[0]%>&gr=<%=gr%>">
        <img src="img/agregarT.png" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
<td><center><a href="MostrarTutor.jsp?control=<%=filas[0]%>">
        <img src="img/vertutor.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
<td><center><a href="MenuActualizacion.jsp?control=<%=filas[0]%>">
        <img src="img/actualizar.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</tr>
<%
    }
} else {

%>
<script>

    alertify.error("No se encontraron registros del grupo <%=gr%>");
</script>

<%
        }
    }
%>
</tbody>   
</table>

<%
} else {
%>
<script>
    alertify.error("No se encontraron registros de Alumnos del grupo <%=gr%> \n\
                    Agregar alumnos-->");

    function redireccionando()
    {
        location.href = "FormularioAlumno.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
%>

<jsp:include page="Pie.jsp"/>