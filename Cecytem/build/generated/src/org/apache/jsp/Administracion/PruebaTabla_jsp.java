package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class PruebaTabla_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!-- Bootstrap Core CSS -->\n");
      out.write("<link href=\"vendor/bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<!-- Custom CSS -->\n");
      out.write("<link href=\"dist/css/sb-admin-2.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- Morris Charts CSS -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Custom Fonts -->\n");
      out.write("\n");
      out.write("<link rel=\"stylesheet\" href=\"vendor/css/jquery-ui.css\"\n");
      out.write("      type=\"text/css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"vendor/css/jquery-ui.structure.css\"\n");
      out.write("      type=\"text/css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"vendor/css/jquery-ui.theme.css\"\n");
      out.write("      type=\"text/css\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title></title>\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div id=\"wrapper\" style=\"margin: 180px;\">\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-lg-8\">\n");
      out.write("                <h1 class=\"page-header\">Cliclo Periodo</h1>\n");
      out.write("            </div>\n");
      out.write("            <!-- /.col-lg-12 -->\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row col-lg-6\" >\n");
      out.write("\n");
      out.write("            <div id=\"accordion\">\n");
      out.write("                ");

                    int idP = 0;
                    int idC = 0;
                    conectarBD c = new conectarBD();
                    if (c.conectar()) {

                        Object[] filas1 = new Object[2];
                        int i = 1;

                        ResultSet res1 = c.consultas("Select * from periodoesc");
                        if (res1 != null) {

                            while (res1.next()) {

                                i++;
                                idP = res1.getInt("Id_Periodo");
                                filas1[1] = res1.getString("periodo");
                
      out.write("\n");
      out.write("                <h3>");
      out.print(filas1[1]);
      out.print(idP);
      out.write("</h3>\n");
      out.write("                <div> \n");
      out.write("                    <script>\n");
      out.write("                        $(function () {\n");
      out.write("                            $(\"#action");
      out.print(i);
      out.write("\").accordion({\n");
      out.write("                                collapsible: true\n");
      out.write("                            });\n");
      out.write("                        });\n");
      out.write("                    </script> \n");
      out.write("                    <div  id=\"action");
      out.print(i);
      out.write("\">\n");
      out.write("                        ");

                            if (c.conectar()) {
                                Object[] filas = new Object[2];
                                ResultSet res = c.consultas("Select * from carrera");
                                if (res != null) {

                                    while (res.next()) {
                                        idC = res.getInt("Id_Carrera");

                                        filas[1] = res.getString("nombreCarrera");
                        
      out.write("\n");
      out.write("                        <h3>");
      out.print(filas[1]);
      out.print(idC);
      out.write("</h3>\n");
      out.write("                        <div>\n");
      out.write("                            <table border=\"1\">\n");
      out.write("                                <thead> \n");
      out.write("                                <th>Id_Grupo</th>\n");
      out.write("                                <th>Grupo</th>\n");
      out.write("                                <th>Carrera</th>\n");
      out.write("                                <th>Turno</th>\n");
      out.write("                                <th>Semestre</th>\n");
      out.write("                                <th><center>Ver Alumnos</center></th>\n");
      out.write("                                </thead>\n");
      out.write("\n");
      out.write("                                <tbody>\n");
      out.write("                                    ");
if (idC == 3 & idP == 1) {
             for (int in = 0; in <= 4; in++) {
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>12</td>\n");
      out.write("                                        <td>12</td>\n");
      out.write("                                        <td>12</td>\n");
      out.write("                                        <td>12</td>\n");
      out.write("                                        <td>12</td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");

                                            }
                                        }
                                    
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        ");

                                    }
                                }
                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                    </div>  \n");
      out.write("                </div>\n");
      out.write("                ");

                            }
                        }
                    }
                
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </div>   \n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("<script src=\"vendor/jquery/jquery.min.js\"></script>\n");
      out.write("<script src=\"vendor/jquery/jquery-ui.js\"></script>\n");
      out.write("<!-<script src=\"vendor/jquery/js/jquery-ui.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Metis Menu Plugin JavaScript -->\n");
      out.write("<script src=\"vendor/metisMenu/metisMenu.min.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Morris Charts JavaScript -->\n");
      out.write("<script src=\"vendor/raphael/raphael.min.js\"></script>\n");
      out.write("<script src=\"vendor/morrisjs/morris.min.js\"></script>\n");
      out.write("<script src=\"data/morris-data.js\"></script>\n");
      out.write("\n");
      out.write("<!-- Custom Theme JavaScript -->\n");
      out.write("<script src=\"dist/js/sb-admin-2.js\"></script>\n");
      out.write("<script>\n");
      out.write("                        $(function () {\n");
      out.write("                            $(\"#accordion\").accordion({\n");
      out.write("                                collapsible: true\n");
      out.write("                            });\n");
      out.write("                        });\n");
      out.write("</script>    \n");
      out.write("<script>\n");
      out.write("    $(function () {\n");
      out.write("        $(\"#action\").accordion({\n");
      out.write("            collapsible: true\n");
      out.write("        });\n");
      out.write("    });\n");
      out.write("</script> \n");
      out.write("</html>\n");
      out.write("\n");
      out.write("<!-- jQuery -->\n");
      out.write("\n");
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
