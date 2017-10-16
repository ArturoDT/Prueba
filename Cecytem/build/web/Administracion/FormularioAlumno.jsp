<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<script>

</script>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:250px;
      margin: 170px; padding-left: 310px; max-width: 780px;" method="POST">
    <div class="title"><h2>Resgistro de Alumnos</h2></div>
    <div class="element-input">
        <label class="title">Numero de Control
            <span class="required">
                *</span>
        </label>
        <input class="null" type="number" name="ncontrol" required="required" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre(s)
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="nombre" required="required" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellido Paterno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoP" required="required" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellido Materno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 300px"/>
    </div>
<div class="">
        <label class="title">Selecciona un Grupo
            <span class="required">*
            </span>
        </label>
    <div class="null">
            <span>
                <select required="required" style="width: 250px" name="grupos">
                    <option value="">Grupos</option>
                     <%
                                                conectarBD c = new conectarBD();
                                                conectarBD nBD = new conectarBD();
                                                if (nBD.conectar()) {
                                                    Object[] filas1= new Object[2];
                                                    ResultSet res1 = nBD.consultas("Select * from grupos,periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                                            + " periodoesc.Estado="+1+" order by Grupo");
                                                    if (res1 != null) {
                                                       
                                                        while (res1.next()) {
                                                            filas1[0] = res1.getInt("Id_Grupo");
                                                            filas1[1] = res1.getInt("Grupo");
                                            %>
                                            <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Telefono
            <span class="required">*
            </span>
        </label>
        <input class="null" type="number" name="telefono" required="required" value="" style="width: 300px"/>
    </div>
    <div class="">
        <label class="title">Sexo
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="sexo" required="required" style="width: 300px">

                    <option value="Femenino">Femenino</option>
                    <option value="Masculino">Masculino</option>
                </select>
                <i></i>
            </span>
        </div>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
<!-- Stop Formoid form-->
<%
    if (request.getParameter("ncontrol") != null) {
        
        if (nBD.conectar()) {
            int vc = 0;
            int nc = Integer.parseInt(request.getParameter("ncontrol"));
            String n = request.getParameter("nombre");
            String ap = request.getParameter("apellidoP");
            String am = request.getParameter("apellidoM");
            int grupo = Integer.parseInt(request.getParameter("grupos"));
            String t = request.getParameter("telefono");
            String s = request.getParameter("sexo");
            ResultSet res = nBD.consultas("Select * from alumno where Control=" + nc);
            if (res != null) {
                while (res.next()) {
                    vc = res.getInt("Control");
                }
                if (vc == 0) {

                    if (nBD.ejecutaSQL("Insert into alumno values(" + nc + ",'" + n + "','" + ap + "','" + am + "','" + grupo + "',"+ 0 +",'" + s + "','" + t + "'," + 0 + ")")) {

%>
<script>
                    alertify.success("Registro Generado OK :)");

                    location.href = "FormularioDomicilio.jsp?control=<%=nc%>&opcion=2";
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
    alertify.confirm("No se puede realizar el registro por que el numero de control: <%=nc%> ya se encuentra registrado\n\
                    Intenta asignar un diferente numero por favor");
</script>
<%
                }
            }else
{
out.println("Error al registrar");
}

        }
    } else {
    }
%>

<jsp:include page="Pie.jsp"/>

