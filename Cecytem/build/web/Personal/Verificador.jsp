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
    <div class="title"><h2>Registro de Asistencia</h2></div>
    <br>
    <div class="element-input">
        <label class="title">Ingresa tu numero de Control
            <span class="required">
                *</span>
        </label>
        <input  type="text" name="serie" required="required" style="width: 250px"/>
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

        if (c.conectar()) {
            int nc = Integer.parseInt(request.getParameter("serie"));
            int control = 0;

            ResultSet con = c.consultas("select Control from alumno where Control =" + nc);
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
                            out.println("es id=" + id);
                        }
                    } else {
                    }

                    if (id != 0) {
%>
<script>
    alertify.confirm("Ya cuentas con asistencia");
</script>
<%
} else {
    g = 0;
    while (resul.next()) {
        g = resul.getInt("Id_Grupo");
    }

    ResultSet resul3 = c.consultas("Select Grupo from horarios where Grupo=" + g + " and Dia=" + dia);
    if (resul3 != null) {
        int grr = 0;

        while (resul3.next()) {
            grr = resul3.getInt("Grupo");
        }
        if (grr != 0) {
            out.println("yes");
            ResultSet resul2 = c.consultas("Select HoraEntrada from horarios where Grupo=" + g + " and Dia=" + dia);
            if (resul2 != null) {
                while (resul2.next()) {
                    Time hora = resul2.getTime("HoraEntrada");
                    out.println("Si hay hora" + hora);
                    if (hora.before(time)) {
                        out.println("Se te iso tarde");
                        if (c.ejecutaSQL("Insert into asistencia values(null,'" + nc + "','" + time + "','" + "00:00:00" + "','" + nf + "','" + "Retardo" + "')")) {
%>
<script>
    alertify.success("Registro Realizado");
</script>
<%
} else {
%>
<script>
    alertify.error("Error al realizar el registro");
</script>
<%
    }
} else {
    out.println("llegaste a tiempo");
    if (c.ejecutaSQL("Insert into asistencia values(null,'" + nc + "','" + time + "','" + "00:00:00" + "','" + nf + "','" + "Asistencia" + "')")) {
%>
<script>
    alertify.success("Registro Realizado");
</script>
<%
} else {
%>
<script>
    alertify.error("Error al realizar el registro");
</script>
<%
                }

            }
        }
    } else {
    }
} else {
%>
<script>
    alertify.error('Es necesario asigar el horario correspodiente a tu grupo');
</script>
<%
                }

            }

        }

    }
} else {

%>
<script>
    alertify.error('Tu numero de cuenta no existe');
</script>
<%            }

        }

    }

%>

<jsp:include page="Pie.jsp"/>