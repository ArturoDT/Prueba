<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Bootstrap Admin Theme</title>
        <?php include 'inc/parte_css.php'; ?>

    </head>

    <body>

        <div id="wrapper">
            <?php include 'inc/barracomun.php'; ?>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Alumnos --- Modificar datos</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <div class="row">
                    <!--Aqui empieza cuerpo del programa-->
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Actualiza tus datos
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <?php
                                        require_once './conectarlogin.php';
                                        require_once './conectarbd.php';
                                        //Buscar el alumno del cual se cambiaran los datos
                                        if (!isset($_GET['idalumno'])) {
                                            echo "Error, no envio todos los parametros <br>";
                                            echo "<a href='alumnosmostrar.php'>Regresar</a>";
                                            exit();
                                        }
                                        $idalumno = $_GET['idalumno'];
                                        $sqlBuscarAlumno = "select * from alumnos, carreraPlan " .
                                                " where Alumnos.idCarrera=CarreraPlan.idCarrera and " .
                                                " idAlumno=" . $idalumno;
                                        $resultBuscarAlumno = $conn->query($sqlBuscarAlumno);
                                        if (!$resultBuscarAlumno) {
                                            echo "Error al buscar alumno" . $conn->error . "<br>";
                                            exit();
                                        }
                                        while ($rowBuscarAlumno = $resultBuscarAlumno->fetch_array
                                        (MYSQLI_ASSOC)) {
                                            ?>
                                            <form action="alumnoscapturamodificarguardar.php"
                                                  method="get" name="form1" id="form1">
                                                <p>
                                                    <label for="cuenta">No. de Cuenta</label>
                                                    <input type="text" name="cuenta" id="cuenta"
                                                           value="<?php echo $rowBuscarAlumno['noCuenta']; ?>" class="form-control">
                                                </p>
                                                <p>
                                                    <label for="nombre">Nombre</label>
                                                    <input type="text" name="nombre" id="nombre"
                                                           placeholder="Apellido Paterno, Materno, Nombres"
                                                           value="<?php echo $rowBuscarAlumno['nombreAlumno']; ?>" class="form-control">
                                                </p>
                                                <?php
                                                //Buscar las carreras
                                                $sqlBuscarCarrera = "select * from carreraplan";
                                                $resultBuscar = $conn->query($sqlBuscarCarrera);
                                                if (!$resultBuscar) {
                                                    echo "Error al buscar carrera" . $conn->error . "<br>";
                                                    exit();
                                                }
                                                ?>
                                                <p>
                                                    <label for="idcarrera">Escoge tu carrera</label>
                                                    <select id="idcarrera" name="idcarrera" class="form-control">
                                                        <option value="<?php echo $rowBuscarAlumno['idCarrera']; ?>">
                                                            <?php echo $rowBuscarAlumno['nombreCarrera']; ?>
                                                        </option>
                                                        <?php
                                                        while ($rowBuscar = $resultBuscar->fetch_array
                                                        (MYSQLI_ASSOC)) {
                                                            ?>
                                                            <option value="<?php echo $rowBuscar['idCarrera']; ?>">
                                                                <?php echo $rowBuscar['nombreCarrera']; ?>
                                                            </option>
                                                            <?php
                                                        }
                                                    }
                                                    ?>
                                                </select>
                                            </p>
                                            <p>
                                                <input type="hidden" name="idalumno" id="idalumno"
                                                       value="<?php echo $idalumno; ?>" >
                                            </p>

                                            <p>
                                                <input type="submit" name="submit" id="submit" value="Enviar" class="btn btn-success">
                                                <input type="reset" name="reset" id="reset" value="Limpiar" class="btn btn-danger">
                                            </p>
                                        </form>
                                        <!--Aqui finaliza cuerpo del programa-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->


        <?php include 'inc/parte_js.php'; ?>
    </body>

</html>
