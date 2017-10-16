<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int idPe = 0;
    String periodo = "";
    conectarBD c = new conectarBD();
    if (c.conectar()) {
        ResultSet res = c.consultas("Select periodoesc.Id_periodo,periodoesc.periodo from periodoesc "
                + " where periodoesc.Estado="+1);
        if (res != null) {
            while (res.next()) {
                idPe = res.getInt("Id_periodo");
                periodo = res.getString("periodo");
            }
        }
    }

%>

<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">

    <div class="title"><h2>Registro de Grupos</h2></div>
    <div class="title"><h3>Periodo : <% out.println(periodo);%>
        </h3></div>

    <div class="">
        <label class="title">Semestres
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="semestre" required="required" style="width: 250px">
                    <option value="">Semestres</option>
                    <option value="1">1°</option>
                    <option value="2">2°</option>
                    <option value="3">3°</option>
                    <option value="4">4°</option>
                    <option value="5">5°</option>
                    <option value="6">6°</option>
                </select><i></i></span></div></div>
      <div class="">
        <label class="title">¿Cuantos Grupos deseas crear :)?
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="ng"  required="required" style="width: 250px">
                    <option value="">Cantidad</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select><i></i></span></div></div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>
        <%
            if (request.getParameter("semestre") != null) {
                if (c.conectar()) {
                    int se = Integer.parseInt(request.getParameter("semestre"));
                    int ng = Integer.parseInt(request.getParameter("ng"));
                    int contador = 1;
                    for (int i = 1; i <= ng; i++) {
                        if (se == 1) {
                            int aux = 100 + i;
                            ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
                            if (result != null) {
                                int ver = 0;
                                while (result.next()) {
                                    ver = result.getInt("Id_Periodo");
                                }
                                if (ver > 0) {
        %>
<script>
    alertify.error("Ya existe el Grupo en Registrado en este periodo");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
    function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }

    }
    if (se == 2) {
        int aux = 200 + i;
        ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
        if (result != null) {
            int ver = 0;
            while (result.next()) {
                ver = result.getInt("Id_Periodo");
            }
            if (ver > 0) {
%>
<script>
    alertify.error("Ya existen el Grupos en Registrado en este Semestre Eliga otro");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
     function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
    if (se == 3) {
        int aux = 300 + i;
        ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
        if (result != null) {
            int ver = 0;
            while (result.next()) {
                ver = result.getInt("Id_Periodo");
            }
            if (ver > 0) {
%>
<script>
    alertify.error("Ya existe el Grupo en Registrado en este periodo");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
     function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
    if (se == 4) {
        int aux = 400 + i;
        ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
        if (result != null) {
            int ver = 0;
            while (result.next()) {
                ver = result.getInt("Id_Periodo");
            }
            if (ver > 0) {
%>
<script>
    alertify.error("Ya existe el Grupo en Registrado en este periodo");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
     function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
    if (se == 5) {
        int aux = 500 + i;
        ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
        if (result != null) {
            int ver = 0;
            while (result.next()) {
                ver = result.getInt("Id_Periodo");
            }
            if (ver > 0) {
%>
<script>
    alertify.error("Ya existe el Grupo en Registrado en este periodo");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
     function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
    if (se == 6) {
        int aux = 600 + i;
        ResultSet result = c.consultas("Select Grupo,Id_Periodo from grupos where Grupo=" + aux + " and Id_Periodo=" + idPe);
        if (result != null) {
            int ver = 0;
            while (result.next()) {
                ver = result.getInt("Id_Periodo");
            }
            if (ver > 0) {
%>
<script>
    alertify.error("Ya existe el Grupo en Registrado en este periodo");
</script>
<%
        ng = 1;
    } else if (c.ejecutaSQL("Insert into grupos values(null," + aux + "," + 0 + ",' '," + se + "," + idPe + ")")) {
        contador++;
    }
    if (contador > ng) {
%>
<script>
    alertify.success("Registro Corresto :)");
     function redireccionando()
    {
        location.href = "MostrarGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
                        }
                    }
                }
            }
        }

    }
%>
<jsp:include page="Pie.jsp"/>