<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int ncl = Integer.parseInt(request.getParameter("control"));
    int nc = 0;
    String n = "";
    String ap = "";
    String am = "";
    int grupo = 0;
    String sex = "";
    String semes = "";
    String tele = "";
    String ca = "";
    String tut = "";

    conectarBD ne = new conectarBD();
    if (ne.conectar()) {
        ResultSet resultado = ne.consultas("Select * from alumno where Control=" + ncl);
        if (resultado != null) {

            while (resultado.next()) {
                nc = resultado.getInt("Control");
                n = resultado.getString("Nombre");
                ap = resultado.getString("ApellidoP");
                am = resultado.getString("ApellidoM");
                grupo = resultado.getInt("Id_Grupo");
                sex = resultado.getString("Sexo");
                semes = resultado.getString("Semestre");
                tele = resultado.getString("Telefono");
                ca = resultado.getString("Carrera");
                tut = resultado.getString("Turno");
            }
        } else {
        }

    }
%>


<script>

    <%
        int aux1 = 0;
    %>
    var grupo = 0;
    var aux = 0;
    function validar(g) {
        grupo = g.value;
        validarS();
    }
    function validarS()
    {
        if (grupo >= 101 & grupo <= 105)
        {
            aux = 1;

        }
        if (grupo >= 201 & grupo <= 205)
        {
            aux = 2;

        }
        if (grupo >= 301 & grupo <= 305)
        {
            aux = 3;

        }
        if (grupo >= 401 & grupo <= 405)
        {
            aux = 4;

        }
        if (grupo >= 501 & grupo <= 505)
        {
            aux = 5;

        }
        if (grupo >= 601 & grupo <= 605)
        {
            aux = 6;

        }
    }
    function ValidarSemestre(s)
    {
        var se = s.value;
        if (se == aux)
        {

            alertify.confirm("El " + se + "° semestre correspode al grupo: " + grupo + "\n\ ");
        } else
        {
            alertify.confirm("El " + se + "° semestre no correspode al grupo: " + grupo + "\n\
     Elige el semestre correcto ");
            aux = 0;
        }
    }

</script>
<p>
    Selecciones la casilla a modificar y realice los cambios necesarios.
</p>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:480px;min-width:150px;
      margin: 170px; padding-left: 350px; max-width: 780px;" 
       method="POST">
    <div class="title"><h2>Editar Datos del Alumnos</h2></div>
    <div class="element-input">
        <label class="title">Numero de Control
            <span class="required">
                *</span>
        </label>
        <input class="null" type="number" name="ncontrol" required="required" value="<%=ncl%>" 
               readonly="readonly" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Nombre(s)
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="nombre" required="required" value="<%=n%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Paterno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoP" required="required" value="<%=ap%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Apellidos Materno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="apellidoM" required="required" value="<%=am%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Grupo
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="grupo" required="required" value="<%=grupo%>" style="width: 300px"/>
    </div>
    <div class="">
        <label class="title">Telefono
            <span class="required">*
            </span>
        </label>
        <input class="null" type="text" name="telefono" required="required" value="<%=tele%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Sexo
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="sexo" required="required" value="<%=sex%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Semestre
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="semestre" required="required" value="<%=semes%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Carrera
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="carrera" required="required" value="<%=ca%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title" >Turno
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="turno" required="required" value="<%=tut%>" style="width: 300px"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
<!-- Stop Formoid form-->
<%
    if (request.getParameter("ncontrol") != null) {
        conectarBD nBD = new conectarBD();
        if (nBD.conectar()) {
            int vc = 0;
            int nco = Integer.parseInt(request.getParameter("ncontrol"));
            String nom = request.getParameter("nombre");
            String apeP = request.getParameter("apellidoP");
            String apeM = request.getParameter("apellidoM");
            int grupo1 = Integer.parseInt(request.getParameter("grupo"));
            String t = request.getParameter("telefono");
            String s = request.getParameter("sexo");
            String se = request.getParameter("semestre");
            String carrera = request.getParameter("carrera");
            String tu = request.getParameter("turno");
            out.print(nc + " " + n + " " + ap + " " + am + " " + grupo + " " + t + " " + s + " " + se + " " + ca + " ");

            if (nBD.ejecutaSQL("Update alumno set Nombre='" + nom + "',ApellidoP='" + apeP + "',ApellidoM='" + apeM + "',Id_Grupo='" + grupo1 + "',Sexo='" + s + "',Semestre='" + se + "',Telefono='" + t + "',Carrera='" + carrera + "',Turno='" + tu + "' where Control=" + nco)) {
%>
<script>
alertify.success("Cambio realizado");
location.href="MostrarAlumno.jsp?gr=<%=grupo%>";
</script>
<%
} else {
%>
<script>
    alertify.error("Cambio no realizado");
</script>
<%
            }
        }
    }
%>

<jsp:include page="Pie.jsp"/>

