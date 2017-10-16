package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarTablaGruposCarreras_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    conectarBD c = new conectarBD();
    int ver = 0;
    int idG = Integer.parseInt(request.getParameter("idG"));

      out.write("\n");
      out.write("\n");
      out.write("<div class=\"title\"><h2>Consulta de Grupos</h2></div><div><h6 style=\"font-family: cursive; color: #0069d6\">Agregar-><a href=\"FormularioGrupo.jsp\">Nuevo-Grupo</a></h6></div>\n");
      out.write("<hr>\n");
      out.write("<table class=\" bordered-table zebra-striped\" id=\"registro\">\n");
      out.write("    <thead> \n");
      out.write("    <th>Id_Grupo</th>\n");
      out.write("    <th>Grupo</th>\n");
      out.write("    <th>Carrera</th>\n");
      out.write("    <th>Turno</th>\n");
      out.write("    <th>Semestre</th>\n");
      out.write("    <th><center>Editar</center></th>\n");
      out.write("    <th><center>Borrar</center></th>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("    ");

        int contador = 0;

        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from grupos,carrera,periodoesc where carrera.Id_Carrera=grupos.Carrera "
                    + " and periodoesc.Id_Periodo = grupos.Id_Periodo "
                    + " and periodoesc.Estado=" + 1 + " and grupos.Semestre=" + idG);
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    filas[0] = res.getInt("Id_Grupo");
                    filas[1] = res.getInt("Grupo");
                    filas[2] = res.getString("nombreCarrera");
                    filas[3] = res.getString("Turno");
                    filas[4] = res.getInt("Semestre");
                    contador = res.getInt("Semestre");
    
      out.write("\n");
      out.write("    <tr> \n");
      out.write("        <td>");
      out.print(filas[0]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[1]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[2]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[3]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[4]);
      out.write("</td>\n");
      out.write("        <td>\n");
      out.write("<center>\n");
      out.write("    <a href=\"ModificarGrupos.jsp?idH=");
      out.print(filas[0]);
      out.write("\">\n");
      out.write("        <img src=\"img/actualizar.jpg\" width=\"30\" height=\"30\">\n");
      out.write("    </a>\n");
      out.write("</center>\n");
      out.write("</td>\n");
      out.write("<td>\n");
      out.write("<center>\n");
      out.write("    <a href=\"ModificarGrupos.jsp?idH=");
      out.print(filas[0]);
      out.write("\">\n");
      out.write("        <img src=\"img/x.png\" width=\"30\" height=\"30\">\n");
      out.write("    </a>\n");
      out.write("</center>\n");
      out.write("</td>\n");
      out.write("\n");
      out.write("\n");
      out.write("</tr>\n");

            }
        } else {
        }
    }
    if (contador <= 0) {

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

      out.write("\n");
      out.write("\n");
      out.write("</tbody>   \n");
      out.write("</table>\n");
      out.write("\n");
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
