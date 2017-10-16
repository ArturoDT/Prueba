<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>


<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 180px; padding-left: 5px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Alta de Grupos</h2></div>


    <div class="">
        <label class="title">Selecciona un Semestre
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

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<div id="respuesta"> </div>
<%
    if (request.getParameter("semestre") != null) {
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            int ver = 0;
            int se = Integer.parseInt(request.getParameter("semestre"));
            ResultSet resS = c.consultas("Select Semestre from grupos where Semestre=" + se);
            if (resS != null) {
                while (resS.next()) {
                    ver = resS.getInt("Semestre");
                }
            }
            if (ver > 0) {
%>
<script>
    location.href = "procesa.jsp?n=<%=se%>";
</script>
<%
} else {
%>
<script>
    alertify.error("No sean agregado grupos al semestre");

    function redireccionando()
    {
        location.href = "CicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 3000);
</script>
<%
            }

        }
    }
%>


<jsp:include page="Pie_1.jsp"/>

