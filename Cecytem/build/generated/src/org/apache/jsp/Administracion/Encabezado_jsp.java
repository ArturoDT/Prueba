package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Encabezado_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

    String uusarioD = "";
    HttpSession sesionAdmin = request.getSession();
    if (sesionAdmin.getAttribute("sesionAdministrador") == null) {

      out.write("\n");
      out.write("<script>\n");
      out.write("    location.href = \"../Login.jsp\";\n");
      out.write("</script>\n");

    } else {
        uusarioD = (String) sesionAdmin.getAttribute("sesionAdministrador");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--[if lt IE 7]>      <html class=\"no-js lt-ie9 lt-ie8 lt-ie7\"> <![endif]-->\n");
      out.write("<!--[if IE 7]>         <html class=\"no-js lt-ie9 lt-ie8\"> <![endif]-->\n");
      out.write("<!--[if IE 8]>         <html class=\"no-js lt-ie9\"> <![endif]-->\n");
      out.write("<!--[if gt IE 8]><!--> <html class=\"no-js\"> <!--<![endif]-->\n");
      out.write("    <html lang=\"en\">\n");
      out.write("\n");
      out.write("        <head>\n");
      out.write("\n");
      out.write("            <meta charset=\"utf-8\">\n");
      out.write("            <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("            <meta name=\"description\" content=\"\">\n");
      out.write("            <meta name=\"author\" content=\"\">\n");
      out.write("\n");
      out.write("            <title>Pagina Principal</title>\n");
      out.write("\n");
      out.write("            <!-- Bootstrap Core CSS -->\n");
      out.write("            <link href=\"css/bootstrap.css\" rel=\"stylesheet\">\n");
      out.write("            <link href=\"css/tablaCSS/DT_bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"css/tablaCSS/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <!-- Custom CSS -->\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/main.css\">\n");
      out.write("            <link href=\"css/custom.css\" rel=\"stylesheet\">\n");
      out.write("            <link href=\"css/alertify.default.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"css/alertify.core.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <script src=\"//use.edgefonts.net/bebas-neue.js\"></script>\n");
      out.write("            <link href=\"css/cssf/formoid-default-green.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <!-- Custom Fonts & Icons -->\n");
      out.write("            <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,600,800' rel='stylesheet' type='text/css'>\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/icomoon-social.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\n");
      out.write("            <link href=\"css/tablaCSS/DT_bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"css/tablaCSS/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"notificacion/css/css/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"notificacion/css/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <link href=\"css/estilos.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("            <script src=\"js/jsf/formoid-default-green.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"js/jsf/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"js/alertify.js\" type=\"text/javascript\"></script>\n");
      out.write("            <!-- Custom Fonts & Icons -->\n");
      out.write("            <script src=\"js/modernizr-2.6.2-respond-1.1.0.min.js\"></script>\n");
      out.write("            <script src=\"notificacion/js/js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("            <script src=\"notificacion/js/js/jquery-ui.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("        </head>\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    function validarLetras(e) { // 1\n");
      out.write("        tecla = (document.all) ? e.keyCode : e.which;\n");
      out.write("        if (tecla == 8)\n");
      out.write("            return true; // backspace\n");
      out.write("        if (tecla == 32)\n");
      out.write("            return true; // espacio\n");
      out.write("        if (e.ctrlKey && tecla == 86) {\n");
      out.write("            return true;\n");
      out.write("        } //Ctrl v\n");
      out.write("        if (e.ctrlKey && tecla == 67) {\n");
      out.write("            return true;\n");
      out.write("        } //Ctrl c\n");
      out.write("        if (e.ctrlKey && tecla == 88) {\n");
      out.write("            return true;\n");
      out.write("        } //Ctrl x\n");
      out.write("\n");
      out.write("        patron = /[a-zA-Z]/; //patron\n");
      out.write("\n");
      out.write("        te = String.fromCharCode(tecla);\n");
      out.write("        return patron.test(te);\n");
      out.write("        // prueba de patron\n");
      out.write("    }\n");
      out.write("    </script>\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        function validarNumeros(e) { // 1\n");
      out.write("            tecla = (document.all) ? e.keyCode : e.which;\n");
      out.write("            if (tecla == 8)\n");
      out.write("                return true; // backspace\n");
      out.write("            if (tecla == 32)\n");
      out.write("                return false; // espacio\n");
      out.write("            if (e.ctrlKey && tecla == 86) {\n");
      out.write("                return true;\n");
      out.write("            } //Ctrl v\n");
      out.write("            if (e.ctrlKey && tecla == 67) {\n");
      out.write("                return true;\n");
      out.write("            } //Ctrl c\n");
      out.write("            if (e.ctrlKey && tecla == 88) {\n");
      out.write("                return true;\n");
      out.write("            } //Ctrl x\n");
      out.write("\n");
      out.write("            patron = /[0-9]/; //patron\n");
      out.write("\n");
      out.write("            te = String.fromCharCode(tecla);\n");
      out.write("            return patron.test(te); // prueba de patron\n");
      out.write("\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("    <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\"></script>\n");
      out.write("    <script>window.jQuery || document.write('<script src=\"js/jquery-1.9.1.min.js\"><\\/script>')</script>\n");
      out.write("    <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("    <a href=\"js/tablaJS/config_datatable_api.js\"></a>\n");
      out.write("    <script src=\"js/tablaJS/jquery.dataTables.js\" type=\"text/javascript\"></script>\n");
      out.write("    <!-- Scrolling Nav JavaScript -->\n");
      out.write("    <script src=\"js/jquery.easing.min.js\"></script>\n");
      out.write("    <script src=\"js/scrolling-nav.js\"></script>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <!--[if lt IE 7]>\n");
      out.write("            <p class=\"chromeframe\">You are using an <strong>outdated</strong> browser. Please <a href=\"http://browsehappy.com/\">upgrade your browser</a> or <a href=\"http://www.google.com/chromeframe/?redirect=true\">activate Google Chrome Frame</a> to improve your experience.</p>\n");
      out.write("        <![endif]-->\n");
      out.write("\n");
      out.write("\n");
      out.write("        <header class=\"navbar navbar-inverse navbar-fixed-top\" role=\"banner\" style=\"color: #ffffff\">\n");
      out.write("            <h4><img src=\"img/descarga (3)_1.jpg\" width=\"60\" height=\"72\" style=\"position: fixed\"></h4>    \n");
      out.write("            <center><h4 style=\"color: #ffffff\"> Colegio de Estudios Cientificos y Tecnologicos del Estado de Mexico  \n");
      out.write("                    <strong style=\"color:  #000000\">.................................</strong>Bienvenido_");
      out.print(uusarioD);
      out.write("</h4><center>\n");
      out.write("                    <hr>\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"navbar-header\">\n");
      out.write("                            <button type=\"button\" class=\"navbar-toggle\" data-toggle=\"collapse\" data-target=\".navbar-collapse\">\n");
      out.write("                                <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                                <span class=\"icon-bar\"></span>\n");
      out.write("                            </button>\n");
      out.write("                            <a class=\"navbar-brand\">Plantel San Jóse del Rincón</a>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"collapse navbar-collapse\">\n");
      out.write("                            <ul class=\"nav navbar-nav navbar-right\">\n");
      out.write("                                <li class=\"active\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Registro<i class=\"icon-angle-down\"></i></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        <li><a href=\"FormularioAlumno.jsp\">Alumnos</a></li>\n");
      out.write("                                        <li><a href=\"Verificador.jsp\">Asistencia</a></li>\n");
      out.write("                                        <li><a href=\"FormularioCarrera.jsp\">Carrera</a></li>\n");
      out.write("                                        <li><a href=\"FormularioCicloPerido.jsp\">Ciclo-Periodo</a></li>\n");
      out.write("                                        <li><a href=\"CicloPeriodo.jsp\">Grupos</a></li>\n");
      out.write("                                        <li><a href=\"FormularioHorarios.jsp\">Horarios</a></li>\n");
      out.write("                                        <li><a href=\"FormularioPersonal.jsp\">Personal</a></li>\n");
      out.write("                                        <li><a href=\"VerificadorSalida.jsp\">Salida</a></li>   \n");
      out.write("                                    </ul>\n");
      out.write("                                </li>\n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Mostrar<i class=\"icon-angle-down\"></i></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        <li><a href=\"MenuGrupos.jsp\">Alumnos</a></li>\n");
      out.write("                                        <li><a href=\"MenuAsistencia.jsp\">Asistencia</a></li>\n");
      out.write("                                        <li><a href=\"MostrarCarrera.jsp\">Carrera</a></li>\n");
      out.write("                                        <li><a href=\"MostrarCicloPeriodo.jsp\">Ciclo-Periodo</a></li>\n");
      out.write("                                        <li><a href=\"MostrarGruposCarreras.jsp\">Grupos</a></li>\n");
      out.write("                                        <li><a href=\"MenuHorarios.jsp\">Horarios</a></li>\n");
      out.write("                                        <li><a href=\"MenuHistorial.jsp\">Historial</a></li>\n");
      out.write("                                        <li><a href=\"MostrarPersonal.jsp\">Personal</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </li> \n");
      out.write("                                <li class=\"dropdown\">\n");
      out.write("                                    <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">Asignar<i class=\"icon-angle-down\"></i></a>\n");
      out.write("                                    <ul class=\"dropdown-menu\">\n");
      out.write("                                        <li><a href=\"MostrarGrupos.jsp\">Grupo-Carrera</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                </li> \n");
      out.write("                                <li><a href=\"CerrarSesion.jsp\">Cerrar_Sesion</a></li>\n");
      out.write("                            </ul>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    </header><!--/header-->\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
