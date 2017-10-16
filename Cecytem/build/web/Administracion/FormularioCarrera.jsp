<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 180px; padding-left: 5px; max-width:780px;" 
      method="POST">
      <div class="title"><h2>Registro de Carreras</h2></div>
    <div class="null">
        <label class="title">Ingrese el nombre de la Carrera
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="carrera" required="required" style="width: 300px"/>
    </div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<div id="respuesta"> </div>
<%    if (request.getParameter ("carrera") != null) {
conectarBD c = new conectarBD();
     String ciclo = request.getParameter("carrera").toUpperCase();
    
     int verif=0;
     if(c.conectar())
     {
     ResultSet ver = c.consultas("Select Id_Carrera from carrera where nombreCarrera='"+ciclo+"'");
     if(ver!=null)
     {
         while(ver.next())
         {
             verif=ver.getInt("Id_Carrera");
            
         }
     }
      out.println(verif);
     if(verif>0)
     {
         %>
         <script>
             alertify.error("Ya existe un periodo igual asignado al Año");
         </script>
         <%
     }else
{
    if(c.conectar())
    {
        if(c.ejecutaSQL("Insert into carrera values(null,'"+ciclo+"')"))
        {
        %>
         <script>
             alertify.success("Registro Correcto");
             function redireccionando()
    {
        location.href = "MostrarCarrera.jsp";

    }
    setTimeout("redireccionando()", 1500);
         </script>
         <%
        }else
        {
            %>
         <script>
             alertify.error("Error al registrar");
         </script>
         <%
        }
    }
}
    
    }
}
%>
<jsp:include page="Pie_1.jsp"/>
