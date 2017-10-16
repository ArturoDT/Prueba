<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<%
   int id = Integer.parseInt(request.getParameter("id"));
   %>
<div class="title"><h2>Consulta de Domicilio Alumno</h2></div><div><h6 style="font-family: cursive; color: #0069d6">Regresar-><a href="TablaAlumnos.jsp">.Consulta-Alumnos</a></h6></div>
<hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead>
    <th>Calle</th>
    <th>No_Exterior</th>
    <th>Colonia</th>
    <th>Localidad</th>
    <th>Municipio</th>
    <th>Codigo Postal</th>
</thead>
<tbody>

    <%
        conectarBD c = new conectarBD();
        int ver =0;
     
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from domicilioalumnos where Id_Domicilio=" + id);
            if (res != null) {
                
                Object[] filas = new Object[7];
                while (res.next()) {
                    ver =res.getInt("Id_Domicilio");
                    filas[0] = res.getInt("Id_Domicilio");
                    filas[1] = res.getString("Calle");
                    filas[2] = res.getString("No_exterior");
                    filas[3] = res.getString("Colonia");
                    filas[4] = res.getString("Localidad");
                    filas[5] = res.getString("Municipio");
                    filas[6] = res.getString("Codigopostal");

    %>
    <tr> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=filas[4]%></td>
        <td><%=filas[5]%></td>
        <td><%=filas[6]%></td>

    </tr>
    <%
                }
            } 
if(ver<=0)
{
         %>
<script>
    alertify.error("El alumno no cuenta con un domicilio registrado por favor registrarlo en la opcion\n\
                      Agregar Domicilio");
     function redireccionando()
    {
        location.href = "TablaAlumnos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
}
        }
    %>

</tbody>   
</table>
<jsp:include page="Pie.jsp"/>