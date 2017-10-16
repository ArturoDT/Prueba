<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<jsp:include page="newjsp.jsp"/>
<div class="title"><h2>Consulta de Asistencia </h2></div>
<%conectarBD c = new conectarBD();
    int gr = Integer.parseInt(request.getParameter("idH"));
    Object[] fila = new Object[6];
    if (c.conectar()) {

        ResultSet resul = c.consultas("Select alumno.Nombre, alumno.ApellidoP, carrera.nombreCarrera, grupos.Turno, grupos.Grupo, "
                + " periodoesc.periodo from alumno,grupos,periodoesc,carrera where alumno.Id_Grupo=grupos.Id_Grupo and grupos.Id_Periodo=periodoesc.Id_Periodo and"
                + " carrera.Id_Carrera=grupos.Carrera and alumno.Control=" + gr);
        if (resul != null) {
            while (resul.next()) {
                fila[0] = resul.getString("Nombre");
                fila[1] = resul.getString("ApellidoP");
                fila[2] = resul.getString("nombreCarrera");
                fila[3] = resul.getString("Turno");
                fila[4] = resul.getInt("Grupo");
                fila[5] = resul.getString("periodo");

            }
        }

    }
%>  
<div id="tabla">
    <div style="background: wheat; width: 25%; padding-left: 30px; border-radius: 30px; font-family:  cursive; align-content: center;">
        <di><label>Datos del Alumno</label></di><br>
        <di><label>Alumno:</label><label><%=fila[0]%>_<%=fila[1]%></label></di><br>
        <di><label>Carrera:</label><label><%=fila[2]%></label></di><br>
        <di><label>Turno:</label><label><%=fila[3]%></label></di><br>
        <di><label>Grupo:</label><label><%=fila[4]%></label></di><br>
        <di><label>Periodo:</label><label><%=fila[5]%></label></di>
    </div>
    <br>
    <table class=" bordered-table zebra-striped" id="registro">
        <thead>
        <th>Hora Entrada</th>
        <th>Hora Salida</th>
        <th>Fecha</th>
        <th>Estado</th>
        </thead>
        <tbody>
            <%
                int totalA = 0;
                int totalR = 0;
                int totalJ = 0;
                int totalF = 0;
                int contadorA = 0;
                int contadorF = 0;
                int contadorR = 0;
                int contadorJ = 0;
                int control = 0;
                Date n = Date.valueOf(LocalDate.now());
                int con = 0;
                if (c.conectar()) {
                    ResultSet res = c.consultas("Select alumno.Control, alumno.Nombre, alumno.ApellidoP,"
                            + " alumno.ApellidoM, asistencia.HoraE,"
                            + " asistencia.HoraS, asistencia.FechaE, asistencia.Permiso "
                            + "from alumno join asistencia on alumno.Control = asistencia.Id_alumno and alumno.Control=" + gr + " order by FechaE,ApellidoP");
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
                            if (filas[5].equals("Asistencia")) {
                                contadorA++;

                            }
                            if (filas[5].equals("Retardo")) {
                                contadorR++;

                            }
                            if (filas[5].equals("Justificado")) {
                                contadorJ++;

                            }
                            if (filas[5].equals("Falta")) {
                                contadorF++;
                            }
            %>
            <tr>
                <td><%=hora%></td>
                <td><%=horaS%></td>
                <td><%=filas[4]%></td>
                <td><%=filas[5]%></td>
            </tr>
            <%
                    }
                }
                if (control <= 0) {
            %>
        <script>
    alertify.error("No se encontraron registros de Asistencia del grupo <%=gr%> \n\
                    Agregar alumnos-->");

    function redireccionando()
    {
        location.href = "PruebaTabla.jsp";

    }
    setTimeout("redireccionando()", 1500);
        </script>
        <%
                }
            }

        %>
        </tbody>   
        <button style="float: right; padding-left: 22px;" onclick="Mostrar()" class="submit">
            Consulta Personalisada<img src="img/Inicio.jpg" width="30" height="30">
        </button>
        <button style="float: right; padding-left: 22px;">
            <a href="../reporteSalario?control=<%=control%>">
                Generar <img src="img/pdf.jpg" width="30" height="30">
            </a>
        </button>
        <script>
            function Mostrar()
            {
                var divMostrar = document.getElementById("Fechas");
                divMostrar.style.display = "block";
                var divMostrar = document.getElementById("tabla");
                divMostrar.style.display = "none";
            }
            function Cerrar()
            {
                var divMostrar = document.getElementById("Fechas");
                divMostrar.style.display = "none";
                var divMostrar = document.getElementById("tabla");
                divMostrar.style.display = "block";
            }
            function Enviar()
            {

                var fi = $("#feinicio").val();
                var ff = $("#fefinal").val();
                if (fi < ff)
                {
                    location.href = "../ReportePersonalizado?control=<%=control%>&fi=" + fi + "&ff=" + ff;

                } else
                {
                    alertify.error("La fecha inicial deber ser menor a la \n\
              fecha final");
                }


            }
        </script> 

    </table>
    <br>
    <center>
        <div style="background: wheat; width: 15%; border-radius: 30px;">
            <di><label>Total Asistencias:</label><label><%=contadorA%></label></di><br>
            <di><label>Total Justificaciones:</label><label><%=contadorJ%></label></di><br>
            <di><label>Total Retardos:</label><label><%=contadorR%></label></di><br>
            <di><label>Total  Faltas:</label><label><%=contadorF%></label></di><br>
        </div>
    </center>
</div>
<div style="background: wheat; width: 15%; border-radius: 20px; border-right-width: 1px; padding-left: 28px; display: none;" id="Fechas">
    <div><button class="button" onclick="Mostrar()" ondblclick="Cerrar()">Consulta Personalizada</button></div>
    <div style="margin-top: 20px; "  >
        <label>Selecciona la fecha Inicial</label>
        <input type="date" id="feinicio" style="margin-top: 5px" required="requiered">
        <label style="margin-top: 5px">Selecciona la fecha Final</label>
        <input type="date"  id="fefinal" style="margin-top: 5px;" required="requiered">
        <div><button class="button" onclick="Enviar()" style="margin-left: 50px;">Enviar</button></div>
    </div>

</div>

<jsp:include page="Pie.jsp"/>