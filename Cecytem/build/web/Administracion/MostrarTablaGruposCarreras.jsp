<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<%
    conectarBD c = new conectarBD();
    int ver = 0;
    int idG = Integer.parseInt(request.getParameter("idG"));
%>
<script>
    function borrar(op)
    {

        var idC = op;
        alert("si funciono" + idC);
        if (idC != 0)
        {
            var opc = "borrargrupo";
            $.ajax({
                type: 'POST',
                url: "Procesaborrar.jsp",
                data: {idC: idC, opcion: opc, idS:<%=idG%>},
                success: function (respueta) {
                    $("#respuestaborrar").html(respueta);
                }
            });
        }

    }
</script>
<div class="title"><h2>Consulta de Grupos</h2></div>
<div>
    <h6 style="font-family: cursive; color: #0069d6">
        Agregar->
        <a href="FormularioGrupo.jsp">
            Nuevo-Grupo</a>
    </h6>
</div>
<hr>
<table class=" bordered-table zebra-striped" id="registro">
    <thead> 
    <th>Id_Grupo</th>
    <th>Grupo</th>
    <th>Carrera</th>
    <th>Turno</th>
    <th>Semestre</th>
    <th><center>Editar</center></th>
<th><center>Borrar</center></th>
</thead>
<tbody>
    <%
        int contador = 0;

        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                    + " and periodoesc.Id_Periodo = grupos.Id_Periodo "
                    + " and periodoesc.Estado=" + 1 + " and grupos.Semestre=" + idG);
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
    <a href="ModificarGrupos.jsp?idH=<%=filas[0]%>">
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
    }
    if (contador <= 0) {
%>
<script>
    alertify.error("No sean agregado grupos al semestre");

    function redireccionando()
    {
        location.href = "CicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<%
    }
%>

</tbody>   
</table>
<div id="respuestaborrar"></div>

<jsp:include page="Pie.jsp"/>