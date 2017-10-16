<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<%
    int idG = Integer.parseInt(request.getParameter("idG"));
    int idC = Integer.parseInt(request.getParameter("idC"));
    String turno = request.getParameter("turno");
    int sem=0;
    if (idG != 0 & idC != 0 & turno != "") {
        conectarBD c = new conectarBD();
       
            
        if (c.conectar()) {
             ResultSet se = c.consultas("select Semestre from grupos where Id_Grupo="+idG);
        if(se!=null)
        {
            while(se. next())
            {
                sem=se.getInt("Semestre");
            }
        }
            if (c.ejecutaSQL("Update grupos set Carrera=" + idC + ", Turno='" + turno + "' where Id_Grupo=" + idG)) {
                out.println("<h3 style='align-content: center; margin: 50px'><center> Actualizacion Completa</center></h3>");
                
%>
<script>
    function redireccionando()
    {
        location.href = "TablaGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
   
            } else {
                out.println("<h1>Error Actualizacion</h1>");
            }
        }
    }

%>