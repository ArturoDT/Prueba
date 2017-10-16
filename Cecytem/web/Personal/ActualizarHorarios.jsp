<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int dias = 0;
     Time horaS =null;
     Time horaE =null;
    String hs="";
    String he="";
    int grupo = 0;
    int id = 0;
    int idH = Integer.parseInt(request.getParameter("idH"));
    conectarBD b = new conectarBD();
    if (b.conectar()) {
        ResultSet res = b.consultas("Select * from horarios where Id_Horarios=" + idH);
        if (res != null) {

            Object[] fila = new Object[4];
            while (res.next()) {
                id = res.getInt("Id_Horarios");
                grupo = res.getInt("Grupo");
                dias = res.getInt("Dia");
                he = res.getString("HoraEntrada");
                hs = res.getString("HoraSalida");
            }
        }
    }
%>

<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST" action="#">
    <label><%if (dias == 2) {
            out.print("<h3>GRUPO "+grupo+"------ DIA LUNES</h3>");
        }
        if (dias == 3) {
            out.print("<h3>GRUPO "+grupo+"------ DIA MARTES</h3>");
        }
        if (dias == 4) {
            out.print("<h3>GRUPO "+grupo+"------ DIA MIERCOLES</h3>");
        }
        if (dias == 5) {
            out.print("<h3>GRUPO "+grupo+"------ DIA JUEVES</h3>");
        }
        if (dias == 6) {
            out.print("<h3>GRUPO "+grupo+"------ DIA VIERNES</h3>");
        }
        %>
    </label>
    <label class="title">Horas de Entrada
        <span class="required">*
        </span>
    </label>
    <label class="title">Hora Actual: <%=he%>
        <span class="required">*
        </span>
    </label>
    <div class="null">
        <span>
            <input  type="time" required="required" name="horae">
           <i></i></span></div></div>
<div class="">
    <label class="title">Horas de Salida
        <span class="required">*
        </span>
    </label>
     <label class="title">Hora Actual: <%=hs%>
        <span class="required">*
        </span>
    </label>
    <div class="null">
        <span>
            <input  type="time" required="required" name="horas">
           <i></i></span></div></div>
                <div>
                   
                    </div>
<div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%if(request.getParameter("horas")!= null && request.getParameter("horae")!=null)
{
    String a1= request.getParameter("horas");
    String a2= request.getParameter("horae");
    String hss = a1+":00";
    String hee = a2+":00";
    horaS = Time.valueOf(hss);
    horaE = Time.valueOf(hee);
    if(horaE.before(horaS))
    {
        if(b.conectar())
        {
            if(b.ejecutaSQL("Update horarios set HoraEntrada ='"+horaE+"', HoraSalida='"+horaS+"' where Id_Horarios="+idH))
            {
                %>
                <script>
                    alertify.success("Actualizacion Completa");
                    location.href="MostrarHorarios.jsp?gr=<%=grupo%>";
                </script>
                <%
            }
            else
            {
                 %>
                <script>
                    alertify.error("Error al Actualizar");
                </script>
                <%
            }
        }
    }else
    {
       %>
                <script>
                    alertify.error("No puedes se puede registrar un Hora de\n\
                    \n entrada mayor a la hora de Salida");
                </script>
                <%
    }
    
  
   
}else
{
}%>
<jsp:include page="Pie.jsp"/>