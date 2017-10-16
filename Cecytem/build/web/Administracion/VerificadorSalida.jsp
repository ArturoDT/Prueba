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
<!--codigo notificacion--->
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Salida</h2></div>
    <br>
    <div class="element-input">
        <label class="title">Ingresa tu numero de Control
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="serie" required="required" style="width: 250px" onkeypress="return validarNumeros(event)"/>
    </div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

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
        out.print(nf + " " + fc + " " + time + " " + dia);
        conectarBD c = new conectarBD();
        String hora = "";
        if (c.conectar()) {
            int nc = Integer.parseInt(request.getParameter("serie"));
            int control = 0;

            ResultSet con = c.consultas("Select alumno.Control from alumno join grupos join periodoesc on grupos.Id_Grupo=alumno.Id_Grupo and "
                        + " grupos.Id_Periodo=periodoesc.Id_Periodo where periodoesc.Estado="+1+" and alumno.Control="+nc);
            while (con.next()) {
                control = con.getInt("Control");
            }
            if (control != 0) {
                ResultSet resul = c.consultas("Select Id_Grupo from alumno where Control = " + nc);
                int id = 0;
                Date f = null;
                String per = "";
                if (resul != null) {

                    ResultSet verificarregistro = c.consultas("Select *from asistencia where Id_alumno=" + nc + " and FechaE='" + nf + "'");
                    if (verificarregistro != null) {

                        while (verificarregistro.next()) {
                            id = verificarregistro.getInt("Id_alumno");
                            f = verificarregistro.getDate("FechaE");
                            per = verificarregistro.getString("Permiso");
                            hora = verificarregistro.getString("HoraS");
                            out.println("es id=" + id);
                        }
                    } else {
                        out.println("No hay");
                    }
                    if (id > 0 && f.equals(n) && per.equals("Retardo") || per.equals("Asistencia") || per.equals("Justificado")) {

                        if (hora.equals("00:00:00")) {
                            out.println(per);
                            if (c.ejecutaSQL("Update asistencia set HoraS='" + time + "' where Id_alumno=" + control+" and FechaE='"+nf+"'")) {
%>
<script>
    alertify.success('Registro Exitoso :)');
</script>
<%
} else {
%>
<script>
    alertify.error('Error al registrar ;/');
</script>
<%
        }
    }else
{
%>
<script>
    alertify.error('Ya cuentas con Hora de Salida');
</script>
<%
}

} else {
%>
<script>
    alertify.error('No cuentas con asistencia no es perimitido registrar Salida');
</script>
<%
        }

    }
} else {
%>
<script>
    alertify.error('Tu numero de cuenta no existe');
</script>
<%
            }
        }
    }

%>

<jsp:include page="Pie.jsp"/>