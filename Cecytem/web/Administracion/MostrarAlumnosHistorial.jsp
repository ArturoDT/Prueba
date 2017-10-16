<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<%
    int gr = Integer.parseInt(request.getParameter("idH"));
    conectarBD c = new conectarBD();
    int ac=0;
    ac=Integer.parseInt(request.getParameter("in"));
    if(ac==1)
    {
        %>
         
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
    <th>Domicilio</th>
    <th>Datos del tutor</th>
    <th>Ver Asistencias</th>
</thead>
<tbody>

    <%
        if (c.conectar()) {
            int control=0;
            ResultSet res = c.consultas("Select * from alumno, grupos, periodoesc where alumno.Id_Grupo=grupos.Id_Grupo and periodoesc.Id_Periodo=grupos.Id_Periodo "
                    + " and alumno.Id_Grupo="+ gr);
            if (res != null) {
                Object[] filas = new Object[7];
                while (res.next()) {
                    control=res.getInt("Control");
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
        <td><center><a href="MostrarDomicilioA.jsp?id=<%=filas[4]%>"><img src="img/icon.png" width="60" height="50" style="border-top-color: #003399"></a></center></td>
<td><center><a href="MostrarTutor.jsp?control=<%=filas[0]%>&opcion=2">
        <img src="img/Inicio.jpg" width="60" height="50" style="border-top-color: #003399">
    </a>
</center>
</td>
    <td>
<center>
    <a href="MostrarHistorialAsistencias.jsp?idH=<%=filas[0]%>">
        <img src="img/asistencia.png" width="30" height="30">
    </a>
</center>
</td>
</tr>
<%
    }
}if(control<=0)

{
         %>
<script>
    alertify.error("No se encontraron registros del grupo");

    function redireccionando()
    {
        location.href = "PruebaTabla.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<% 
}

        }
%>
</tbody>   
</table>
 
        
        
        
        <%
    }else
{
%>
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
    <th>Ver Asistencia</th>
</thead>
<tbody>

    <%
        if (c.conectar()) {
            int control=0;
            ResultSet res = c.consultas("Select * from alumno, grupos, periodoesc where alumno.Id_Grupo=grupos.Id_Grupo and periodoesc.Id_Periodo=grupos.Id_Periodo "
                    + " and alumno.Id_Grupo="+ gr+" order by ApellidoP");
            if (res != null) {
                Object[] filas = new Object[7];
                while (res.next()) {
                    control=res.getInt("Control");
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
        <td><center><a href="MostrarHistorialAsistencias.jsp?idH=<%=filas[0]%>"><img src="img/asistencia.png" width="60" height="50" style="border-top-color: #003399"></a></center></td>
</tr>
<%
    }
}if(control<=0)

{
         %>
<script>
    alertify.error("No se encontraron registros del grupo");

    function redireccionando()
    {
        location.href = "PruebaTabla.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<% 
}

        }
%>
</tbody>   
</table>




<%
}
    
%>

<jsp:include page="Pie.jsp"/>