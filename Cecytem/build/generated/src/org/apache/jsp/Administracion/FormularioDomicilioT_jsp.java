package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioDomicilioT_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    int idT = Integer.parseInt(request.getParameter("id"));
    out.println(idT);

      out.write("\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Registro de domicilio del Tutor</h2></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Calle\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input  type=\"text\" name=\"calle\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">No_Exterior\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input  type=\"text\" name=\"ne\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Colonia\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"colonia\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Localidad\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"localidad\" required=\"required\"style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Municipio\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"municipio\" required=\"required\" value=\"\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Codigo postal\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"number\" name=\"codpos\" required=\"required\" value=\"\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("\n");

    if (request.getParameter("calle") != null) {
        String calle = request.getParameter("calle");
        String ne = request.getParameter("ne");
        String colonia = request.getParameter("colonia");
        String localidad = request.getParameter("localidad");
        String municipio = request.getParameter("municipio");
        String codpos = request.getParameter("codpos");

        conectarBD c = new conectarBD();
        if (c.conectar()) {
            out.println("Conectado");
            if (c.ejecutaSQL("Insert into domiciliotutor values(null,'" + calle + "','" + ne + "','" + colonia + "','" + localidad + "','" + municipio + "','" + codpos + "')")) {
                ResultSet res = c.consultas("SELECT MAX(Id_Domicilio) AS id FROM domiciliotutor");
                if (res != null) {
                    int id = 0;
                    int control = 0;
                    while (res.next()) {
                        id = res.getInt("id");
                    }
                    if (c.ejecutaSQL("Update tutores set Id_Domicilio='" + id + "' where Id_Tutores=" + idT)) {
                        ResultSet rescontrol = c.consultas("Select Control from alumno join tutores on alumno.Id_Tutor=tutores.Id_Tutores and"
                                + " tutores.Id_Domicilio=" + id + " where tutores.Id_Tutores=" + idT);
                        if (rescontrol != null) {
                            while (rescontrol.next()) {
                                control = rescontrol.getInt("Control");
                            }
                        }

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.success(\"Registro Generado OK :)\");\n");
      out.write("    location.href = \"MostrarTutor.jsp?control=");
      out.print(control);
      out.write("\";\n");
      out.write("</script>\n");
      out.write("\n");

} else {

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"Error al registrar :(\");\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");

                    }
                } else {

                }
            }
        }
    }

      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pie.jsp", out, false);
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
