package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import logica.conectarBD;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html >\n");
      out.write("    <head>\n");
      out.write("         <div id=\"ventana\" style=\"display: none\">\n");
      out.write("            <p>El usuario o contraseña son incorrectos.<br><br>\n");
      out.write("            Vuelve a intentarlo</p><br>\n");
      out.write("        </div>\n");
      out.write("    <div id=\"ventana1\" style=\"display: none\">\n");
      out.write("            <p>Lo sentimos tu cuenta a sido Desactivada.<br><br>\n");
      out.write("            Por Favor solicitar la Activacion con el Administrador</p><br>\n");
      out.write("        </div>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Inicio de Sesión</title>  \n");
      out.write("        <link rel=\"stylesheet\" href=\"login/css/reset.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"login/css/styles.css\">\n");
      out.write("           <link href=\"notificacion/css/css/jquery-ui.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        <link href=\"notificacion/css/css/style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("     <script src=\"notificacion/js/js/jquery-1.12.4.js\" type=\"text/javascript\"></script>\n");
      out.write("    <script src=\"notificacion/js/js/jquery-ui.js\" type=\"text/javascript\"></script>\n");
      out.write("    <body style=\"background-color: #073A52\">\n");
      out.write("        <br><br>\n");
      out.write("    <center><h2 style=\"size: A4\">Colegio de Estudios Cientificos y Tecnologicos del Estado de Mexico</h2></center>\n");
      out.write("        <br>\n");
      out.write("    <center><h1>Inicio de Sesion</h1></center>\n");
      out.write("        <div class=\"login\">\n");
      out.write("            <header class=\"login-header\"><span class=\"text\">\n");
      out.write("                    <img src=\"img/descarga (3)_1.jpg\" height=\"200\" style=\"border-image-slice: fill; border-image:radial-gradient; border-radius: 25px; \">\n");
      out.write("                </span><span class=\"loader\"></span></header>\n");
      out.write("            <form class=\"login-form\">\n");
      out.write("                <input type=\"text\" placeholder=\"Usuario\" class=\"login-input\" name=\"txtUsuario\"/>\n");
      out.write("                <input type=\"password\" placeholder=\"Password\" class=\"login-input\" name=\"txtPassword\"/>\n");
      out.write("                <br>\n");
      out.write("                <a href=\"Registropaciente.jsp\">Registrate</a>\n");
      out.write("                \n");
      out.write("                <button type=\"submit\" class=\"login-btn\">Ingresar</button>\t\n");
      out.write("            </form>\n");
      out.write("           \n");
      out.write("        </div>\n");
      out.write("        ");

            Object [] fila = new Object[1];
            if (request.getParameter("txtUsuario") != null) {
                String user, password;
                int status=0;
                user = request.getParameter("txtUsuario");
                password = request.getParameter("txtPassword");
                conectarBD cdb = new conectarBD();
                if (cdb.conectar()) {
            int tipo = cdb.buscarUsuario(user, password);
            ResultSet res = cdb.consultas("Select Status from usuarios where User='"+user+"' and Password='"+password+"'");
            if(res!=null)
            {
                while(res.next())
                {
                    status=res.getInt("Status");
                }
            }
            
            
           if(tipo>0)
           {
               if(status==1)
            {
               switch (tipo) {
                case 1:
                    HttpSession sesionAdmin = request.getSession();
                    sesionAdmin.setAttribute("sesionAdministrador", user);
        
      out.write("\n");
      out.write("        <script lang=\"JavaScript\">\n");
      out.write("            location.href = \"Administracion/index.jsp\";\n");
      out.write("//window.location(\"\");       </script>\n");
      out.write("            ");

                    break;
                case 2:

                    HttpSession sesionDoctor = request.getSession();
                    sesionDoctor.setAttribute("sesionPersonal", user);
            
      out.write("\n");
      out.write("        <script lang=\"JavaScript\">\n");
      out.write("            location.href = \"Personal/index.jsp\";\n");
      out.write("//window.location(\"\");       </script>\n");
      out.write("            ");

                                break;
                                case 3:

                    HttpSession sesionPaciente = request.getSession();
                    sesionPaciente.setAttribute("sesionMaestros", user);
            
      out.write("\n");
      out.write("        <script lang=\"JavaScript\">\n");
      out.write("            location.href = \"Paciente/index.jsp?clave=");
      out.print(fila[0]);
      out.write("\";\n");
      out.write("//window.location(\"\");       </script>\n");
      out.write("            ");

                                break;

                        }

      out.write(" \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            ");

                }else
{

      out.write("\n");
      out.write("      <script>\n");
      out.write("        $(function ()\n");
      out.write("        {\n");
      out.write("            $(\"#ventana1\").dialog({\n");
      out.write("               //establecemos propiedades \n");
      out.write("               autoOpen:true,\n");
      out.write("               show:{\n");
      out.write("                   effect:\"explode\",\n");
      out.write("                   duration:1000\n");
      out.write("               },\n");
      out.write("               hide:\n");
      out.write("                       {\n");
      out.write("                           effect:\"explode\",\n");
      out.write("                           duration:1000\n");
      out.write("                       },\n");
      out.write("                     \n");
      out.write("                   });\n");
      out.write("                   $(\"#abrirVentana\").on(\"click\",function (){\n");
      out.write("                       $(\"#ventana\").dialog(\"open\")\n");
      out.write("                   {\n");
      out.write("                       \n");
      out.write("                   }\n");
      out.write("            });\n");
      out.write("        }); \n");
      out.write("        \n");
      out.write("        function abrirventana ()\n");
      out.write("        {\n");
      out.write("           $(\"#ventana\").dialog(\"open\");\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");


}
               
               
           }else
           {
               
      out.write("\n");
      out.write("      <script>\n");
      out.write("        $(function ()\n");
      out.write("        {\n");
      out.write("            $(\"#ventana\").dialog({\n");
      out.write("               //establecemos propiedades \n");
      out.write("               autoOpen:true,\n");
      out.write("               show:{\n");
      out.write("                   effect:\"explode\",\n");
      out.write("                   duration:1000\n");
      out.write("               },\n");
      out.write("               hide:\n");
      out.write("                       {\n");
      out.write("                           effect:\"explode\",\n");
      out.write("                           duration:1000\n");
      out.write("                       },\n");
      out.write("                     \n");
      out.write("                   });\n");
      out.write("                   $(\"#abrirVentana\").on(\"click\",function (){\n");
      out.write("                       $(\"#ventana\").dialog(\"open\")\n");
      out.write("                   {\n");
      out.write("                       \n");
      out.write("                   }\n");
      out.write("            });\n");
      out.write("        }); \n");
      out.write("        \n");
      out.write("        function abrirventana ()\n");
      out.write("        {\n");
      out.write("           $(\"#ventana\").dialog(\"open\");\n");
      out.write("            {\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("    ");

           }


                    }
                }


            
      out.write("\n");
      out.write("        <script src='js/jquery.min.js'></script>  \n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
