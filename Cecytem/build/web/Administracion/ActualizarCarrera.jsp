<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%int id = Integer.parseInt(request.getParameter("idC"));
conectarBD c = new conectarBD();
String nombre ="";
if(c.conectar())
{
    
    ResultSet res= c.consultas("Select nombreCarrera from carrera where Id_Carrera="+id);
    if(res!=null)
    {
        while(res.next())
        {
            nombre=res.getString("nombreCarrera");
        }
    }
}

%>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 180px; padding-left: 5px; max-width:780px;" 
      method="POST">
      <div class="title"><h2>Editar Carrera</h2></div>
    <div class="null">
        <label class="title">Ingrese el nombre de la Carrera
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="carrera" required="required" style="width: 300px" value="<%=nombre%>"/>
    </div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<div id="respuesta"> </div>
<%    if (request.getParameter ("carrera") != null) {

     String ciclo = request.getParameter("carrera").toUpperCase();

    if(c.conectar())
    {
        if(c.ejecutaSQL("Update carrera set nombreCarrera='"+ciclo+"' where Id_Carrera="+id))
        {
        %>
         <script>
             alertify.success("Actualizacion Correcta");
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
             alertify.error("Error al Actualizar->");
         </script>
         <%
        }
    }
}
    
    
%>
<jsp:include page="Pie_1.jsp"/>
