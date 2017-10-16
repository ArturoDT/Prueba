<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<script>

</script>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:250px;
      margin: 170px; padding-left: 350px; max-width: 780px;" method="POST">
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
        <label class="title">Apellidos Paterno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoP" required="required" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Materno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" style="width: 300px"/>
    </div>
    <div class="">
        <label class="title">Grupos
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="grupo" required="required" style="width: 300px">
                    <option value="">Grupos</option>
                    <option value="101">101</option>
                    <option value="102">102</option>
                    <option value="103">103</option>
                    <option value="103">104</option>
                    <option value="103">105</option>
                    <option value="103">201</option>
                    <option value="103">202</option>
                    <option value="201">203</option>
                    <option value="202">204</option>
                    <option value="203">205</option>
                    <option value="301">301</option>
                    <option value="302">302</option>
                    <option value="303">303</option>
                    <option value="103">304</option>
                    <option value="103">305</option>
                    <option value="301">401</option>
                    <option value="302">402</option>
                    <option value="303">403</option>
                    <option value="103">404</option>
                    <option value="103">405</option>
                    <option value="301">501</option>
                    <option value="302">502</option>
                    <option value="303">503</option>
                    <option value="103">504</option>
                    <option value="103">505</option>
                    <option value="301">601</option>
                    <option value="302">602</option>
                    <option value="303">603</option>
                    <option value="103">604</option>
                    <option value="103">605</option>
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Telefono
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="telefono" required="required" value="" style="width: 300px"/>
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
    <div class="">
        <label class="title">Semestre
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="semestre" required="required" onchange="ValidarSemestre(this)" style="width: 300px">

                    <option value="">Semestres</option>
                    <option value="1">1°</option>
                    <option value="2">2°</option>
                    <option value="3">3°</option>
                    <option value="4">4°</option>
                    <option value="5">5°</option>
                    <option value="6">6°</option>
                </select>
                <i></i>
            </span>
        </div>
    </div>
    <div class="">
        <label class="title">Carrera
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="tec" required="required" style="width: 300px">
                    <option value="">Carreras</option>
                    <option value="Tecnico en ventas">Tecnico en ventas</option>
                    <option value="Tecnico en informatica">Tecnico en informatica</option>
                </select>
                <i></i>
            </span>
        </div>
    </div>
    <div class="">
        <label class="title">Turno
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="turno" required="required" style="width: 300px">
                    <option value="">Turnos</option>
                    <option value="Matutino">Matutino</option>
                    <option value="Vespertino">Vespertino</option>
                </select>
                <i></i>
            </span>
        </div>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
<!-- Stop Formoid form-->
<%
    if (request.getParameter("ncontrol") != null) {
        conectarBD nBD = new conectarBD();
        if (nBD.conectar()) {
            int vc = 0;
            int nc = Integer.parseInt(request.getParameter("ncontrol"));
            String n = request.getParameter("nombre");
            String ap = request.getParameter("apellidoP");
            String am = request.getParameter("apellidoM");
            int grupo = Integer.parseInt(request.getParameter("grupo"));
            String t = request.getParameter("telefono");
            String s = request.getParameter("sexo");
            String se = request.getParameter("semestre");
            String ca = request.getParameter("tec");
            String tu = request.getParameter("turno");
            ResultSet res = nBD.consultas("Select * from alumno where Control=" + nc);
            if (res != null) {
                while (res.next()) {
                    vc = res.getInt("Control");
                }
                if (vc == 0) {

                    if (nBD.ejecutaSQL("Insert into alumno values('" + nc + "',"
                            + "'" + n + "','" + ap + "','" + am + "','" + grupo + "',"
                            + "'" + 0 + "','" + 0 + "','" + s + "','" + se + "','" + t + "','" + ca + "','" + tu + "','" + 0 + "')")) {

%>
<script>
                    alertify.success("Registro Generado OK :)");

                    location.href = "FormularioDomicilio.jsp?control=<%=nc%>";
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
            }

        }
    } else {
    }
%>

<jsp:include page="Pie.jsp"/>

