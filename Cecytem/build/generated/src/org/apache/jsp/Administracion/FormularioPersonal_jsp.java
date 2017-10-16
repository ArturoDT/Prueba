package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioPersonal_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("</script>\n");
      out.write("\n");
      out.write(" \n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Resgistro de Personal Administrativo</h2></div>\n");
      out.write("     <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Cedula\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("         <input class=\"null\" type=\"number\" name=\"cedula\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Nombre\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"nombre\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Apellidos Paterno\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"apellidoP\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Apellidos Materno\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"apellidoM\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Profesion\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"profesion\" required=\"required\" value=\"\" style=\"width: 250px\"/>\n");
      out.write("    </div>\n");
      out.write("     <div class=\"\">\n");
      out.write("        <label class=\"title\">Puesto\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"puesto\" required=\"required\" value=\"\" style=\"width: 250px\">\n");
      out.write("    </div>\n");
      out.write("      <div class=\"\">\n");
      out.write("        <label class=\"title\">Telefono\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("          <input class=\"null\" type=\"number\" name=\"telefono\" required=\"required\" value=\"\" style=\"width: 250px\">\n");
      out.write("    </div>\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("<!-- Stop Formoid form-->\n");

    if (request.getParameter("cedula") != null) {
        conectarBD nBD = new conectarBD();
        if (nBD.conectar()) {
            int vc = 0;
            int cedula = Integer.parseInt(request.getParameter("cedula"));
            String n = request.getParameter("nombre");
            String ap = request.getParameter("apellidoP");
            String am = request.getParameter("apellidoM");
            String pr = request.getParameter("profesion");
            String p = request.getParameter("puesto");
            String t = request.getParameter("telefono");
            
           
            ResultSet res = nBD.consultas("Select * from personal where Cedula=" + cedula);
            if (res != null) {
                while (res.next()) {
                    vc = res.getInt("Cedula");
                }
                if (vc == 0) {

                    if (nBD.ejecutaSQL("Insert into personal values('" + cedula + "','" + n +"','" + ap + "','" + am + "','" + pr + "','" + p + "','"+t+"'," + 0 + ")")) {


      out.write("\n");
      out.write("<script>\n");
      out.write("                    alertify.success(\"Registro Generado OK :)\");\n");
      out.write("\n");
      out.write("                    location.href = \"FormularioDomicilioP.jsp?cedula=");
      out.print(cedula);
      out.write("\";\n");
      out.write("</script>\n");
      out.write("\n");
    } else {

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"Registro no Generado Erroor¡ :)\");\n");
      out.write("</script>\n");
      out.write("\n");

    }

} else {

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.confirm(\"No se puede realizar el registro por que La Cedula Profesional ya se encuentra registrada\\n\\\n");
      out.write("                    Intenta asignar un diferente numero por favor\");\n");
      out.write("</script>\n");

                }
            }

        }
    } else {
    }

      out.write('\n');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pie.jsp", out, false);
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
