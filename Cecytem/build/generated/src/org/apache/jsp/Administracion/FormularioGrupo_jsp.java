package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioGrupo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write('\n');



      out.write("\n");
      out.write("<script>\n");
      out.write("    function asignar()\n");
      out.write("    {\n");
      out.write("        var idG = op;\n");
      out.write("        var carrera = $(\"#carrera\").val();\n");
      out.write("        var turno = $(\"#turno\").val();\n");
      out.write("        if (carrera == \"\" || turno == \"\")\n");
      out.write("        {\n");
      out.write("            alertify.error(\"Es necesario seleccionar Carrera y Turno\");\n");
      out.write("        } else\n");
      out.write("            alert(\"si funciono\" + idG + carrera + turno);\n");
      out.write("        {\n");
      out.write("            $.ajax({\n");
      out.write("                type: 'POST',\n");
      out.write("                url: \"ProcesaModicaGrupos.jsp\",\n");
      out.write("                data: {idG: idG, idC: carrera, turno: turno},\n");
      out.write("                success: function (respueta) {\n");
      out.write("                    $(\"#respuestaAsg\").html(respueta);\n");
      out.write("                }\n");
      out.write("            });\n");
      out.write("        }\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("</script>\n");
    conectarBD c = new conectarBD();

      out.write("\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;\n");
      out.write("      font-size:14px;font-family:'Open Sans','Helvetica Neue',\n");
      out.write("      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; \n");
      out.write("      margin: 170px; padding-left: 120px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\"><h2>Editar Carrera-Grupo</h2>\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <table border=\"7\" width=\"4\" cellspacing=\"4\" cellpadding=\"4\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>Grupos</th>\n");
      out.write("                        <th>Carrera</th>\n");
      out.write("                        <th>Turnos</th>\n");
      out.write("                        <th>Guardar</th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("\n");
      out.write("                        <td><input type=\"number\" requiered=\"requiered\" id=\"grupo\"></td>\n");
      out.write("                        <td>\n");
      out.write("\n");
      out.write("                             <div class=\"\">\n");
      out.write("                                <label class=\"title\">Selecciona la Carrera\n");
      out.write("                                    <span class=\"required\">*\n");
      out.write("                                    </span>\n");
      out.write("                                </label>\n");
      out.write("                                <div class=\"null\">\n");
      out.write("                                    <span>\n");
      out.write("                                        <select required=\"required\" style=\"width: 250px\" id=\"carrera\">\n");
      out.write("                                            <option value=\"\">Carreras</option>\n");
      out.write("                                            ");

                                                if (c.conectar()) {
                                                    Object[] filas1=new Object[2];
                                                    ResultSet res2 = c.consultas("Select * from carrera");
                                                    if (res2 != null) {

                                                        while (res2.next()) {
                                                            filas1[0] = res2.getInt("Id_Carrera");
                                                            filas1[1] = res2.getString("nombreCarrera");
                                            
      out.write("\n");
      out.write("                                            <option value=\"");
      out.print(filas1[0]);
      out.write('"');
      out.write('>');
      out.print(filas1[1]);
      out.write("</option>\n");
      out.write("                                            ");

                                                        }
                                                    }
                                                }
                                            
      out.write("\n");
      out.write("                                        </select><i></i></span></div></div>\n");
      out.write("                        </td>\n");
      out.write("                        <td>\n");
      out.write("                            <div class=\"\">\n");
      out.write("                                <label class=\"title\">Selecciona el nuevo Turno\n");
      out.write("                                    <span class=\"required\">*\n");
      out.write("                                    </span>\n");
      out.write("                                </label>\n");
      out.write("\n");
      out.write("                                <div class=\"null\">\n");
      out.write("                                    <span>\n");
      out.write("                                        <select id=\"turno\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                                            <option value=\"\">Turnos</option>  \n");
      out.write("                                            <option value=\"Matutino\">Matutino</option>  \n");
      out.write("                                            <option value=\"Vespertino\">Vespertino</option>\n");
      out.write("                                        </select><i></i></span></div></div>\n");
      out.write("                        </td>\n");
      out.write("                        <td><div class=\"submit\"><input type=\"button\" value=\"Enviar\" onclick=\"asignar()\"/></div></div></td>\n");
      out.write("\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("\n");
      out.write("        </div>   \n");
      out.write("</form>\n");
      out.write("<div id=\"respuestaAsg\" style=\"margin: 180px; \n");
      out.write("     padding-left: 250; \n");
      out.write("     background: #31708f;max-width: \n");
      out.write("     600px; width: auto; border-radius: 50px;\"></div>\n");
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
