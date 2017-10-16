<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<%
    String accion = request.getParameter("opcion");

    conectarBD c = new conectarBD();
    if (accion.equals("borrarcarrera")) {
        if (c.conectar()) {
            int idC = Integer.parseInt(request.getParameter("idC"));
            int ver = 0;
            ResultSet res = c.consultas("Select Carrera from grupos where Carrera=" + idC);
            if (res != null) {
                while (res.next()) {
                    ver = res.getInt("Carrera");
                }
            }
            if (ver > 0) {
%>
<script>
    alertify.error("La Carrera a sido Asignada un grupo del periodo");

</script>
<%
} else if (c.ejecutaSQL("Delete from carrera where Id_Carrera=" + idC)) {
%>
<script>
    alertify.success("Registro Eliminado");
    function redireccionando()
    {
        location.href = "MostrarCarrera.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }

        }
    }

//funcion borrar grupos
    if (accion.equals("borrargrupo")) {
        if (c.conectar()) {
            int idC = Integer.parseInt(request.getParameter("idC"));
            int ver = 0;
            ResultSet res = c.consultas("Select alumno.Id_Grupo from alumno where Id_Grupo=" + idC);
            if (res != null) {
                while (res.next()) {
                    ver = res.getInt("Id_Grupo");
                }
            }
            if (ver > 0) {
%>
<script>
    alertify.error("El Grupo ya fue Asignado a Alumnos del periodo");

</script>
<%
} else if (c.ejecutaSQL("Delete from grupos where Id_Grupo=" + idC)) {

%>
<script>
    alertify.success("Registro Eliminado");
    function redireccionando()
    {
        location.href = "TablaGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
//funcion Registrar grupo
    if (accion.equals("registrargrupo")) {
        if (c.conectar()) {
            int grupos = Integer.parseInt(request.getParameter("grupo"));
            int idC = Integer.parseInt(request.getParameter("idC"));
            int sem = Integer.parseInt(request.getParameter("semestre"));
            String turno =request.getParameter("turno");
            int ver = 0;
int idPe=0;
ResultSet idP =c.consultas("Select Id_Periodo from periodoesc where Estado="+1);
if(idP!=null)
{
while(idP.next())
{
idPe=idP.getInt("Id_Periodo");
}
}

if(idPe>0)
{
          ResultSet res = c.consultas("Select Id_Grupo from grupos,periodoesc where periodoesc.Id_Periodo = grupos.Id_Periodo and Grupo=" + grupos+" and periodoesc.Estado="+1);
            if (res != null) {
                while (res.next()) {
                    ver = res.getInt("Id_Grupo");
                }
            }
            if (ver > 0) {
%>
<script>
    alertify.error("El Grupo ya existe registrado en el Perido");

</script>
<%
} else if (c.ejecutaSQL("Insert into grupos values(null,"+grupos+","+idC+",'"+turno+"',"+sem+","+idPe+")")) {

%>
<script>
    alertify.success("Registro Correcto");
    function redireccionando()
    {
        location.href = "TablaGrupos.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }

}
  
        }
    }

%>