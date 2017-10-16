<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<!--codigo notificacion--->
<%
    int control=Integer.parseInt(request.getParameter("control"));
     int grupo =Integer.parseInt(request.getParameter("g"));
     String fecha = request.getParameter("fecha");
%>
<!--codigo notificacion--->
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;max-width:280px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Actualizar la Asistencia</h2></div>
    <br>
    <div class="element-input">
        <label class="title">Verifica tu numero de <strong bgcolor="red">Control</strong>
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="serie" required="required" style="width: 250px" value="<%=control%>" readonly="readonly"/>
    </div>
    <div class="submit"><input type="submit" value="Actualizar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("serie") != null) {
        int g = 0;
        Date n = Date.valueOf(LocalDate.now());
        Calendar cal = Calendar.getInstance();
        int dia = cal.get(cal.DAY_OF_WEEK);
        Time time = Time.valueOf(LocalTime.now());
        SimpleDateFormat ft = new SimpleDateFormat("yyy-MM-dd");
        Date nf = Date.valueOf(ft.format(n));
        String fc = ft.format(n);
        conectarBD c = new conectarBD();

        if (c.conectar()) {
            int nc = Integer.parseInt(request.getParameter("serie"));
          
            
            if(c.ejecutaSQL("Update asistencia set Permiso='Justificado', HoraE='"+time+"' where Id_alumno="+nc+" and FechaE='"+fecha+"'"))
            {
                %>
                <script>
                    alertify.success("Cambio Completo")
                        function redireccionando()
    {
        location.href="MostrarAsistencia.jsp?gr=<%=grupo%>";

    }
    setTimeout("redireccionando()", 1500);
                   
                </script>
<%
            }else
            {
            }
            
            
        }
    }

%>

<jsp:include page="Pie.jsp"/>