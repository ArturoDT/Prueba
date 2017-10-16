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
                tele = resultado.getString("Telefono");
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
  <div class="">
        <label class="title">Selecciona un Grupo
            <span class="required">*
            </span>
        </label>
    <div class="null">
            <span>
                <select required="required" style="width: 250px" name="grupo">
                    <option value="">Grupos</option>
                     <%
                                                conectarBD c = new conectarBD();
                                                conectarBD nBD = new conectarBD();
                                                if (nBD.conectar()) {
                                                    Object[] filas1= new Object[2];
                                                    int idG=0;
                                                    ResultSet res1 = nBD.consultas("Select * from grupos,periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                                            + " periodoesc.Estado="+1);
                                                    if (res1 != null) {
                                                       
                                                        while (res1.next()) {
                                                            idG = res1.getInt("Id_Grupo");
                                                            filas1[1] = res1.getInt("Grupo");
                                            %>
                                            <option value="<%=idG%>"><%
                                                if(idG==grupo)
                                                {
                                                    out.println("Grupo Actual:"+filas1[1]);
                                                }
                                            else
                                                {
                                                    out.println(""+filas1[1]);
                                                }%></option>
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
        <input class="null" type="number" name="telefono" required="required" value="<%=tele%>" style="width: 300px"/>
    </div>
    <div class="element-input">
        <label class="title">Sexo
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="sexo" required="required" value="<%=sex%>" style="width: 300px"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
<!-- Stop Formoid form-->
<%
    if (request.getParameter("ncontrol") != null) {
        
        if (nBD.conectar()) {
            int vc = 0;
            int nco = Integer.parseInt(request.getParameter("ncontrol"));
            String nom = request.getParameter("nombre");
            String apeP = request.getParameter("apellidoP");
            String apeM = request.getParameter("apellidoM");
            int grupo1 = Integer.parseInt(request.getParameter("grupo"));
            String t = request.getParameter("telefono");
            String s = request.getParameter("sexo");
         
        
            out.print(nc + " " + n + " " + ap + " " + am + " " + grupo + " " + t + " " + s +  " " + ca + " ");

            if (nBD.ejecutaSQL("Update alumno set Nombre='" + nom + "',ApellidoP='" + apeP + "',ApellidoM='" + apeM + "',Id_Grupo='" + grupo1 + "',Sexo='" + s + "',Telefono='" + t + "' where Control=" + nco)) {
%>
<script>
alertify.success("Cambio realizado");
location.href="TablaAlumnos.jsp";
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

