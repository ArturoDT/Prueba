<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<table class=" bordered-table zebra-striped" id="registro">
    <thead>
    <th>Cedula Profesional</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Profesion</th>
    <th>Puesto</th>
    <th>Telefono</th>
    <th>Calle</th>
    <th>No. Exterior</th>
    <th>Colonia</th>
    <th>Localidad</th>
    <th>Municipio</th>
    <th>Codigo postal</th>
    <th>Editar</th>
    <th>Usuarios</th>
</thead>
<tbody>

    <%
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            ResultSet res = c.consultas("Select personal.Cedula, personal.NombreP,"
                    + " personal.ApellidoP, personal.ApellidoM, personal.Profesion, personal.Puesto, personal.Telefono,"
                    + " domicilioalumnos.Calle, domicilioalumnos.No_exterior, domicilioalumnos.Colonia, domicilioalumnos.Localidad, domicilioalumnos.Municipio, domicilioalumnos.Codigopostal from personal join domicilioalumnos on personal.Id_Domicilio = domicilioalumnos.Id_Domicilio");
            if (res != null) {
                Object[] filas = new Object[13];
                while (res.next()) {
                    filas[0] = res.getString("Cedula");
                    filas[1] = res.getString("NombreP");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getString("Profesion");
                    filas[5] = res.getString("Puesto");
                    filas[6] = res.getString("Telefono");
                    filas[7] = res.getString("Calle");
                    filas[8] = res.getInt("No_exterior");
                    filas[9] = res.getString("Colonia");
                    filas[10] = res.getString("Localidad");
                    filas[11] = res.getString("Municipio");
                    filas[12] = res.getString("Codigopostal");


    %>
    <tr>
        <td><%=filas[0]%></td> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=filas[4]%></td>
        <td><%=filas[5]%></td>
        <td><%=filas[6]%></td>
        <td><%=filas[7]%></td>
        <td><%=filas[8]%></td>
        <td><%=filas[9]%></td>
        <td><%=filas[10]%></td>
        <td><%=filas[11]%></td>
        <td><%=filas[12]%></td>
        <td><a href="ActualizarPersonal.jsp?control=<%=filas[0]%>"><img src="img/actualizar.jpg " width="30" height="30"></a></td>
        <td><a href="MostrarUsuarios.jsp?Id_Usuario=<%=filas[0]%>"><img src="img/icon.png" width="30" height="30"></a></td>

    </tr>
    <%
                }
            } else {
              
            }
        }
    %>

</tbody>   
</table>
<jsp:include page="Pie.jsp"/>