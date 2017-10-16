package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioU_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    int nc = Integer.parseInt(request.getParameter("control"));
    String nombre="";
    conectarBD c  = new conectarBD();
    if(c.conectar())
    {
        ResultSet res = c.consultas("Select NombreP from personal where Cedula="+nc);
        if(res!=null)
        {
            while(res.next())
            {
                nombre = res.getString("NombreP");
            }
        }
    }

      out.write("\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Registro de Usuarios</h2></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">User:\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input  type=\"text\" name=\"nombreU\" required=\"required\" style=\"width: 250px\" value=\"");
      out.print(nombre);
      out.write("@cecytem\"/>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Password:\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input  type=\"password\" name=\"password\" required=\"required\" style=\"width: 250px\"/>\n");
      out.write("    </div>    <div class=\"\">\n");
      out.write("        <label class=\"title\">Grupos\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"tipo\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                    <option value=\"\">Tipos De Usuario</option>\n");
      out.write("                    <option value=\"2\">Administrativos</option>\n");
      out.write("                    <option value=\"2\">Maestros</option>\n");
      out.write("                    <option value=\"3\">Alumnos</option>\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Estado\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("    <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"status\" required=\"required\" style=\"width: 250px\" >\n");
      out.write("                    <option value=\"\">Estado</option>\n");
      out.write("                    <option value=\"1\">Activo</option>\n");
      out.write("                    <option value=\"0\">Inactivo</option>\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("   \n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("\n");
      out.write("    ");

     if(request.getParameter("nombreU")!=null)
     {
         String nombreU= request.getParameter("nombreU");
         String password= request.getParameter("password");
         int tipo= Integer.parseInt(request.getParameter("tipo"));
         int estado = Integer.parseInt(request.getParameter("status"));
         out.println(nombreU+password+tipo+estado);
         if(c.conectar())
         {
             if(c.ejecutaSQL("Insert into usuarios values (null,"+tipo+",'"+nombreU+"','"+password+"',"+estado+","+nc+")"))
             {
                 
      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.success(\"Registro Generado OK :)\");\n");
      out.write("    location.href = \"MostrarPersonal.jsp\";\n");
      out.write("</script>\n");
      out.write("\n");

             }else
{

      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"Error al registrar :(\");\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("\n");

}
         }
         
     }
 
      out.write("\n");
      out.write("    ");
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
