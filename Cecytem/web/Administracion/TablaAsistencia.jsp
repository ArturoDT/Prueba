<%@page import="java.sql.Time"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
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
    <div id="wrapper" style="margin: 180px;" >
        <div class="row">
            <div class="col-lg-8">
                <h1 class="page-header">Consulta Asistencias</h1>
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

                        ResultSet res1 = c.consultas("Select * from carrera");
                        if (res1 != null) {

                            while (res1.next()) {

                                i++;
                                idP = res1.getInt("Id_Carrera");
                                filas1[1] = res1.getString("nombreCarrera");
                %>
                <h3><%=filas1[1]%></h3>
                <div> 
                    <table border="1">
                        <thead>
                        <th><center>Grupos</center></th>
                        <th>Ver Asistencia</th>
                        </thead>
                        <tbody>
                            <%
                                if (c.conectar()) {
                                    Object[] filas = new Object[2];
                                    ResultSet res = c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                                            + " and periodoesc.Id_Periodo = grupos.Id_Periodo "
                                            + " and periodoesc.Estado=" + 1 + " and grupos.Carrera=" + idP + " order by Grupo");
                                    if (res != null) {

                                        while (res.next()) {
                                            idC = res.getInt("Id_Grupo");
                                            filas[1] = res.getString("Grupo");
                            %>


                            <tr>
                                <td>
                        <center><h3><%=filas[1]%></h3><center>
                                </td>
                                <td>
                                <center><a href="MostrarAsistencia.jsp?gr=<%=idC%>">    
                                        <img src="img/asistencia.png" width="30" height="30"></a><center>
                                        </td>
                                        </tr>



                                        <%                                    }
                                                }

                                            }
                                            c.desconectar();
                                        %>
                                        </tbody>
                                        </table>
                                        </div>  

                                        <%
                                                    }
                                                }
                                            }
                                            c.desconectar();
                                        %>

                                        </div>

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

