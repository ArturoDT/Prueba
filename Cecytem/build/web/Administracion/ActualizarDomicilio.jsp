<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    Object[] filas = new Object[7];
    int nc = Integer.parseInt(request.getParameter("control"));
    int idG=0;
    out.println(nc);
    conectarBD co = new conectarBD();
    if (co.conectar()) {
        out.println("Conectado");
        ResultSet res = co.consultas("Select * from domicilioalumnos join alumno on alumno.Id_Domicilio=domicilioalumnos.Id_Domicilio where alumno.Control=" + nc);

        if (res != null) {
            out.println("Si hay algo");
            while (res.next()) {
                filas[0] = res.getInt("Id_Domicilio");
                filas[1] = res.getString("Calle");
                filas[2] = res.getString("No_exterior");
                filas[3] = res.getString("Colonia");
                filas[4] = res.getString("Localidad");
                filas[5] = res.getString("Municipio");
                filas[6] = res.getString("Codigopostal");
                idG=res.getInt("Id_Grupo");
            }
        } else {
            out.println("No hay algo");
        }
    }
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:280px;min-width:150px;
      margin: 170px; padding-left: 350px; max-width: 780px;" 
      method="POST">
    <div class="title"><h2>Editar domicilio</h2></div>
    <div class="element-input">
        <label class="title">Calle
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="calle" required="required" style="width: 250px" value="<%=filas[1]%>"/>
    </div>
    <div class="element-input">
        <label class="title">No_Exterior
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="ne" required="required" style="width: 250px"  value="<%=filas[2]%>"/>
    </div>
    <div class="element-input">
        <label class="title">Colonia
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="colonia" required="required" style="width: 250px"  value="<%=filas[3]%>"/>
    </div>
    <div class="element-input">
        <label class="title">Localidad
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="localidad" required="required"style="width: 250px"  value="<%=filas[4]%>"/>
    </div>
    <div class="">
        <label class="title">Municipio
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="municipio" required="required" style="width: 250px"  value="<%=filas[5]%>"/>
    </div>

    <div class="">
        <label class="title">Codigo postal
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="codpos" required="required" style="width: 250px"  value="<%=filas[6]%>"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("calle") != null) {
        String calle = request.getParameter("calle");
        String ne = request.getParameter("ne");
        String colonia = request.getParameter("colonia");
        String localidad = request.getParameter("localidad");
        String municipio = request.getParameter("municipio");
        String codpos = request.getParameter("codpos");

        conectarBD c = new conectarBD();
        if (c.conectar()) {
            out.println("Conectado");
            if (c.ejecutaSQL("Update domicilioalumnos set Calle='" + calle + "',No_exterior='" + ne + "',Colonia='" + colonia + "',Localidad='" + localidad + "',Municipio='" + municipio + "',Codigopostal='" + codpos + "' where Id_Domicilio="+filas[0])) {
%>
<script>
    alertify.success("Actualizacion finalizada");
    location.href="MostrarDomicilioA.jsp?id=<%=filas[0]%>&idG=<%=idG%>";
</script>
<%
                  }else
{
%>
<script>
    alertify.error(" Error en la Actualizacion");
</script>
<%
}

    }
}
%>

<jsp:include page="Pie.jsp"/>