<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    int id = Integer.parseInt(request.getParameter("idP"));
    out.println(id);
    int con=0;
    if (id > 0) {
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            if (c.ejecutaSQL("Update periodoesc set Estado=1 where Id_Periodo="+id)) {
                 con=1;
            }else
{
 out.println("Error 1");
}
            
            if(con==1)
            {
                out.println("Activo");
              if (c.ejecutaSQL("Update periodoesc set Estado=0 where Id_Periodo<>"+id)) {
%>
<div style="margin: 460px; padding-left: 280; background: #31708f;max-width: 300px; border-radius: 50px;">
    
    <h1><center> Activacion Completa</center></h1>
</div>
<script>

    function redireccionando()
    {
        location.href = "MostrarCicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
                }else
{
 out.println("Error 2");
}
            }
        }
    }
%>

