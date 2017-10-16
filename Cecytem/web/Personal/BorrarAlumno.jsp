<%@page import="logica.conectarBD"%>
<html>
    <title>
        Borrador
    </title>
    <body>
        <%
            int control=Integer.parseInt(request.getParameter("control"));
            out.print("Si hay algo"+ control);
            conectarBD c= new conectarBD();
            if(c.conectar())
            {
                out.print("conectado");
                if(c.ejecutaSQL("delete alumno,domicilioalumnos,domiciliotutor,tutores from alumno inner join domicilioalumnos inner join tutores inner join domiciliotutor on alumno.Id_Domicilio = domicilioalumnos.Id_Domicilio and "
                        + "alumno.Id_Tutor = tutores.Id_Tutores and tutores.Id_Domicilio=domiciliotutor.Id_Domicilio where alumno.Control="+control))
                {
                    out.println("Regsitro Borrado");
                    %>        
                    <script>
                       location.href="MostrarAlumno.jsp";
                    </script>    
                    <%
                }
                else
                {
                   out.println("Regsitro no Borrado"); 
                }
            }


            
        %>
    </body>
</html>