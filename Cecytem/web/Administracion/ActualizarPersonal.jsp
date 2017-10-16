<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<script>
</script>
<%
    int ncl = Integer.parseInt(request.getParameter("control"));
    String cedula = "";
    String n = "";
    String ap = "";
    String am = "";
    String pr = "";
    String pu = "";
    String te = "";
    String tele = "";
    int idD = 0;
    String ca = "";
    int ne = 0;
    String co = "1";
    String lo = "1";
    String mu = "1";
    String cdp = "1";
    conectarBD c = new conectarBD();
    if (c.conectar()) {
        ResultSet res = c.consultas("Select personal.Cedula, personal.NombreP,"
                + " personal.ApellidoP, personal.ApellidoM, personal.Profesion, personal.Puesto, personal.Telefono,"
                + " domicilioalumnos.Calle, domicilioalumnos.Id_Domicilio, domicilioalumnos.No_exterior, domicilioalumnos.Colonia, domicilioalumnos.Localidad, domicilioalumnos.Municipio, domicilioalumnos.Codigopostal from personal join domicilioalumnos on personal.Id_Domicilio = domicilioalumnos.Id_Domicilio"
                + " where personal.Cedula=" + ncl);
        if (res != null) {
            while (res.next()) {
                cedula = res.getString("Cedula");
                n = res.getString("NombreP");
                ap = res.getString("ApellidoP");
                am = res.getString("ApellidoM");
                pr = res.getString("Profesion");
                pu = res.getString("Puesto");
                tele = res.getString("Telefono");
                idD = res.getInt("Id_Domicilio");
                ca = res.getString("Calle");
                ne = res.getInt("No_exterior");
                co = res.getString("Colonia");
                lo = res.getString("Localidad");
                mu = res.getString("Municipio");
                cdp = res.getString("Codigopostal");
            }
        } else {

        }
    }


%>

<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST" action="#">
    <div class="title"><h2>Editar los Datos del Personal Administrativo</h2></div>
    <div class="element-input">
        <label class="title">Cedula
            <span class="required">
                *</span>
        </label>
        <input class="null" type="hidden" name="cedula" required="required" style="width: 250px" value="<%=cedula%>"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="nombre" required="required" style="width: 250px" value="<%=n%>"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Paterno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoP" required="required" style="width: 250px" value="<%=ap%>"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Materno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 250px" value="<%=am%>"/>
    </div>
    <div class="">
        <label class="title">Profesion
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="profesion" required="required" style="width: 250px" value="<%=pr%>"/>
    </div>
    <div class="">
        <label class="title">Puesto
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="puesto" required="required"  style="width: 250px" value="<%=pu%>">
    </div>
    <div class="">
        <label class="title">Telefono
            <span class="required">*
            </span>
        </label>
        <input class="null" type="number" name="telefono" required="required" style="width: 250px" value="<%=tele%>">
    </div>
    <div class="title">Edita de domicilio Personal</div>
    <div class="element-input">
        <label class="title">Calle
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="calle" required="required" style="width: 250px" value="<%=ca%>"/>
    </div>
    <div class="element-input">
        <label class="title">No_Exterior
            <span class="required">
                *</span>
        </label>
        <input   class="alert-actions" type="number" name="ne" required="required" style="width: 250px" value="<%=ne%>"/>
    </div>
    <div class="element-input">
        <label class="title">Colonia
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="colonia" required="required" style="width: 250px" value="<%=co%>"/>
    </div>
    <div class="element-input">
        <label class="title">Localidad
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="localidad" required="required"style="width: 250px" value="<%=lo%>"/>
    </div>
    <div class="">
        <label class="title">Municipio
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="municipio" required="required" style="width: 250px" value="<%=mu%>"/>
    </div>

    <div class="">
        <label class="title">Codigo postal
            <span class="required">*
            </span>
        </label>
        <input class="null" type="number" name="codpos" required="required" style="width: 250px" value="<%=cdp%>"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
        <%
            if (request.getParameter("cedula") != null) {
                int cedulas = Integer.parseInt(request.getParameter("cedula"));
                String nom = request.getParameter("nombre");
                String apP = request.getParameter("apellidoP");
                String amM = request.getParameter("apellidoM");
                String prF = request.getParameter("profesion");
                String puest = request.getParameter("puesto");
                String ten = request.getParameter("telefono");
                String calle = request.getParameter("calle");
                String nue = request.getParameter("ne");
                String colonia = request.getParameter("colonia");
                String localidad = request.getParameter("localidad");
                String municipio = request.getParameter("municipio");
                String codpos = request.getParameter("codpos");
                out.print(cedulas + " " + nom + " " + apP + " " + amM + " " + prF + " " + puest + " " + ten + " " + calle + " " + nue + " " + colonia + " " + localidad + " " + municipio + " " + codpos + " ");

                if (c.conectar()) {
                    if (c.ejecutaSQL("Update personal set NombreP='" + nom + "', ApellidoP='" + apP + "', ApellidoM='" + amM + "', Profesion='" + prF + "', Puesto='" + puest + "', Telefono='" + ten + "' where Cedula=" + cedula)) {
                        if (c.ejecutaSQL("Update domicilioalumnos set Calle='" + calle + "', No_exterior=" + nue + ", Colonia='" + colonia + "', Localidad='" + localidad + "', Municipio='" + municipio + "', Codigopostal='" + codpos + "' where Id_Domicilio=" + idD)) {
        %>
<script>
    alertify.success("Cambio realizado");
    location.href = "MostrarPersonal.jsp";
</script>
<%
} else {
%>
<script>
    alertify.error("Cambio no realizado");
</script>
<%
                }
            } else {
            }
        }

    } else {

    }
%>

<jsp:include page="Pie.jsp"/>