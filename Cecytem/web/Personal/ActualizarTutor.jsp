<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    Object[] filas = new Object[8];
    int nc = Integer.parseInt(request.getParameter("id"));
    
    conectarBD co = new conectarBD();
    if (co.conectar()) {
        
        ResultSet ress = co.consultas("Select * from tutores where Id_Tutores=" + nc);
        if (ress != null) {
           
            while (ress.next()) {
                filas[0] = ress.getInt("Id_Tutores");
                filas[1] = ress.getString("Nombre");
                filas[2] = ress.getString("ApellidoP");
                filas[3] = ress.getString("ApellidoM");
                filas[4] = ress.getString("Telefono");
                filas[5] = ress.getString("Celular");
                filas[6] = ress.getString("Parentesco");
                filas[7] = ress.getInt("Id_Domicilio");
            }
        }
    }
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:380px;min-width:150px;
      margin: 170px; padding-left: 350px; max-width: 780px;" 
      method="POST">
    <div class="title"><h2>Editar los datos del Tutor</h2></div>
    <br>
    <div class="element-input">
        <label class="title">Parentesco
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="parentesco" required="required" style="width: 350px" value="<%=filas[6]%>"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="nombre" required="required" style="width: 350px" value="<%=filas[1]%>"/>
    </div>
    <div class="element-input">
        <label class="title">ApellidoP
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="apellidoP" required="required" style="width: 350px" value="<%=filas[2]%>"/>
    </div>
    <div class="element-input">
        <label class="title">ApellidoM
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 350px" value="<%=filas[3]%>"/>
    </div>
    <div class="element-input">
        <label class="title">Telefono
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="telefono" required="required" style="width: 350px" value="<%=filas[4]%>"/>
    </div>
    <div class="">
        <label class="title">Celular
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="celular" required="required" style="width: 350px" value="<%=filas[5]%>"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("nombre") != null) {
        String parentesco = request.getParameter("parentesco");
        String nombre = request.getParameter("nombre");
        String apP = request.getParameter("apellidoP");
        String apM = request.getParameter("apellidoM");
        String T = request.getParameter("telefono");
        String cel = request.getParameter("celular");

        conectarBD c = new conectarBD();
        if (c.conectar()) {
            int control=0;
           
            if (c.ejecutaSQL("Update tutores set Parentesco='" + parentesco + "',Nombre='" + nombre + "',ApellidoP='" + apP + "',ApellidoM='" + apM + "',Telefono='" + T + "',Celular='" + cel + "',Id_Domicilio='" + filas[7] + "' where Id_Tutores=" + nc)) {
                ResultSet rescontrol = c.consultas("Select Control from alumno join tutores on alumno.Id_Tutor=tutores.Id_Tutores where tutores.Id_Tutores=" + nc);
                if (rescontrol != null) {
                    while (rescontrol.next()) {
                        control = rescontrol.getInt("Control");
                    }
                }

%>
<script>
    alertify.success("Cambio realizado");
    location.href = "MostrarTutor.jsp?control=<%=control%>";
</script>
<%} else {
%>
<script>
    alertify.error("Cambio no realizado vuelva a intertarlo");
</script>
<%
            }

        }
    }
%>

<jsp:include page="Pie.jsp"/>