<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<div class="title"><h2>Consulta de Horarios </h2></div>
 <hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Grupo</th>
    <th>Dia</th>
    <th>Hora Entrada</th>
    <th>Hora Salida</th>
    <th><center>Editar</center></th>
</thead>
<tbody>

    <%
        int g = Integer.parseInt(request.getParameter("gr"));
        conectarBD c = new conectarBD();
        int ver=0;
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from horarios where Grupo=" + g);
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    ver = res.getInt("Id_Horarios");
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
                
            }
            if (dia.equals("3")) {
                out.println("Martes");
                
            }
            if (dia.equals("4")) {
                out.println("Miercoles");
               
            }
            if (dia.equals("5")) {
                out.println("Jueves");
               
            }
            if (dia.equals("6")) {
                out.println("Viernes");
              
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
        }
if(ver<=0)
{
%>
<script>
      alertify.error("No sea han registrado Horarios Agregar->");
             function redireccionando()
    {
        location.href = "FormularioHorarios.jsp";

    }
    setTimeout("redireccionando()", 2000);
</script>
<%
}
    }
%>

</tbody>   
</table>
<jsp:include page="Pie.jsp"/>