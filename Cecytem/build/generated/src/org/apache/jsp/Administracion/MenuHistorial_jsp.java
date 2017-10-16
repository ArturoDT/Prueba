package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MenuHistorial_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Encabezado.jsp", out, false);
      out.write("\n");
      out.write("<script>\n");
      out.write("    function Mostrar(op)\n");
      out.write("    {\n");
      out.write("        var opciones = op.value;\n");
      out.write("        if (opciones == 1)\n");
      out.write("        {\n");
      out.write("            var divMostrar = document.getElementById(\"menuAlumnos\");\n");
      out.write("            divMostrar.style.display = \"block\";\n");
      out.write("            var divMostrar = document.getElementById(\"menu\");\n");
      out.write("            divMostrar.style.display = \"none\";\n");
      out.write("        }\n");
      out.write("         if (opciones == 2)\n");
      out.write("        {\n");
      out.write("            var divMostrar = document.getElementById(\"menuAsistencia\");\n");
      out.write("            divMostrar.style.display = \"block\";\n");
      out.write("            var divMostrar = document.getElementById(\"menu\");\n");
      out.write("            divMostrar.style.display = \"none\";\n");
      out.write("            var divMostrar = document.getElementById(\"menuAlumnos\");\n");
      out.write("            divMostrar.style.display = \"none\";\n");
      out.write("        }\n");
      out.write("    }\n");
      out.write("    function Cancelar()\n");
      out.write("    {\n");
      out.write("      location.href=\"MenuHistorial.jsp\";     \n");
      out.write("    }\n");
      out.write("    function Enviar()\n");
      out.write("    {\n");
      out.write("       \n");
      out.write("        var idCa = $(\"#carrera\").val();\n");
      out.write("        var idP = $(\"#periodos\").val();\n");
      out.write("        if(idCa==\"\" || idP ==\"\")\n");
      out.write("        {\n");
      out.write("            \n");
      out.write("            alertify.error(\"Es necesario elegir el Ciclo, el Periodo y Carrera \");\n");
      out.write("        } else\n");
      out.write("        {\n");
      out.write("           location.href=\"MostrarGruposHistorialAlumnos.jsp?idCa=\"+idCa+\"&idP=\"+idP;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("    }\n");
      out.write("     function EnviarA()\n");
      out.write("    {\n");
      out.write("       \n");
      out.write("        var idCa = $(\"#carreraA\").val();\n");
      out.write("        var idP = $(\"#periodosA\").val();\n");
      out.write("        if(idCa==\"\" || idP ==\"\")\n");
      out.write("        {\n");
      out.write("        \n");
      out.write("            alertify.error(\"Es necesario elegir el Ciclo, el Periodo y Carrera \");\n");
      out.write("        }else\n");
      out.write("        {\n");
      out.write("            \n");
      out.write("         \n");
      out.write("            location.href=\"MostrarGruposAsistencia.jsp?idCa=\"+idCa+\"&idP=\"+idP;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("<center>\n");
      out.write("    <form method=\"GET\" action=\"#\" style=\" margin: 180px; padding-left: 20px; max-width:1480px;\">\n");
      out.write("        <div id=\"menu\">\n");
      out.write("            <ul class=\"nav-tabs accordion-inner alert\" style=\"position: fixed; background:  #049cdb; width: max-content\"  >\n");
      out.write("                <li class=\"active\"><a href=\"#\">Consulta de Historial</a></li>\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("\n");
      out.write("                    <select id=\"historial\" style=\"width: 250px\" onchange=\"Mostrar(this)\" required=\"requiered\">\n");
      out.write("                        <option value=\"\">Opciones</option>\n");
      out.write("                        <option value=\"1\">Alumnos</option>\n");
      out.write("                        <option value=\"2\">Asistencia</option>\n");
      out.write("                    </select>\n");
      out.write("                </li>\n");
      out.write("                <br>    \n");
      out.write("                <input type=\"submit\" value=\"Enviar\" class=\"btn-blue\">  \n");
      out.write("            </ul></div>\n");
      out.write("\n");
      out.write("        <div id=\"menuAlumnos\" style=\"display: none\">\n");
      out.write("            <ul class=\"nav-tabs accordion-inner alert\" style=\"position: fixed; background:  #049cdb; width: max-content\"  >\n");
      out.write("                <li class=\"active\"><a href=\"#\">Consulta Historial Alumnos</a></li>\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("      \n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <label class=\"title\">Selecciona un Periodo\n");
      out.write("                            <span class=\"required\">*\n");
      out.write("                            </span>\n");
      out.write("                        </label>\n");
      out.write("\n");
      out.write("                        <div class=\"null\">\n");
      out.write("                            <span>\n");
      out.write("                                <select id=\"periodos\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                                    <option value=\"\">Periodos</option>\n");
      out.write("                                    ");

                                        conectarBD c = new conectarBD();
                                        if (c.conectar()) {
                                          
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from periodoesc");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Periodo");
                                                    filas1[1] = res1.getString("periodo");
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(filas1[0]);
      out.write('"');
      out.write('>');
      out.print(filas1[1]);
      out.write("</option>\n");
      out.write("                                    ");

                                                }
                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </select><i></i></span></div></div>\n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <label class=\"title\">Selecciona la Carrera\n");
      out.write("                            <span class=\"required\">*\n");
      out.write("                            </span>\n");
      out.write("                        </label>\n");
      out.write("                        <div class=\"null\">\n");
      out.write("                            <span>\n");
      out.write("                                <select required=\"required\" style=\"width: 250px\" id=\"carrera\">\n");
      out.write("                                    <option value=\"\">Carreras</option>\n");
      out.write("                                    ");

                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from carrera");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Carrera");
                                                    filas1[1] = res1.getString("nombreCarrera");
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(filas1[0]);
      out.write('"');
      out.write('>');
      out.print(filas1[1]);
      out.write("</option>\n");
      out.write("                                    ");

                                                }
                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </select></span></div></div>\n");
      out.write("                </li>\n");
      out.write("                <br>      \n");
      out.write("                <input type=\"submit\" value=\"Enviar\" class=\"btn-blue\" onclick=\"Enviar()\"> \n");
      out.write("                <input type=\"button\" value=\"Cancelar\" class=\"btn-blue\" onclick=\"Cancelar()\"> \n");
      out.write("            </ul></div>\n");
      out.write("\n");
      out.write("        <div id=\"menuAsistencia\" style=\"display: none\">\n");
      out.write("            <ul class=\"nav-tabs accordion-inner alert\" style=\"position: fixed; background:  #049cdb; width: max-content\"  >\n");
      out.write("                <li class=\"active\"><a href=\"#\">Consulta Historial Asistencia</a></li>\n");
      out.write("                <li class=\"dropdown\">\n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <label class=\"title\">Selecciona un Periodo\n");
      out.write("                            <span class=\"required\">*\n");
      out.write("                            </span>\n");
      out.write("                        </label>\n");
      out.write("\n");
      out.write("                        <div class=\"null\">\n");
      out.write("                            <span>\n");
      out.write("                                <select id=\"periodosA\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                                    <option value=\"\">Periodos</option>\n");
      out.write("                                    ");

                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from periodoesc");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Periodo");
                                                    filas1[1] = res1.getString("periodo");
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(filas1[0]);
      out.write('"');
      out.write('>');
      out.print(filas1[1]);
      out.write("</option>\n");
      out.write("                                    ");

                                                }
                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </select><i></i></span></div></div>\n");
      out.write("                    <div class=\"\">\n");
      out.write("                        <label class=\"title\">Selecciona la Carrera\n");
      out.write("                            <span class=\"required\">*\n");
      out.write("                            </span>\n");
      out.write("                        </label>\n");
      out.write("                        <div class=\"null\">\n");
      out.write("                            <span>\n");
      out.write("                                <select required=\"required\" style=\"width: 250px\" id=\"carreraA\">\n");
      out.write("                                    <option value=\"\">Carreras</option>\n");
      out.write("                                    ");

                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from carrera");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Carrera");
                                                    filas1[1] = res1.getString("nombreCarrera");
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(filas1[0]);
      out.write('"');
      out.write('>');
      out.print(filas1[1]);
      out.write("</option>\n");
      out.write("                                    ");

                                                }
                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </select><i></i></span></div></div>\n");
      out.write("                             \n");
      out.write("                </li>\n");
      out.write("                <br>\n");
      out.write("                <input type=\"submit\" value=\"Enviar\" class=\"btn-blue\" onclick=\"EnviarA()\">  \n");
      out.write("                <input type=\"button\" value=\"Cancelar\" class=\"btn-blue\" onclick=\"Cancelar()\"> \n");
      out.write("            </ul></div>\n");
      out.write("\n");
      out.write("    </form>\n");
      out.write("</center>\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pie_1.jsp", out, false);
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
