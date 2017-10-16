<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<%
    int gr = Integer.parseInt(request.getParameter("gr"));
    conectarBD c = new conectarBD();
    if(c.conectar())
    {
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
<table class=" bordered-table zebra-striped" id="registro" >
    <thead>
    <th>Numero control</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Grupo</th>
    <th>Carrera</th>
    <th>Semestre</th>
    <th>Turno</th>
    <th>Telefono</th>
    <th>Domicilio</th>
    <th>Agregar Tutor</th>
    <th>Datos del tutor</th>
    <th>Actualizar</th>
</thead>
<tbody>

    <%
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from alumno where Id_Grupo=" + gr);
            if (res != null) {
                Object[] filas = new Object[12];
                while (res.next()) {
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getInt("Id_Grupo");
                    filas[5] = res.getInt("Id_Domicilio");
                    filas[7] = res.getString("Sexo");
                    filas[8] = res.getString("Semestre");
                    filas[9] = res.getString("Telefono");
                    filas[10] = res.getString("Carrera");
                    filas[11] = res.getString("Turno");


    %>
    <tr>
        <td><%=filas[0]%></td> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=filas[4]%></td>
        <td><%=filas[10]%></td>
        <td><%=filas[8]%></td>
        <td><%=filas[11]%></td>
        <td><%=filas[9]%></td>
        <td><center><a href="MostrarDomicilioA.jsp?id=<%=filas[5]%>"><img src="img/icon.png" width="60" height="50" style="border-top-color: #003399"></a></center></td>
<td><center><a href="FormularioTutores.jsp?control=<%=filas[0]%>&gr=<%=gr%>">
        <img src="img/Inicio.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
<td><center><a href="MostrarTutor.jsp?control=<%=filas[0]%>">
        <img src="img/Inicio.jpg" width="60" height="50" style="border-top-color: #003399">
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
<table class=" bordered-table zebra-striped" id="registro">
    <thead>
    <th>Numero control</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Grupo</th>
    <th>Carrera</th>
    <th>Semestre</th>
    <th>Turno</th>
    <th>Telefono</th>
    <th>Domicilio</th>
    <th>Agregar Tutor</th>
    <th>Datos del tutor</th>
    <th>Actualizar</th>
    <th>Eliminar</th>
</thead>
<tbody>

    <%
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from alumno where Id_Grupo=" + gr);
            if (res != null) {
                Object[] filas = new Object[12];
                while (res.next()) {
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getInt("Id_Grupo");
                    filas[5] = res.getInt("Id_Domicilio");
                    filas[6] = res.getInt("Id_Horario");
                    filas[7] = res.getString("Sexo");
                    filas[8] = res.getString("Semestre");
                    filas[9] = res.getString("Telefono");
                    filas[10] = res.getString("Carrera");
                    filas[11] = res.getString("Turno");


    %>
    <tr>
        <td><%=filas[0]%></td> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=filas[4]%></td>
        <td><%=filas[10]%></td>
        <td><%=filas[8]%></td>
        <td><%=filas[11]%></td>
        <td><%=filas[9]%></td>
        <td><center><a href="MostrarDomicilioA.jsp?id=<%=filas[5]%>"><img src="img/icon.png" width="60" height="50" style="border-top-color: #003399"></a></center></td>
<td><center><a href="FormularioTutores.jsp?control=<%=filas[0]%>">
        <img src="img/Inicio.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
<td><center><a href="MostrarTutor.jsp?control=<%=filas[0]%>">
        <img src="img/Inicio.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
<td><center><a href="MenuActualizacion.jsp?control=<%=filas[0]%>">
        <img src="img/actualizar.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
<td><center><a onclick="confirmarEliminacion(<%=filas[0]%>)">
        <img src="img/eliminar.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
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
<script>
   alertify.error("No se encontraron registros del grupo <%=gr%>");
</script>
<%
        }
    }
}
%>

<jsp:include page="Pie.jsp"/>