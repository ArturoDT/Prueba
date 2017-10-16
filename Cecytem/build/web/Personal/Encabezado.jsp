<%@page session="true" %>
<%
    String uusarioD = "";
    HttpSession sesionAdmin = request.getSession();
    if (sesionAdmin.getAttribute("sesionPersonal") == null) {
%>
<script>
    location.href = "../Login.jsp";
</script>
<%
    } else {
        uusarioD = (String) sesionAdmin.getAttribute("sesionPersonal");
    }
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <html lang="en">

        <head>

            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">

            <title>Pagina Principal</title>

            <!-- Bootstrap Core CSS -->
            <link href="css/bootstrap.css" rel="stylesheet">
            <link href="css/tablaCSS/DT_bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="css/tablaCSS/bootstrap.css" rel="stylesheet" type="text/css"/>
            <!-- Custom CSS -->
            <link rel="stylesheet" href="css/main.css">
            <link href="css/custom.css" rel="stylesheet">
            <link href="css/alertify.default.css" rel="stylesheet" type="text/css"/>
            <link href="css/alertify.core.css" rel="stylesheet" type="text/css"/>
            <script src="//use.edgefonts.net/bebas-neue.js"></script>
            <link href="css/cssf/formoid-default-green.css" rel="stylesheet" type="text/css"/>
            <!-- Custom Fonts & Icons -->
            <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>
            <link rel="stylesheet" href="css/icomoon-social.css">
            <link rel="stylesheet" href="css/font-awesome.min.css">
            <link href="css/tablaCSS/DT_bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="css/tablaCSS/bootstrap.css" rel="stylesheet" type="text/css"/>
            <link href="notificacion/css/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
            <link href="notificacion/css/css/style.css" rel="stylesheet" type="text/css"/>
            <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
            <script src="js/jsf/formoid-default-green.js" type="text/javascript"></script>
            <script src="js/jsf/jquery.min.js" type="text/javascript"></script>
            <script src="js/alertify.js" type="text/javascript"></script>
            <!-- Custom Fonts & Icons -->
            <script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
            <script src="notificacion/js/js/jquery-1.12.4.js" type="text/javascript"></script>
            <script src="notificacion/js/js/jquery-ui.js" type="text/javascript"></script>
            
        </head>
       </script>
        
    <script type="text/javascript">
        

      function validarLetras(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true; // backspace
        if (tecla==32) return true; // espacio
        if (e.ctrlKey && tecla==86) { return true;} //Ctrl v
        if (e.ctrlKey && tecla==67) { return true;} //Ctrl c
        if (e.ctrlKey && tecla==88) { return true;} //Ctrl x
     
        patron = /[a-zA-Z]/; //patron
     
        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
      }
    </script>
<script type="text/javascript">
      function validarNumeros(e) { // 1
        tecla = (document.all) ? e.keyCode : e.which;
        if (tecla==8) return true; // backspace
        if (tecla==32) return false; // espacio
        if (e.ctrlKey && tecla==86) { return true;} //Ctrl v
        if (e.ctrlKey && tecla==67) { return true;} //Ctrl c
        if (e.ctrlKey && tecla==88) { return true;} //Ctrl x
     
        patron = /[0-9]/; //patron
      
        te = String.fromCharCode(tecla);
        return patron.test(te); // prueba de patron
       
      }
    </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/jquery-1.9.1.min.js"><\/script>')</script>
        <script src="js/bootstrap.min.js"></script>
        <a href="js/tablaJS/config_datatable_api.js"></a>
        <script src="js/tablaJS/jquery.dataTables.js" type="text/javascript"></script>
        <!-- Scrolling Nav JavaScript -->
        <script src="js/jquery.easing.min.js"></script>
        <script src="js/scrolling-nav.js"></script>
         
        <body>
            <!--[if lt IE 7]>
                <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
            <![endif]-->


            <header class="navbar navbar-inverse navbar-fixed-top" role="banner" style="color: #ffffff">
                <h4><img src="img/descarga (3)_1.jpg" width="60" height="72" style="position: fixed"></h4>    
                <center><h4 style="color: #ffffff"> Colegio de Estudios Cientificos y Tecnologicos del Estado de Mexico  
                        <strong style="color:  #000000">.................................</strong>Bienvenido_<%=uusarioD%></h4><center>
                        <hr>
                        <div class="container">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="navbar-brand">Plantel San Jóse del Rincón</a>
                            </div>

                            <div class="collapse navbar-collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active"><a href="index.jsp">Home</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Registro<i class="icon-angle-down"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="FormularioAlumno.jsp">Alumnos</a></li>
                                            <li><a href="FormularioHorarios.jsp">Horarios</a></li>
                                            <li><a href="Verificador.jsp">Asistencia</a></li>
                                            <li><a href="VerificadorSalida.jsp">Salida</a></li>
                        
                                            
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mostrar<i class="icon-angle-down"></i></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="MenuGrupos.jsp">Alumnos</a></li>
                                            <li><a href="MenuAsistencia.jsp">Asistencia</a></li>
                                            <li><a href="MenuHorarios.jsp">Horarios</a></li>
                                           
                                            <li><a href="MenuHistorial.jsp">Historial</a></li>
                                        </ul>
                                    </li> 
                                    <li><a href="CerrarSesion.jsp">Cerrar_Sesion</a></li>
                                </ul>
                            </div>
                        </div>
                        </header><!--/header-->

