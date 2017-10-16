<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<div class="title"><h2>Consulta de Ciclos-Periodos</h2></div>
<hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Ciclo</th>
    <th>Periodo</th>
    <th>Activado</th>
    <th>Actualizar</th>
</thead>
<tbody>

    <%
        conectarBD c = new conectarBD();
        int ciclo=0;
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from periodoesc");
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    filas[0] = res.getInt("Id_Periodo");
                    filas[1] = res.getInt("Ciclo");
                    filas[2] = res.getString("periodo");
                     int estado = res.getInt("Estado");
                     ciclo=res.getInt("Ciclo")+1;
                     int numero=res.getInt("numeroP");
    %>
    <tr> 
        
        <td><%=filas[1]%>-<%=ciclo%><%
            if(numero==1)
            {
                out.println("A");
        }else
            {
                out.println("B");
        }%></td>
        <td><%=filas[2]%></td>
        <td><% if(estado==0)
        {
           %>
           No.<a href="ModificarEstadoP.jsp?idP=<%=filas[0]%>">Activar</a>
            <%
        }else
        {
            out.println("Si");
        }
            %></td>
        <td>
<center>
    <a href="ActualizarCicloPeriodo.jsp?idH=<%=filas[0]%>">
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