<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    conectarBD c = new conectarBD();
    int nc = Integer.parseInt(request.getParameter("control"));

    if (c.conectar()) {
        ResultSet validacionT = c.consultas("Select Id_Tutor from alumno where Control=" + nc);
        if (validacionT != null) {
            int idt = 0;
            while (validacionT.next()) {
                idt = validacionT.getInt("Id_Tutor");

            }
            if (idt > 0) {
%>
<script>
    alertify.error("El alumno ya cuenta con un Tutor Registrado\n\
     Solo se permite el registro de un Tutor por alumo");

    function redireccionando()
    {
        location.href = "TablaAlumnos.jsp";

    }
    setTimeout("redireccionando()", 1000);
</script>
<%
} else
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Tutor</h2></div>
    <br>
    <div class="element-input">
        <label class="title">Parentesco
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="parentesco" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="nombre" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">ApellidoP
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="apellidoP" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">ApellidoM
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 250px"/>
    </div>
    <div class="element-input">
        <label class="title">Telefono
            <span class="required">
                *</span>
        </label>
        <input class="null" type="number" name="telefono" required="required"style="width: 250px"/>
    </div>
    <div class="">
        <label class="title">Celular
            <span class="required">*
            </span>
        </label>
        <input class="null" type="number" name="celular" required="required" value="" style="width: 250px"/>
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

        if (c.conectar()) {
            if (c.ejecutaSQL("Insert into tutores values(null,'" + parentesco + "','" + nombre + "','" + apP + "','" + apM + "','" + T + "','" + cel + "','" + 0 + "')")) {
                ResultSet res = c.consultas("SELECT MAX(Id_Tutores) AS id FROM tutores");
                if (res != null) {
                    int id = 0;
                    while (res.next()) {
                        id = res.getInt("id");
                    }
                    if (c.ejecutaSQL("Update alumno set Id_Tutor='" + id + "'where Control=" + nc)) {

%>
<script>
    alertify.success("Registro Generado OK :)");
    location.href = "FormularioDomicilioT.jsp?id=<%=id%>";
</script>

<%        } else {
%>
<script>
    alertify.error("Ocurrio un error al realizar el registro intentelo de nuevo :)");
</script>

<%
        }
    }
} else {
%>
<script>
    alertify.error("Error al registrar :(");

</script>

<%
                        }
                    }

                }

        }
    }
%>


<jsp:include page="Pie.jsp"/>