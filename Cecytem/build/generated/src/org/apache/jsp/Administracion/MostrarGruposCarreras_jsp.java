package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarGruposCarreras_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Encabezado.jsp", out, false);
      out.write("\n");
      out.write("<center>\n");
      out.write("    \n");
      out.write("  \n");
      out.write("    <form method=\"GET\" action=\"#\" style=\" margin: 180px; padding-left: 5px; max-width:1780px;\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("<div>\n");
      out.write("    <ul class=\"nav-tabs accordion-inner alert\" style=\"position: fixed; background:  #049cdb; width: max-content\"  >\n");
      out.write("        <li class=\"active\"><a href=\"#\">Consulta de Alumnos</a></li> \n");
      out.write("                            <li class=\"dropdown\">     \n");
      out.write("     <div class=\"\">\n");
      out.write("         <label style=\"color: #000\">Selecciona un Grupo\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write(" \n");
      out.write("\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select required=\"required\" style=\"width: 250px\" name=\"Bgrupo\">\n");
      out.write("                    <option value=\"\">Semestre</option>\n");
      out.write("                    <option value=\"1\">1°</option>\n");
      out.write("                    <option value=\"2\">2°</option>\n");
      out.write("                    <option value=\"3\">3°</option>\n");
      out.write("                    <option value=\"4\">4°</option>\n");
      out.write("                    <option value=\"5\">5°</option>\n");
      out.write("                    <option value=\"6\">6°</option>\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("                                   <br>\n");
      out.write("                                   <input type=\"submit\" value=\"Enviar\" class=\"btn-blue\">       \n");
      out.write("                            </li>\n");
      out.write("                    </ul></div>\n");
      out.write("  \n");
      out.write("     </form>\n");
      out.write("</center>\n");
      out.write("\n");
      out.write("    ");

        
        if(request.getParameter("Bgrupo")!=null)
        { int gr=0;
            gr=Integer.parseInt(request.getParameter("Bgrupo"));
            
      out.write("\n");
      out.write("            <script>\n");
      out.write("                location.href=\"MostrarTablaGruposCarreras.jsp?idG=");
      out.print(gr);
      out.write("\";\n");
      out.write("            </script>\n");
      out.write("    \n");
      out.write("    ");

        }else
        {
        }
    
      out.write("\n");
      out.write("    \n");
      out.write("    ");
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
