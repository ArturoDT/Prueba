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

    <div style="margin: 180px;"></div>
    <div id="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Consulta Alumnos</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row col-lg-12" >

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
                                ResultSet res = c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                                        + " and periodoesc.Id_Periodo = grupos.Id_Periodo "
                                        + " and periodoesc.Estado=" + 1 + " and grupos.Carrera=" + idP + " order by Grupo");
                                if (res != null) {

                                    while (res.next()) {
                                        idC = res.getInt("Id_Grupo");
                                        filas[1] = res.getString("Grupo");
                        %>
                        <h3><%=filas[1]%></h3>
                        <div>
                            <table border="1">
                                <th>Numero control</th>
                                <th>Nombre</th>
                                <th>Apellido Paterno</th>
                                <th>Apellido Materno</th>
                                <th>Telefono</th>
                                <th>Sexo</th>
                                <th>Ver Domicilio</th>
                                <th>Agregar Domicilio</th>
                                <th>Agregar Tutor</th>
                                <th>Datos del tutor</th>
                                <th>Actualizar</th>
                                </thead>

                                <tbody>
                                    <%
                                        if (c.conectar()) {
                                            ResultSet resa = c.consultas("Select * from alumno, grupos, periodoesc where alumno.Id_Grupo=grupos.Id_Grupo and periodoesc.Id_Periodo=grupos.Id_Periodo "
                                                    + " and periodoesc.Estado=" + 1 + " and alumno.Id_Grupo=" + idC);
                                            if (resa != null) {
                                                Object[] filasa = new Object[7];
                                                while (resa.next()) {
                                                    filasa[0] = resa.getInt("Control");
                                                    filasa[1] = resa.getString("Nombre");
                                                    filasa[2] = resa.getString("ApellidoP");
                                                    filasa[3] = resa.getString("ApellidoM");
                                                    filasa[4] = resa.getInt("Id_Domicilio");
                                                    filasa[5] = resa.getString("Sexo");
                                                    filasa[6] = resa.getString("Telefono");


                                    %>
                                    <tr>
                                        <td><%=filasa[0]%></td> 
                                        <td><%=filasa[1]%></td> 
                                        <td><%=filasa[2]%></td> 
                                        <td><%=filasa[3]%></td> 
                                        <td><%=filasa[6]%></td>
                                        <td><%=filasa[5]%></td>
                                        <td><center><a href="MostrarDomicilioA.jsp?id=<%=filasa[4]%>">
                                        <img src="img/buscarD.png" width="40" height="30" style="border-radius: 50px;">
                                    </a></center>
                                </td>
                                <td><center><a href="FormularioDomicilio.jsp?control=<%=filasa[0]%>&opcion=1">
                                        <img src="img/agregarD.png" width="40" height="30" style="border-radius: 50px;">
                                    </a></center>
                                </td>
                                <td><center><a href="FormularioTutores.jsp?control=<%=filasa[0]%>&gr=">
                                        <img src="img/agregarT.png" width="40" height="30" style="border-radius: 50px;">
                                    </a>
                                </center>
                                </td>
                                <td><center><a href="MostrarTutor.jsp?control=<%=filasa[0]%>&opcion=1">
                                        <img src="img/vertutor.jpg" width="40" height="30" style="border-radius: 50px;">
                                    </a>
                                </center>
                                </td>
                                <td><center><a href="MenuActualizacion.jsp?control=<%=filasa[0]%>">
                                        <img src="img/actualizar.jpg" width="40" height="30" style="border-radius: 50px;">
                                    </a>
                                </center>
                                </tr>
                                <%
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
