<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<%
    int nc = Integer.parseInt(request.getParameter("control"));
   
    int id = 0;
%>

<table class="bordered-table zebra-striped" id="registro">
    <thead>
    <th>Parentesco</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Telefono</th>
    <th>Celular</th>
    <th>Calle</th>
    <th>No. Exterior</th>
    <th>Colonia</th>
    <th>Localidad</th>
    <th>Municipio</th>
    <th>Codigo postal</th>
    <th>Actualizar</th>

</thead>
<tbody>

    <%
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            ResultSet res = c.consultas("Select tutores.Id_Tutores,tutores.Parentesco, tutores.Nombre,"
                    + " tutores.ApellidoP, tutores.ApellidoM, tutores.Telefono, tutores.Celular,"
                    + " domiciliotutor.Calle, domiciliotutor.No_exterior, domiciliotutor.Colonia, domiciliotutor.Localidad, domiciliotutor.Municipio, domiciliotutor.Codigopostal from tutores join alumno join domiciliotutor on tutores.Id_Tutores = alumno.Id_Tutor and tutores.Id_Domicilio = domiciliotutor.Id_Domicilio and alumno.Control=" + nc);
            if (res != null) {
                Object[] filas = new Object[13];
            
                while (res.next()) {
                    filas[0] = res.getString("Parentesco");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getString("Telefono");
                    filas[5] = res.getString("Celular");
                    filas[6] = res.getString("Calle");
                    filas[7] = res.getInt("No_exterior");
                    filas[8] = res.getString("Colonia");
                    filas[9] = res.getString("Localidad");
                    filas[10] = res.getString("Municipio");
                    filas[11] = res.getString("Codigopostal");
                    filas[12] = res.getInt("Id_Tutores");
                    id = res.getInt("Id_Tutores");


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
        <td><a href="ActualizarTutor.jsp?id=<%=filas[12]%>"><img src="img/actualizar.jpg" width="50" height="50"></a></td>

    </tr>
    <%
                }
            }
        } else {

        }

    %>

</tbody>   
</table>
<%  
      c.conectar();
        int grupo = 0;
        ResultSet gr = c.consultas("Select Id_Grupo from alumno where Control=" + nc);
        if (gr != null) {
           
            while (gr.next()) {
                grupo = gr.getInt("Id_Grupo");
            }
        }
    if (id > 0) {

    } else {
      
%>
<script>
        alertify.confirm("EL alumno no cuenta con un Tutor Dedesas agregar uno:", function (respuesta) {
            if (respuesta) {
                location.href = "FormularioTutores.jsp?control=<%=nc%>&gr=<%=grupo%>";
            }
        });
        

</script>
<%
                   }
                 %>
<jsp:include page="Pie.jsp"/>