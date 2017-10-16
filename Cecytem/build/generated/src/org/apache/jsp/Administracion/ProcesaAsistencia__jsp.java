package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;
import java.sql.Time;
import java.sql.ResultSet;
import logica.conectarBD;

public final class ProcesaAsistencia__jsp extends org.apache.jasper.runtime.HttpJspBase
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

    conectarBD c=new conectarBD();
     Calendar cal = Calendar.getInstance();
        int dia = cal.get(cal.DAY_OF_WEEK);
        Time horaE=null;
    if(c.conectar())
    {
        out.println("Conectado");
        Object[] filas= new Object[2];
        ResultSet res = c.consultas("select grupos.Grupo, horarios.HoraEntrada from grupos,horarios,periodoesc where grupos.Id_Grupo=horarios.Grupo and grupos.Id_Periodo=periodoesc.Id_Periodo and periodoesc.Estado="+1+" and horarios.Dia="+dia);
        {
            if(res!=null)
            {
                while(res.next())
                {
                filas[0]=res.getInt("Grupo");
                horaE=res.getTime("HoraEntrada");
                out.println(filas[0]);
                out.println(horaE);
                out.println("<br>");
                }
            }else
            {
                out.println("Error");
            }
            
        }
    }
    c.desconectar();

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
