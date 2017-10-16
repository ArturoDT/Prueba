<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int nc = Integer.parseInt(request.getParameter("control"));
    String nombre = "";
    String password1 = "";
    int estado1 = 0;
    conectarBD c = new conectarBD();
    if (c.conectar()) {
        ResultSet res = c.consultas("Select User,Password,Status from usuarios where Id_usuario=" + nc);
        if (res != null) {
            while (res.next()) {
                nombre = res.getString("User");
                password1 = res.getString("Password");
                estado1 = res.getInt("Status");
            }
        }
    }
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Usuarios</h2></div>
    <div class="element-input">
        <label class="title">User:
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="nombreU" required="required" style="width: 250px" value="<%=nombre%>"/>
    </div>
    <div class="element-input">
        <label class="title">Password:
            <span class="required">
                *</span>
        </label>
        <input  type="password" name="password" required="required" style="width: 250px" value="<%=password1%>"/>
    </div>   
    <div class="">
        <label class="title">Estado
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="status" required="required" style="width: 250px" >
                    <option value="">Estado actual:<%if (estado1 == 1) {
                            out.println("Activo");
                        } else {
                            out.println("Inactivo");
                        }%></option>
                    <option value="0">Inactivo</option>
                    <option value="1">Activo</option>

                </select><i></i></span></div></div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
        <%
            if (request.getParameter("nombreU") != null) {
                String nombreU = request.getParameter("nombreU");
                String password = request.getParameter("password");
                int estado = Integer.parseInt(request.getParameter("status"));
                if (c.conectar()) {
                    if (c.ejecutaSQL("Update usuarios set User='" + nombreU + "',Password='" + password + "',Status=" + estado + " where Id_usuario=" + nc)) {
        %>
<script>
    alertify.success("Registro Generado OK :)");
    location.href = "MostrarPersonal.jsp";
</script>

<%
} else {
%>
<script>
    alertify.error("Error al registrar :(");

</script>

<%
            }
        }

    }
%>
<jsp:include page="Pie.jsp"/>