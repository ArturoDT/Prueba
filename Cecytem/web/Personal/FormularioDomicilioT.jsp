<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int idT = Integer.parseInt(request.getParameter("id"));
    
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de domicilio del Tutor</h2></div>
    <div class="element-input">
        <label class="title">Calle
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="calle" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">No_Exterior
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="ne" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Colonia
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="colonia" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Localidad
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="localidad" required="required"style="width: 250px"/>
    </div>
    <div class="">
        <label class="title">Municipio
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="municipio" required="required" value="" style="width: 250px"/>
    </div>

    <div class="">
        <label class="title">Codigo postal
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="codpos" required="required" value="" style="width: 250px"/>
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
            if (c.ejecutaSQL("Insert into domiciliotutor values(null,'" + calle + "','" + ne + "','" + colonia + "','" + localidad + "','" + municipio + "','" + codpos + "')")) {
                ResultSet res = c.consultas("SELECT MAX(Id_Domicilio) AS id FROM domiciliotutor");
                if (res != null) {
                    int id = 0;
                    int control = 0;
                    while (res.next()) {
                        id = res.getInt("id");
                    }
                    if (c.ejecutaSQL("Update tutores set Id_Domicilio='" + id + "' where Id_Tutores=" + idT)) {
                        ResultSet rescontrol = c.consultas("Select Control from alumno join tutores on alumno.Id_Tutor=tutores.Id_Tutores and"
                                + " tutores.Id_Domicilio="+id+" where tutores.Id_Tutores="+idT);
                        if(rescontrol!=null)
                        {
                            while(rescontrol.next())
                            {
                               control=rescontrol.getInt("Control");
                            }
                        }
%>
<script>
    alertify.success("Registro Generado OK :)");
    location.href = "MostrarTutor.jsp?control=<%=control%>";
</script>

<%
} else {
%>
<script>
    alertify.error("Error al registrar :(");

</script>

<%
                    }
                } else {

                }
            }
        }
    }
%>

<jsp:include page="Pie.jsp"/>