package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarAlumnosHistorial_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "newjsp.jsp", out, false);
      out.write('\n');
      out.write('\n');

    int gr = Integer.parseInt(request.getParameter("idH"));
    conectarBD c = new conectarBD();

      out.write("\n");
      out.write("<div class=\"title\"><h2>Consulta de Alumnos</h2></div>\n");
      out.write(" <hr>\n");
      out.write("<table class=\" bordered-table zebra-striped\" id=\"registro\" >\n");
      out.write("    <thead>\n");
      out.write("    <th>Numero control</th>\n");
      out.write("    <th>Nombre</th>\n");
      out.write("    <th>Apellido Paterno</th>\n");
      out.write("    <th>Apellido Materno</th>\n");
      out.write("    <th>Telefono</th>\n");
      out.write("    <th>Sexo</th>\n");
      out.write("    <th>Domicilio</th>\n");
      out.write("    <th>Datos del tutor</th>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("\n");
      out.write("    ");

        if (c.conectar()) {
            int control=0;
            ResultSet res = c.consultas("Select * from alumno, grupos, periodoesc, cicloesc where alumno.Id_Grupo=grupos.Id_Grupo and periodoesc.Id_Periodo=grupos.Id_Periodo "
                    + " and periodoesc.Id_ciclo = cicloesc.Id_ciclo and alumno.Id_Grupo="+ gr);
            if (res != null) {
                Object[] filas = new Object[7];
                while (res.next()) {
                    control=res.getInt("Control");
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getInt("Id_Domicilio");
                    filas[5] = res.getString("Sexo");
                    filas[6] = res.getString("Telefono");
                   


    
      out.write("\n");
      out.write("    <tr>\n");
      out.write("        <td>");
      out.print(filas[0]);
      out.write("</td> \n");
      out.write("        <td>");
      out.print(filas[1]);
      out.write("</td> \n");
      out.write("        <td>");
      out.print(filas[2]);
      out.write("</td> \n");
      out.write("        <td>");
      out.print(filas[3]);
      out.write("</td> \n");
      out.write("        <td>");
      out.print(filas[6]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[5]);
      out.write("</td>\n");
      out.write("        <td><center><a href=\"MostrarDomicilioA.jsp?id=");
      out.print(filas[4]);
      out.write("\"><img src=\"img/icon.png\" width=\"60\" height=\"50\" style=\"border-top-color: #003399\"></a></center></td>\n");
      out.write("<td><center><a href=\"MostrarTutor.jsp?control=");
      out.print(filas[0]);
      out.write("\">\n");
      out.write("        <img src=\"img/Inicio.jpg\" width=\"60\" height=\"50\" style=\"border-top-color: #003399\">\n");
      out.write("    </a>\n");
      out.write("</center>\n");
      out.write("</td>\n");
      out.write("</tr>\n");

    }
}if(control<=0)

{
         
      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"No se encontraron registros del grupo\");\n");
      out.write("\n");
      out.write("    function redireccionando()\n");
      out.write("    {\n");
      out.write("        location.href = \"MenuHistorial.jsp\";\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    setTimeout(\"redireccionando()\", 3000);\n");
      out.write("</script>\n");
 
}

        }

      out.write("\n");
      out.write("</tbody>   \n");
      out.write("</table>\n");
      out.write("\n");
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
