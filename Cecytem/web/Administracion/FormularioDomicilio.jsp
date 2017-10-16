<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    
     conectarBD c = new conectarBD();
      int nc = Integer.parseInt(request.getParameter("control"));
     int Opcion= Integer.parseInt(request.getParameter("opcion"));
     if(Opcion==1)
     {
    
     
         if(c.conectar())
    {
        int idD=0;
        int idG=0;
      ResultSet ressultado  = c.consultas("Select Id_Domicilio, Id_Grupo from alumno where Control="+nc);
   if(ressultado!=null)
   {
       while(ressultado.next())
       {
           idD=ressultado.getInt("Id_Domicilio");
           idG=ressultado.getInt("Id_Grupo");
       }
   }
   if(idD<=0)
   {
%>
  <form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Domicilio Alumnos</h2></div>
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
        <input class="null" type="number" name="codpos" required="required" value="" style="width: 250px"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div>
    <div class="button"><a href="FormularioAlumno.jsp"><input type="button" value="Omitir" style="align-content: 300px"/></a></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("calle") != null) {
        String calle = request.getParameter("calle");
        String ne = request.getParameter("ne");
        String colonia = request.getParameter("colonia");
        String localidad = request.getParameter("localidad");
        String municipio = request.getParameter("municipio");
        String codpos = request.getParameter("codpos");

       
        if (c.conectar()) {
            
            if (c.ejecutaSQL("Insert into domicilioalumnos values(null,'" + calle + "','" + ne + "','" + colonia + "','" + localidad + "','" + municipio + "','" + codpos + "')")) {
                ResultSet res = c.consultas("SELECT MAX(Id_Domicilio) AS id FROM domicilioalumnos");
                if (res != null) {
                    int id = 0;
                    while (res.next()) {
                        id = res.getInt("id");
                    }
                    if (c.ejecutaSQL("Update alumno set Id_Domicilio='" + id + "' where Control=" + nc)) {
%>
<script>
    alertify.success("Registro Generado OK :)");
     function redireccionando()
    {
        location.href = "TablaAlumnos.jsp";

    }
    setTimeout("redireccionando()", 1500);
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
       
   <%}else
{
         %>
<script>
    alertify.error("El alumno ya cuenta con un domicilio registrado es permitido registrar otro");
     function redireccionando()
    {
        location.href = "TablaAlumnos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
}
    }
}
if(Opcion==2)
{
%>
  <form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de domicilio Alumnos</h2></div>
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
    <div class="submit"><input type="submit" value="Enviar"/></div>
    <div class="button"><a href="FormularioAlumno.jsp"><input type="button" value="Omitir" style="align-content: 300px"/></a></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("calle") != null) {
        String calle = request.getParameter("calle");
        String ne = request.getParameter("ne");
        String colonia = request.getParameter("colonia");
        String localidad = request.getParameter("localidad");
        String municipio = request.getParameter("municipio");
        String codpos = request.getParameter("codpos");

       
        if (c.conectar()) {
            
            if (c.ejecutaSQL("Insert into domicilioalumnos values(null,'" + calle + "','" + ne + "','" + colonia + "','" + localidad + "','" + municipio + "','" + codpos + "')")) {
                ResultSet res = c.consultas("SELECT MAX(Id_Domicilio) AS id FROM domicilioalumnos");
                if (res != null) {
                    int id = 0;
                    while (res.next()) {
                        id = res.getInt("id");
                    }
                    if (c.ejecutaSQL("Update alumno set Id_Domicilio='" + id + "' where Control=" + nc)) {
%>
<script>
    alertify.success("Registro Generado OK :)");
     function redireccionando()
    {
        location.href = "FormularioAlumno.jsp";

    }
    setTimeout("redireccionando()", 1500);
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
}
   
%>
<jsp:include page="Pie.jsp"/>