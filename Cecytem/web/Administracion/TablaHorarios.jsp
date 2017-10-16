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
<script>
    function borrar(op)
    {

        var idC = op;
        if (idC != 0)
        {
            var opc = "borrargrupo";
            $.ajax({
                type: 'POST',
                url: "Procesaborrar.jsp",
                data: {idC: idC, opcion: opc},
                success: function (respueta) {
                    $("#respuestaborrar").html(respueta);
                }
            });
        }

    }
</script>
<body>


    <div id="wrapper" style="margin: 180px;">
        <div class="row">
            <div class="col-lg-8">
                <h1 class="page-header">Consulta de Horarios</h1>
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
                                        + " and periodoesc.Estado=" + 1 + " and grupos.Carrera=" + idP + " order by Grupo,Turno");
                                if (res != null) {

                                    while (res.next()) {
                                        idC = res.getInt("Id_Grupo");
                                        filas[1] = res.getString("Grupo");
                        %>
                        <h3><%=filas[1]%></h3>
                        <div>
                            <table border="1">
                                <thead> 
      
                                <th>Dia</th>
                                <th>Hora Entrada</th>
                                <th>Hora Salida</th>
                                <th><center>Editar</center></th>
                                </thead>
                                <tbody>
                                    <%
                                        int ver = 0;                                     
                                        if (c.conectar()) {
                                            ResultSet resh = c.consultas("Select * from horarios where Grupo="+idC);
                                            if (resh != null) {
                                                Object[] filash = new Object[5];
                                                while (resh.next()) {
                                                    ver = resh.getInt("Id_Horarios");
                                                    filash[0] = resh.getInt("Id_Horarios");
                                                    filash[1] = resh.getInt("Grupo");
                                                    filash[2] = resh.getString("Dia");
                                                    filash[3] = resh.getString("HoraEntrada");
                                                    filash[4] = resh.getString("HoraSalida");
                                                    String dia = resh.getString("Dia");

                                    %>
                                    <tr> 
                                       
                                        <td><%
                                            if (dia.equals("2")) {
                                                out.println("Lunes");

                                            }
                                            if (dia.equals("3")) {
                                                out.println("Martes");

                                            }
                                            if (dia.equals("4")) {
                                                out.println("Miercoles");

                                            }
                                            if (dia.equals("5")) {
                                                out.println("Jueves");

                                            }
                                            if (dia.equals("6")) {
                                                out.println("Viernes");

                                            }
                                            %>
                                    
                                        <td><%=filash[3]%></td>
                                        <td><%=filash[4]%></td>
                                        <td>
                                <center>
                                    <a href="ActualizarHorarios.jsp?idH=<%=filash[0]%>">
                                        <img src="img/actualizar.jpg" width="30" height="30">
                                    </a>
                                </center>
                                </td>
                                </tr>     
                                <%
                                            }
                                        }
                                    }
idC=0;
                                  
                                %>
                            </tbody>
                            </table>
                        </div>
                        <%}
                                }
                            }
                                       %>
                    </div>
                </div>      
                <%
                            }
                        }
                    }
                    c.desconectar();
                %>

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
            <div id="respuestaborrar"></div>
            </html>

            <!-- jQuery -->
