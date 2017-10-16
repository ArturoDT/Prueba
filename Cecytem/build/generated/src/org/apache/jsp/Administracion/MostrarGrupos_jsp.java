package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarGrupos_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;\n");
      out.write("      font-size:14px;font-family:'Open Sans','Helvetica Neue',\n");
      out.write("      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; \n");
      out.write("      margin: 180px; padding-left: 5px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Alta de Grupos</h2></div>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Selecciona un Semestre\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"semestre\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                    <option value=\"\">Semestres</option>\n");
      out.write("                    <option value=\"1\">1°</option>\n");
      out.write("                    <option value=\"2\">2°</option>\n");
      out.write("                    <option value=\"3\">3°</option>\n");
      out.write("                    <option value=\"4\">4°</option>\n");
      out.write("                    <option value=\"5\">5°</option>\n");
      out.write("                    <option value=\"6\">6°</option>\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("\n");
      out.write("<div id=\"respuesta\"> </div>\n");

    if (request.getParameter("semestre") != null) {
        conectarBD c = new conectarBD();
        if (c.conectar()) {
            int ver = 0;
            int se = Integer.parseInt(request.getParameter("semestre"));
            ResultSet resS = c.consultas("Select Semestre from grupos where Semestre=" + se);
            if (resS != null) {
                while (resS.next()) {
                    ver = resS.getInt("Semestre");
                }
            }
            if (ver > 0) {

      out.write("\n");
      out.write("<script>\n");
      out.write("    location.href = \"procesa.jsp?n=");
      out.print(se);
      out.write("\";\n");
      out.write("</script>\n");

} else {

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"No sean agregado grupos al semestre\");\n");
      out.write("\n");
      out.write("    function redireccionando()\n");
      out.write("    {\n");
      out.write("        location.href = \"CicloPeriodo.jsp\";\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    setTimeout(\"redireccionando()\", 3000);\n");
      out.write("</script>\n");

            }

        }
    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pie_1.jsp", out, false);
      out.write('\n');
      out.write('\n');
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
