package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarCicloPeriodo_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<div class=\"title\"><h2>Consulta de Ciclos-Periodos</h2></div>\n");
      out.write("<hr>\n");
      out.write("<table class=\" bordered-table zebra-striped\" id=\"registro\">\n");
      out.write("    <thead> \n");
      out.write("    <th>Ciclo</th>\n");
      out.write("    <th>Periodo</th>\n");
      out.write("    <th>Activado</th>\n");
      out.write("    <th>Actualizar</th>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("\n");
      out.write("    ");

        conectarBD c = new conectarBD();
        int ciclo=0;
        if (c.conectar()) {
            ResultSet res = c.consultas("Select * from periodoesc");
            if (res != null) {
                Object[] filas = new Object[5];
                while (res.next()) {
                    filas[0] = res.getInt("Id_Periodo");
                    filas[1] = res.getInt("Ciclo");
                    filas[2] = res.getString("periodo");
                     int estado = res.getInt("Estado");
                     ciclo=res.getInt("Ciclo")+1;
                     int numero=res.getInt("numeroP");
    
      out.write("\n");
      out.write("    <tr> \n");
      out.write("        \n");
      out.write("        <td>");
      out.print(filas[1]);
      out.write('-');
      out.print(ciclo);

            if(numero==1)
            {
                out.println("A");
        }else
            {
                out.println("B");
        }
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[2]);
      out.write("</td>\n");
      out.write("        <td>");
 if(estado==0)
        {
           
      out.write("\n");
      out.write("           No.<a href=\"ModificarEstadoP.jsp?idP=");
      out.print(filas[0]);
      out.write("\">Activar</a>\n");
      out.write("            ");

        }else
        {
            out.println("Si");
        }
            
      out.write("</td>\n");
      out.write("        <td>\n");
      out.write("<center>\n");
      out.write("    <a href=\"ActualizarCicloPeriodo.jsp?idH=");
      out.print(filas[0]);
      out.write("\">\n");
      out.write("        <img src=\"img/actualizar.jpg\" width=\"30\" height=\"30\">\n");
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

      out.write("\n");
      out.write("\n");
      out.write("</tbody>   \n");
      out.write("</table>\n");
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
