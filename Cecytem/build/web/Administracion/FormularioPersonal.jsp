<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<script>
</script>

 
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Resgistro de Personal Administrativo</h2></div>
     <div class="element-input">
        <label class="title">Cedula
            <span class="required">
                *</span>
        </label>
         <input class="null" type="number" name="cedula" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="nombre" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Paterno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoP" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Materno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 250px"/>
    </div>
    <div class="">
        <label class="title">Profesion
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="profesion" required="required" value="" style="width: 250px"/>
    </div>
     <div class="">
        <label class="title">Puesto
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="puesto" required="required" value="" style="width: 250px">
    </div>
      <div class="">
        <label class="title">Telefono
            <span class="required">*
            </span>
        </label>
          <input class="null" type="number" name="telefono" required="required" value="" style="width: 250px">
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
<!-- Stop Formoid form-->
<%
    if (request.getParameter("cedula") != null) {
        conectarBD nBD = new conectarBD();
        if (nBD.conectar()) {
            int vc = 0;
            int cedula = Integer.parseInt(request.getParameter("cedula"));
            String n = request.getParameter("nombre");
            String ap = request.getParameter("apellidoP");
            String am = request.getParameter("apellidoM");
            String pr = request.getParameter("profesion");
            String p = request.getParameter("puesto");
            String t = request.getParameter("telefono");
            
           
            ResultSet res = nBD.consultas("Select * from personal where Cedula=" + cedula);
            if (res != null) {
                while (res.next()) {
                    vc = res.getInt("Cedula");
                }
                if (vc == 0) {

                    if (nBD.ejecutaSQL("Insert into personal values('" + cedula + "','" + n +"','" + ap + "','" + am + "','" + pr + "','" + p + "','"+t+"'," + 0 + ")")) {

%>
<script>
                    alertify.success("Registro Generado OK :)");

                    location.href = "FormularioDomicilioP.jsp?cedula=<%=cedula%>";
</script>

<%    } else {
%>
<script>
    alertify.error("Registro no Generado Erroor¡ :)");
</script>

<%
    }

} else {
%>
<script>
    alertify.confirm("No se puede realizar el registro por que La Cedula Profesional ya se encuentra registrada\n\
                    Intenta asignar un diferente numero por favor");
</script>
<%
                }
            }

        }
    } else {
    }
%>

<jsp:include page="Pie.jsp"/>

