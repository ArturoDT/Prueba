<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Usuario</th>
    <th>Password</th>
    <th>Estado</th>
    <th><center>Editar</center></th>
</thead>
<tbody>

    <%
        int id = Integer.parseInt(request.getParameter("Id_Usuario"));
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from usuarios where Id_Personal=" + id);
            if (res != null) {
                Object[] filas = new Object[4];
                while (res.next()) {
                    filas[0] = res.getInt("Id_usuario");
                    filas[1] = res.getInt("Nivel");
                    filas[2] = res.getString("User");
                    filas[3] = res.getString("Password");
                    int estado = res.getInt("Status");                
    %>
    <tr> 
        <td><%=filas[2]%></td>
        <td><%=filas[3]%></td>
        <td><% if(estado==1)
        {
            out.println("Activo");
        }else
        {
            out.println("Inactivo");
        }
        %>
        </td>
        <td>
<center>
    <a href="ActualizarU.jsp?control=<%=filas[0]%>">
        <img src="img/actualizar.jpg" width="30" height="30">
    </a>
</center>
</td>


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