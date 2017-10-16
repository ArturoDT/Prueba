package org.apache.jsp.Administracion;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import logica.conectarBD;

public final class FormularioCicloPerido_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    conectarBD c = new conectarBD();
    if (c.conectar()) {
        int id = 0;
        ResultSet res = c.consultas("Select * from años");
        if (res != null) {
            while (res.next()) {
                id = res.getInt("id_Año");
            }
            if (id > 0) {

            } else {
                for (int i = 0; i < 51; i++) {
                    int cont = 1990 + i;

                    if (c.ejecutaSQL("Insert into años values (null," + cont + ")")) {

                    }
                }

            }
        }
    }

      out.write("\n");
      out.write("<script>\n");
      out.write("    function mostrar(op)\n");
      out.write("    {\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    function confirmaA()\n");
      out.write("    {\n");
      out.write("        alertify.confirm(\"Deseas Desactivar el semestre anterior\", function respuesta() {\n");
      out.write("            if (respuesta())\n");
      out.write("            {\n");
      out.write("                alert(\"Desactivar\");\n");
      out.write("            } else\n");
      out.write("            {\n");
      out.write("                alert(\"No Desactivar\");\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("</script>\n");
      out.write("<form class=\"formoid-default-green\" style=\"background-color:#FFFFFF;\n");
      out.write("      font-size:14px;font-family:'Open Sans','Helvetica Neue',\n");
      out.write("      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; \n");
      out.write("      margin: 180px; padding-left: 5px; max-width:780px;\" \n");
      out.write("      method=\"POST\">\n");
      out.write("    <div class=\"title\"><h2>Registro del Ciclo-Periodo Escolar</h2></div>\n");
      out.write("\n");
      out.write("    <div class=\"\">\n");
      out.write("        <label class=\"title\">Selecciona un Año\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"ciclo\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                    <option value=\"\">Años</option>\n");
      out.write("                    ");

                            ResultSet res = c.consultas("Select * from años");

                            if (c.conectar()) {
                            
                            if (res != null) {
                                Object[] filas = new Object[1];

                                while (res.next()) {
                                    filas[0] = res.getInt("Año");
                                    
      out.write("\n");
      out.write("                                    <option>");
      out.print(filas[0]);
      out.write("</option>\n");
      out.write("                    ");

                                }
                            }
                        }


                    
      out.write("\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("                    <div class=\"\">\n");
      out.write("        <label class=\"title\">Selecciona un Periodo\n");
      out.write("            <span class=\"required\">*\n");
      out.write("            </span>\n");
      out.write("        </label>\n");
      out.write("\n");
      out.write("        <div class=\"null\">\n");
      out.write("            <span>\n");
      out.write("                <select name=\"numeroP\" required=\"required\" style=\"width: 250px\">\n");
      out.write("                    <option value=\"\">Periodo</option>\n");
      out.write("                    <option value=\"1\">Primer Semestre del Año</option>\n");
      out.write("                    <option value=\"2\">Segndo Semestre del Año</option>\n");
      out.write("                </select><i></i></span></div></div>\n");
      out.write("    <div class=\"element-input\">\n");
      out.write("        <label class=\"title\">Nombre el Periodo ejemplo(Febrero 2000-Junio 2000)\n");
      out.write("            <span class=\"required\">\n");
      out.write("                *</span>\n");
      out.write("        </label>\n");
      out.write("        <input class=\"null\" type=\"text\" name=\"periodo\" required=\"required\" style=\"width: 300px\"/>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"submit\"><input type=\"submit\" value=\"Enviar\"/></div></form><p class=\"frmd\"><a href=\"http://formoid.com/v29.php\">html forms</a> Formoid.com 2.9</p><script type=\"text/javascript\" src=\"formularioregistro_files/formoid1/formoid-default-green.js\"></script>\n");
      out.write("\n");
      out.write("<div id=\"respuesta\"> </div>\n");
    if (request.getParameter ( "ciclo") != null) {

     String ciclo = request.getParameter("ciclo");
     int numerpP = Integer.parseInt(request.getParameter("numeroP"));
     String cont= request.getParameter("numeroP");
    
     int verif=0;
     String suma=ciclo+cont;
     out.println(suma);
      int unico=Integer.parseInt(suma);
     if(c.conectar())
     {
     String periodo = request.getParameter("periodo");
     ResultSet ver = c.consultas("Select Id_Periodo from periodoesc where idUnico="+unico);
     if(ver!=null)
     {
         while(ver.next())
         {
             verif=ver.getInt("Id_Periodo");
            
         }
     }
      out.println(verif);
     if(verif>0)
     {
         
      out.write("\n");
      out.write("         <script>\n");
      out.write("             alertify.error(\"Ya existe un periodo igual asignado al Año\");\n");
      out.write("         </script>\n");
      out.write("         ");

     }else
{
    if(c.conectar())
    {
        if(c.ejecutaSQL("Insert into periodoesc values(null,'"+ciclo+"','"+periodo+"',"+numerpP+","+0+","+0+",'"+ciclo+cont+"')"))
        {
        
      out.write("\n");
      out.write("         <script>\n");
      out.write("             alertify.success(\"Registro Correcto\");\n");
      out.write("             function redireccionando()\n");
      out.write("    {\n");
      out.write("        location.href = \"MostrarCicloPeriodo.jsp\";\n");
      out.write("\n");
      out.write("    }\n");
      out.write("    setTimeout(\"redireccionando()\", 1500);\n");
      out.write("         </script>\n");
      out.write("         ");

        }else
        {
            
      out.write("\n");
      out.write("         <script>\n");
      out.write("             alertify.error(\"Error al registrar\");\n");
      out.write("         </script>\n");
      out.write("         ");

        }
    }
}
    
    }
}

      out.write("\n");
      out.write("\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "Pie_1.jsp", out, false);
      out.write('\n');
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
