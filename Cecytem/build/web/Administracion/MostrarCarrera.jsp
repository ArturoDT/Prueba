<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<script>
    function borrar(op)
    {
        var idC=op;
        if(idC!=0)
        {
           var opc="borrarcarrera";
              $.ajax({
                type: 'POST',
                url: "Procesaborrar.jsp",
                data: {idC: idC, opcion: opc},
                success: function (respueta) {
                    $("#respuestaborrar").html(respueta);
                }
            });
        }
        
    }
    </script>
<div class="title"><h2>Consulta de Carreras</h2></div>
 <hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Id_Carrera</th>
    <th>Carrera</th>
    <th>Editar</th>
    <th>Borrar</th>
</thead>
<tbody>

    <%
     
        conectarBD c = new conectarBD();
        int ver=0;
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from carrera");
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    ver = res.getInt("Id_Carrera");
                    filas[0] = res.getInt("Id_Carrera");
                    filas[1] = res.getString("nombreCarrera");

    %>
    <tr> 
        <td><%=filas[0]%></td>
        <td><%=filas[1]%></td>
        <td>
<center>
    <a href="ActualizarCarrera.jsp?idC=<%=filas[0]%>">
        <img src="img/actualizar.jpg" width="30" height="30">
    </a>
</center>
</td>
        <td>
<center>
    <a onclick="borrar(<%=filas[0]%>)">
        <img src="img/x.png" width="30" height="30">
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
      alertify.error("No sea han registrado Carreras Agregar->");
             function redireccionando()
    {
        location.href = "FormularioCarrera.jsp";

    }
    setTimeout("redireccionando()", 2000);
</script>
<%
}
    }
%>

</tbody>   
</table>
<div id="respuestaborrar"></div>
<jsp:include page="Pie.jsp"/>