package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioAlumno_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("</script>\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:250px;\n");
      out.write("      margin: 170px; padding-left: 310px; max-width: 780px;\" method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Resgistro de Alumnos</h2></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Numero de Control\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"number\" name=\"ncontrol\" required=\"required\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Nombre(s)\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"nombre\" required=\"required\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Apellido Paterno\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"apellidoP\" required=\"required\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Apellido Materno\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"apellidoM\" required=\"required\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("<div class=\"\">\n");
      out.write("        <label class=\"title\">Selecciona un Grupo\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("    <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select required=\"required\" style=\"width: 250px\" name=\"grupos\">\n");
      out.write("                    <option value=\"\">Grupos</option>\n");
      out.write("                     ");

                                                conectarBD c = new conectarBD();
                                                conectarBD nBD = new conectarBD();
                                                if (nBD.conectar()) {
                                                    Object[] filas1= new Object[2];
                                                    ResultSet res1 = nBD.consultas("Select * from grupos,periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                                            + " periodoesc.Estado="+1);
                                                    if (res1 != null) {
                                                       
                                                        while (res1.next()) {
                                                            filas1[0] = res1.getInt("Id_Grupo");
                                                            filas1[1] = res1.getInt("Grupo");
                                            
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
      out.write("                </select><i></i></span></div></div>\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Telefono\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"number\" name=\"telefono\" required=\"required\" value=\"\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Sexo\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"sexo\" required=\"required\" style=\"width: 300px\">\n");
      out.write("\n");
      out.write("                    <option value=\"Femenino\">Femenino</option>\n");
      out.write("                    <option value=\"Masculino\">Masculino</option>\n");
      out.write("                </select>\n");
      out.write("                <i></i>\n");
      out.write("            </span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("<!-- Stop Formoid form-->\n");

    if (request.getParameter("ncontrol") != null) {
        
        if (nBD.conectar()) {
            int vc = 0;
            int nc = Integer.parseInt(request.getParameter("ncontrol"));
            String n = request.getParameter("nombre");
            String ap = request.getParameter("apellidoP");
            String am = request.getParameter("apellidoM");
            int grupo = Integer.parseInt(request.getParameter("grupos"));
            String t = request.getParameter("telefono");
            String s = request.getParameter("sexo");
            ResultSet res = nBD.consultas("Select * from alumno where Control=" + nc);
            if (res != null) {
                while (res.next()) {
                    vc = res.getInt("Control");
                }
                if (vc == 0) {

                    if (nBD.ejecutaSQL("Insert into alumno values(" + nc + ",'" + n + "','" + ap + "','" + am + "','" + grupo + "',"+ 0 +",'" + s + "','" + t + "'," + 0 + ")")) {


      out.write("\n");
      out.write("<script>\n");
      out.write("                    alertify.success(\"Registro Generado OK :)\");\n");
      out.write("\n");
      out.write("                    location.href = \"FormularioDomicilio.jsp?control=");
      out.print(nc);
      out.write("&opcion=2\";\n");
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
      out.write("    alertify.confirm(\"No se puede realizar el registro por que el numero de control: ");
      out.print(nc);
      out.write(" ya se encuentra registrado\\n\\\n");
      out.write("                    Intenta asignar un diferente numero por favor\");\n");
      out.write("</script>\n");

                }
            }else
{
out.println("Error al registrar");
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
