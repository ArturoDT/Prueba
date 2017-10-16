<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    conectarBD c = new conectarBD();
    String nombrePeriodo = "";
    int idP = Integer.parseInt(request.getParameter("idH"));
    if (c.conectar()) {

        ResultSet resper = c.consultas("Select periodo from periodoesc where Id_Periodo=" + idP);
        if (resper != null) {
            while (resper.next()) {
                nombrePeriodo = resper.getString("periodo");
            }
        }
    }
%>

<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 180px; padding-left: 5px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Editar del Ciclo-Periodo Escolar</h2></div>

    <div class="element-input">
        <label class="title">Nombre el Periodo ejemplo(Febrero 2000-Junio 2000)
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="periodo" required="required" value="<%=nombrePeriodo%>" style="width: 300px"/>
    </div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

    <%if(request.getParameter("periodo")!=null)
    {
        String nombre = request.getParameter("periodo");
        if(c.conectar())
        {
            if(c.ejecutaSQL("Update periodoesc set periodo='"+nombre+"' where Id_Periodo="+idP))
            {
                       %>
         <script>
             alertify.success("Actualizacion Correcta->");
             function redireccionando()
    {
        location.href = "MostrarCicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 1500);
         </script>
         <%
            }
        }
}
%>
<jsp:include page="Pie_1.jsp"/>
