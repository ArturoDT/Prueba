package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Time;
import java.time.LocalDate;
import java.sql.Date;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarAsistencia_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Encabezado.jsp", out, false);
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "newjsp.jsp", out, false);
      out.write("\n");
      out.write("<div class=\"title\"><h2>Consulta de Asistencia </h2></div>\n");
      out.write(" <hr>\n");
      out.write("<table class=\" bordered-table zebra-striped\" id=\"registro\">\n");
      out.write("    <thead>\n");
      out.write("    <th>Numero control</th>\n");
      out.write("    <th>Nombre</th>\n");
      out.write("    <th>Apellido Paterno</th>\n");
      out.write("    <th>Apellido Materno</th>\n");
      out.write("    <th>Hora Entrada</th>\n");
      out.write("    <th>Hora Salida</th>\n");
      out.write("    <th>Fecha</th>\n");
      out.write("    <th>Asistencia</th>\n");
      out.write("    <th>Tomar Asstencia</th>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("    ");

        conectarBD c = new conectarBD();
        int gr = Integer.parseInt(request.getParameter("gr"));
        int control = 0;
        Date n = Date.valueOf(LocalDate.now());
        int con = 0;
        if (c.conectar()) {
            ResultSet relleno = c.consultas("Select Control from alumno left outer join asistencia on alumno.Control=asistencia.Id_alumno and "
                    + " asistencia.FechaE='" + n + "' where asistencia.Id_alumno is null and alumno.Id_Grupo="+gr);
            int id = 0;
            if (relleno != null) {
                while (relleno.next()) {
                    id = relleno.getInt("Control");
                    if (c.ejecutaSQL("Insert into asistencia values(null,'" + id + "','" + "00:00:00" + "','" + "00:00:00" + "','" + n + "','" + "Falta" + "')")) {
                        con = 1;
                    }
                }
            }
            ResultSet res = c.consultas("Select alumno.Control, alumno.Nombre, alumno.ApellidoP,"
                    + " alumno.ApellidoM, asistencia.HoraE,"
                    + " asistencia.HoraS, asistencia.FechaE, asistencia.Permiso "
                    + "from alumno join asistencia on alumno.Control = asistencia.Id_alumno and alumno.Id_Grupo=" + gr + " and asistencia.FechaE='" + n + "'");
            if (res != null) {
                Object[] filas = new Object[6];
                while (res.next()) {
                    filas[0] = res.getInt("Control");
                    filas[1] = res.getString("Nombre");
                    filas[2] = res.getString("ApellidoP");
                    filas[3] = res.getString("ApellidoM");
                    filas[4] = res.getDate("FechaE");
                    filas[5] = res.getString("Permiso");
                    Time hora = res.getTime("HoraE");
                    Time horaS = res.getTime("HoraS");
                    control = res.getInt("Control");
    
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
      out.print(hora);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(horaS);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[4]);
      out.write("</td>\n");
      out.write("        <td>");
      out.print(filas[5]);
      out.write("</td>\n");
      out.write("        <td><central>");
 if(filas[5].equals("Falta"))
        {
            
      out.write("\n");
      out.write("            <a href=\"ActualizarA.jsp?control=");
      out.print(filas[0]);
      out.write("&g=");
      out.print(gr);
      out.write("\">\n");
      out.write("        <img src=\"img/actualizar.jpg\" width=\"60\" height=\"40\"></a>\n");
      out.write("            ");
  
        }
    
      out.write("\n");
      out.write("</central>\n");
      out.write("</td>\n");
      out.write("</tr>\n");

            }
        } else {
        }
    }


      out.write("\n");
      out.write("</tbody>   \n");
      out.write("<button style=\"float: right; padding-left: 22px;\">\n");
      out.write("    <a href=\"../reporteSalario?grupo=");
      out.print(gr);
      out.write("&fecha=");
      out.print(n);
      out.write("&control=");
      out.print(control);
      out.write("\">\n");
      out.write("        Generar <img src=\"img/pdf.jpg\" width=\"40\" height=\"50\">\n");
      out.write("    </a>\n");
      out.write("</button>\n");
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
