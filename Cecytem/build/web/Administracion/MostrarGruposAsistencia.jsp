<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<%
     conectarBD c = new conectarBD();
     int ver=0;
   
          int ca = Integer.parseInt(request.getParameter("idCa"));
        int pe = Integer.parseInt(request.getParameter("idP"));
     if(c.conectar())
     {
       ResultSet verCiP=c.consultas("Select periodoesc.Id_Periodo from periodoesc where "
               + " periodoesc.Id_Periodo="+pe);
       if(verCiP!=null)
       {
           while(verCiP.next())
           { 
               ver = verCiP.getInt("Id_Periodo");
           }
       }if(ver>0)
       {
           %>
           
 <div class="title"><h2>Consulta de Historial de Asistencias</h2></div>
 <hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Id_Grupo</th>
    <th>Grupo</th>
    <th>Carrera</th>
    <th>Turno</th>
     <th>Semestre</th>
    <th><center>Ver Asistencias</center></th>
</thead>
<tbody>
    <%
        int contador=0;
   
       
        if (c.conectar()) {
            ResultSet res =  c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                    + " and periodoesc.Id_Periodo = grupos.Id_Periodo and "
                    + " carrera.Id_Carrera="+ca+" and periodoesc.Id_Periodo="+pe);
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                     filas[0] = res.getInt("Id_Grupo");
                    filas[1] = res.getInt("Grupo");
                    filas[2] = res.getString("nombreCarrera");
                    filas[3] = res.getString("Turno");
                    filas[4] = res.getInt("Semestre");
                    contador = res.getInt("Semestre");
    %>
    <tr> 
        <td><%=filas[0]%></td>
        <td><%=filas[1]%></td>
        <td><%=filas[2]%></td>
        <td><%=filas[3]%></td>
        <td><%=filas[4]%></td>
        <td>
<center>
    <a href="MostrarAlumnosHistorial.jsp?idH=<%=filas[0]%>&in=2 ">
        <img src="img/asistencia.png" width="30" height="30">
    </a>
</center>
</td>


</tr>
<%
            }
        } else {
        }
    }
if(contador<=0)
{
%>
<script>
    alertify.error("No sean agregado grupos al semestre");

    function redireccionando()
    {
        location.href = "MenuHistorial.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<%
}
%>

</tbody>   
</table>
           
           <%
           
       }else
       {
         %>
<script>
    alertify.error("El periodo no se correspode al Ciclo escolar");

    function redireccionando()
    {
        location.href = "MenuHistorial.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<%  
       }
     }
%>

<jsp:include page="Pie.jsp"/>