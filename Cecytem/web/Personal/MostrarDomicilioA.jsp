<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

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
        int id = Integer.parseInt(request.getParameter("id"));
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from domicilioalumnos where Id_domicilio=" + id);
            if (res != null) {
                Object[] filas = new Object[7];
                while (res.next()) {
                    filas[0] = res.getInt("Id_Domicilio");
                    filas[1] = res.getString("Calle");
                    filas[2] = res.getInt("No_exterior");
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
            } else {
                
            }
        }
    %>

</tbody>   
</table>
<jsp:include page="Pie.jsp"/>