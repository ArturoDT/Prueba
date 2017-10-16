package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Time;
import java.time.LocalDate;
import java.sql.Date;
import java.sql.ResultSet;
import logica.conectarBD;

public final class MostrarHistorialAsistencias_jsp extends org.apache.jasper.runtime.HttpJspBase
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
conectarBD c = new conectarBD();
    int gr = Integer.parseInt(request.getParameter("idH"));
    Object[] fila = new Object[6];
    if (c.conectar()) {

        ResultSet resul = c.consultas("Select alumno.Nombre, alumno.ApellidoP, carrera.nombreCarrera, grupos.Turno, grupos.Grupo, "
                + " periodoesc.periodo from alumno,grupos,periodoesc,carrera where alumno.Id_Grupo=grupos.Id_Grupo and grupos.Id_Periodo=periodoesc.Id_Periodo and"
                + " carrera.Id_Carrera=grupos.Carrera and alumno.Control=" + gr);
        if (resul != null) {
            while (resul.next()) {
                fila[0] = resul.getString("Nombre");
                fila[1] = resul.getString("ApellidoP");
                fila[2] = resul.getString("nombreCarrera");
                fila[3] = resul.getString("Turno");
                fila[4] = resul.getInt("Grupo");
                fila[5] = resul.getString("periodo");

            }
        }

    }

      out.write("  \n");
      out.write("<div style=\"background: wheat; width: 25%; padding-left: 30px; border-radius: 30px; font-family:  cursive; align-content: center;\">\n");
      out.write("    <di><label>Datos del Alumno</label></di><br>\n");
      out.write("    <di><label>Alumno:</label><label>");
      out.print(fila[0]);
      out.write('_');
      out.print(fila[1]);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Carrera:</label><label>");
      out.print(fila[2]);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Turno:</label><label>");
      out.print(fila[3]);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Grupo:</label><label>");
      out.print(fila[4]);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Periodo:</label><label>");
      out.print(fila[5]);
      out.write("</label></di>\n");
      out.write("</div>\n");
      out.write("<br>\n");
      out.write("<table class=\" bordered-table zebra-striped\" id=\"registro\">\n");
      out.write("    <thead>\n");
      out.write("    <th>Hora Entrada</th>\n");
      out.write("    <th>Hora Salida</th>\n");
      out.write("    <th>Fecha</th>\n");
      out.write("    <th>Estado</th>\n");
      out.write("</thead>\n");
      out.write("<tbody>\n");
      out.write("    ");

         int totalA = 0;
                int totalR = 0;
                int totalJ = 0;
                int totalF = 0;
                int contadorA = 0;
                int contadorF = 0;
                int contadorR = 0;
                int contadorJ = 0;
        int control = 0;
        Date n = Date.valueOf(LocalDate.now());
        int con = 0;
        if (c.conectar()) {
            ResultSet res = c.consultas("Select alumno.Control, alumno.Nombre, alumno.ApellidoP,"
                    + " alumno.ApellidoM, asistencia.HoraE,"
                    + " asistencia.HoraS, asistencia.FechaE, asistencia.Permiso "
                    + "from alumno join asistencia on alumno.Control = asistencia.Id_alumno and alumno.Control=" + gr + " order by FechaE,ApellidoP");
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
                       if (filas[5].equals("Asistencia")) {
                                contadorA++;
                               
                            }
                            if (filas[5].equals("Retardo")) {
                                contadorR++;
                                
                            }
                            if (filas[5].equals("Justificado")) {
                                contadorJ++;
                               
                            }
                            if (filas[5].equals("Falta")) {
                                contadorF++;
                            }
    
      out.write("\n");
      out.write("    <tr>\n");
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
      out.write("    </tr>\n");
      out.write("    ");

            }
        }
        if (control <= 0) {
    
      out.write("\n");
      out.write("<script>\n");
      out.write("    alertify.error(\"No se encontraron registros de Asistencia del grupo ");
      out.print(gr);
      out.write(" \\n\\\n");
      out.write("                    Agregar alumnos-->\");\n");
      out.write("\n");
      out.write("    function redireccionando()\n");
      out.write("    {\n");
      out.write("        location.href = \"PruebaTabla.jsp\";\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    setTimeout(\"redireccionando()\", 1500);\n");
      out.write("</script>\n");

        }
    }


      out.write("\n");
      out.write("</tbody>   \n");
      out.write("<button style=\"float: right; padding-left: 22px;\">\n");
      out.write("    <a href=\"../reporteSalario?control=");
      out.print(control);
      out.write("\">\n");
      out.write("        Generar <img src=\"img/pdf.jpg\" width=\"40\" height=\"50\">\n");
      out.write("    </a>\n");
      out.write("</button>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("</table>\n");
      out.write("        <center>\n");
      out.write("         <div style=\"background: wheat; width: 15%; border-radius: 20px; border-right-width: 1px; padding-left: 22px\">\n");
      out.write("            <di><label>Total Asistencias:</label><label>");
      out.print(contadorA);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Total Justificaciones:</label><label>");
      out.print(contadorJ);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Total Retardos:</label><label>");
      out.print(contadorR);
      out.write("</label></di><br>\n");
      out.write("    <di><label>Total  Faltas:</label><label>");
      out.print(contadorF);
      out.write("</label></di><br>\n");
      out.write("        </div>\n");
      out.write("        </center>\n");
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
