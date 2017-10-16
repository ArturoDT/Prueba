<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<%
        int ver = 0;
        int grupo = Integer.parseInt(request.getParameter("n"));
        int idC = Integer.parseInt(request.getParameter("idC"));
        String turno= request.getParameter("turno");
        out.println("Si hay algo"+grupo+idC+turno);
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            out.println("conectado");
            ResultSet res = c.consultas("Select Carrera from grupos where Grupo="+grupo);
            if (res != null) {
                while (res.next()) {
                    ver = res.getInt("Carrera");
                    out.println("valor"+ver);
                }
            }
            if (ver > 0) {
%>
<script>
    alertify.Error("El grupo ya tiene asignada una Carrera");
</script>
<%
            } else {
if(c.ejecutaSQL("Update grupos set Carrera="+idC+", Turno='"+turno+"' where Grupo="+grupo))
{
 out.println("Hecho");
 ResultSet resS = c.consultas("Select Semestre from grupos where Grupo="+grupo);
            if (resS != null) {
                while (resS.next()) {
                    ver = resS.getInt("Semestre");
                }
            }
%>
<script>
    alertify.success("Registro Correcto");
    location.href="procesa.jsp?n=<%=ver%>";
</script>
<%
}else
{
 out.println("No Hecho");
%>
<script>
    alertify.Error("Error al registrar");
</script>
<%
}

}
        }
%>