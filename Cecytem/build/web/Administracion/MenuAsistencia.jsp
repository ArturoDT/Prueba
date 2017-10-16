
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<center>
    <form method="GET" action="#" style=" margin: 180px; padding-left: 20px; max-width:1480px;">
<div>
    <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                            <li class="active"><a href="#">Consulta de Asistencias</a></li>
                            <li class="dropdown">
                                
      <div class="">
         <label style="color: #000">Selecciona un Grupo
            <span class="required">*
            </span>
        </label>
 

        <div class="null">
            <span>
                <select required="required" style="width: 250px" name="Bgrupo">
                    <option value="">Grupos</option>
                     <%
                                                conectarBD c = new conectarBD();
                                                if (c.conectar()) {
                                                    int ver=0;
                                                    Object[] filas1= new Object[2];
                                                    ResultSet res1 = c.consultas("Select * from grupos,periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                                            + " periodoesc.Estado="+1+" and Carrera<>0");
                                                    if (res1 != null) {
                                                       
                                                        while (res1.next()) {
                                                            filas1[0] = res1.getInt("Id_Grupo");
                                                            filas1[1] = res1.getInt("Grupo");
                                                            ver=res1.getInt("Id_Grupo");
                                            %>
                                            <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                            <%
                                                        }
                                                    }
if(ver<=0)
{
%>
<script>
      alertify.error("No sea han registrado grupos Agregar->");
             function redireccionando()
    {
        location.href = "CicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 2000);
</script>
      <%}
                                                }
                                            %>
                </select><i></i></span></div></div>
                                   <br>
                                   <input type="submit" value="Enviar" class="btn-blue">       
                            </li>
                    </ul></div>
  
     </form>
</center>

    <%
        
        if(request.getParameter("Bgrupo")!=null)
        { int gr=0;
            gr=Integer.parseInt(request.getParameter("Bgrupo"));
            %>
            <script>
                location.href="MostrarAsistencia.jsp?gr=<%=gr%>";
            </script>
    
    <%
        }else
        {
        }
    %>
    <jsp:include page="Pie_1.jsp"/>