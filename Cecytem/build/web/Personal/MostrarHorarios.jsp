<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>grupo</th>
    <th>dia</th>
    <th>hora E</th>
    <th>hora</th>
    <th>Editar</th>
</thead>
<tbody>

    <%
        int g = Integer.parseInt(request.getParameter("gr"));
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from horarios where Grupo=" + g);
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    filas[0] = res.getInt("Id_Horarios");
                    filas[1] = res.getInt("Grupo");
                    filas[2] = res.getString("Dia");
                    filas[3] = res.getString("HoraEntrada");
                    filas[4] = res.getString("HoraSalida");
                    String dia = res.getString("Dia");

    %>
    <tr> 
        <td><%=filas[1]%></td>
        <td><%
            if (dia.equals("2")) {
                out.println("Lunes");
                out.println(dia);
            }
            if (dia.equals("3")) {
                out.println("Martes");
                out.println(dia);
            }
            if (dia.equals("4")) {
                out.println("Miercoles");
                out.println(dia);
            }
            if (dia.equals("5")) {
                out.println("Jueves");
                out.println(dia);
            }
            if (dia.equals("6")) {
                out.println("Viernes");
                out.println(dia);
            }
            %>
        </td>
        <td><%=filas[3]%></td>
        <td><%=filas[4]%></td>
        <td>
<center>
    <a href="ActualizarHorarios.jsp?idH=<%=filas[0]%>">
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