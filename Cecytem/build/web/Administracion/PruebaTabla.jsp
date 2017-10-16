<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->


<!-- Custom Fonts -->

<link rel="stylesheet" href="vendor/css/jquery-ui.css"
      type="text/css">
<link rel="stylesheet" href="vendor/css/jquery-ui.structure.css"
      type="text/css">
<link rel="stylesheet" href="vendor/css/jquery-ui.theme.css"
      type="text/css">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>

<body>


    <div id="wrapper" style="margin: 180px;">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="page-header">Consulta Historial</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row col-lg-8" >

            <div id="accordion">
                <%
                    int idP = 0;
                    int idC = 0;
                    int carrera = 0;
                    int periodo = 0;
                    conectarBD c = new conectarBD();
                    if (c.conectar()) {

                        Object[] filas1 = new Object[2];
                        int i = 1;

                        ResultSet res1 = c.consultas("Select * from periodoesc");
                        if (res1 != null) {

                            while (res1.next()) {

                                i++;
                                idP = res1.getInt("Id_Periodo");
                                filas1[1] = res1.getString("periodo");
                %>
                <h3><%=filas1[1]%></h3>
                <div> 
                    <script>
                        $(function () {
                            $("#action<%=i%>").accordion({
                                collapsible: true
                            });
                        });
                    </script> 
                    <div  id="action<%=i%>">
                        <%
                            if (c.conectar()) {
                                Object[] filas = new Object[2];
                                ResultSet res = c.consultas("Select * from carrera");
                                if (res != null) {

                                    while (res.next()) {
                                        idC = res.getInt("Id_Carrera");
                                        filas[1] = res.getString("nombreCarrera");
                        %>
                        <h3><%=filas[1]%></h3>
                        <div>
                            <table border="1">
                                <thead> 
                                <th>Grupo</th>
                                <th>Turno</th>
                                <th>Semestre</th>
                                <th><center>Ver Alumnos</center></th>
                                </thead>

                                <tbody>
                                    <%
                                        ResultSet resg = c.consultas("Select * from grupos where Carrera=" + idC);
                                        if (resg != null) {
                                            while (resg.next()) {
                                                carrera = resg.getInt("Carrera");
                                                periodo = resg.getInt("Id_Periodo");
                                                if (idC == carrera & idP == periodo) {

                                                    int contador = 0;

                                                    if (c.conectar()) {
                                                        ResultSet rescg = c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                                                                + " and periodoesc.Id_Periodo = grupos.Id_Periodo and "
                                                                + " carrera.Id_Carrera=" + carrera + " and periodoesc.Id_Periodo=" + periodo+" order by Grupo" );
                                                        if (rescg != null) {
                                                            Object[] filasg = new Object[5];
                                                            while (rescg.next()) {
                                                                filasg[0] = rescg.getInt("Id_Grupo");
                                                                filasg[1] = rescg.getInt("Grupo");
                                                                filasg[2] = rescg.getString("nombreCarrera");
                                                                filasg[3] = rescg.getString("Turno");
                                                                filasg[4] = rescg.getInt("Semestre");
                                                                contador = rescg.getInt("Semestre");
                                    %>
                                    <tr> 
                                        
                                        <td><%=filasg[1]%></td>
                                        <td><%=filasg[3]%></td>
                                        <td><%=filasg[4]%></td>
                                        <td>
                                <center>
                                    <a href="MostrarAlumnosHistorial.jsp?idH=<%=filasg[0]%>&in=1">
                                        <img src="img/Inicio.jpg" width="30" height="30">
                                    </a>
                                </center>
                                </td>


                                </tr>
                                <%
                                                        }

                                                    }

                                                }
                                                carrera = 0;
                                               
                                                idC = 0;
                                            }

                                        }

                                    }


                                %>
                                </tbody>
                            </table>

                        </div>
                        <%                                    }
                                }

                            }
                        %>


                    </div>  
                </div>
                <%
                            }
                        }
                    }
                %>



            </div>   
        </div>

    </div>




</div>

</body>
</html>
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/jquery/jquery-ui.js"></script>
<!-<script src="vendor/jquery/js/jquery-ui.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="vendor/raphael/raphael.min.js"></script>
<script src="vendor/morrisjs/morris.min.js"></script>
<script src="data/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="dist/js/sb-admin-2.js"></script>
<script>
                        $(function () {
                            $("#accordion").accordion({
                                collapsible: true
                            });
                        });
</script>    
<script>
    $(function () {
        $("#action").accordion({
            collapsible: true
        });
    });
</script> 
</html>

<!-- jQuery -->

