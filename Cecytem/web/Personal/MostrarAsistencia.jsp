<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>

<table class=" bordered-table zebra-striped" id="registro">
    <thead>
    <th>Numero control</th>
    <th>Nombre</th>
    <th>Apellido Paterno</th>
    <th>Apellido Materno</th>
    <th>Hora Entrada</th>
    <th>Hora Salida</th>
    <th>Fecha</th>
    <th>Asistencia</th>
    <th>Tomar Asstencia</th>
</thead>
<tbody>
    <%
        conectarBD c = new conectarBD();
        int gr = Integer.parseInt(request.getParameter("gr"));
        int control = 0;
        Date n = Date.valueOf(LocalDate.now());
        out.println(gr + "" + n);
        int con = 0;
        if (c.conectar()) {
            ResultSet relleno = c.consultas("Select Control from alumno left outer join asistencia on alumno.Control=asistencia.Id_alumno and "
                    + " asistencia.FechaE='" + n + "' where asistencia.Id_alumno is null and alumno.Id_Grupo=" + gr);
            int id = 0;
            if (relleno != null) {
                while (relleno.next()) {
                    id = relleno.getInt("Control");
                    if (c.ejecutaSQL("Insert into asistencia values(null,'" + id + "','" + "00:00:00" + "','" + "00:00:00" + "','" + n + "','" + "Falta" + "')")) {
                        con = 1;
                    }
                }
            }
            ResultSet res = c.consultas("Select alumno.Control, alumno.Nombre, alumno.ApellidoP,"
                    + " alumno.ApellidoM, asistencia.HoraE,"
                    + " asistencia.HoraS, asistencia.FechaE, asistencia.Permiso "
                    + "from alumno join asistencia on alumno.Control = asistencia.Id_alumno and alumno.Id_Grupo=" + gr + " and asistencia.FechaE='" + n + "'");
            if (res != null) {
                Object[] filas = new Object[6];
                while (res.next()) {
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getDate("FechaE");
                    filas[5] = res.getString("Permiso");
                    Time hora = res.getTime("HoraE");
                    Time horaS = res.getTime("HoraS");
                    control = res.getInt("Control");
    %>
    <tr>
        <td><%=filas[0]%></td> 
        <td><%=filas[1]%></td> 
        <td><%=filas[2]%></td> 
        <td><%=filas[3]%></td> 
        <td><%=hora%></td>
        <td><%=horaS%></td>
        <td><%=filas[4]%></td>
        <td><%=filas[5]%></td>
        <td><central><a href="ActualizarA.jsp?control=<%=filas[0]%>&g=<%=gr%>">
        <img src="img/actualizar.jpg" width="60" height="40"></a>
</central>
</td>
</tr>
<%
            }
        } else {
         
        }
    }

%>
</tbody>   
<button style="float: right; padding-left: 22px;">
    <a href="reporteSalario?grupo=<%=gr%>&fecha=<%=n%>&control=<%=control%>">
        Generar <img src="img/pdf.jpg" width="40" height="50">
    </a>
</button>
</table>

<jsp:include page="Pie.jsp"/>