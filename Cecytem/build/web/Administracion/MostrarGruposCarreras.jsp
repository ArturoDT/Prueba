
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<center>
    
  
    <form method="GET" action="#" style=" margin: 180px; padding-left: 5px; max-width:1780px;">
              
<div>
    <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
        <li class="active"><a href="#">Consulta de Grupos</a></li> 
                            <li class="dropdown">     
     <div class="">
         <label style="color: #000">Selecciona un Grupo
            <span class="required">*
            </span>
        </label>
 

        <div class="null">
            <span>
                <select required="required" style="width: 250px" name="Bgrupo">
                    <option value="">Semestre</option>
                    <option value="1">1°</option>
                    <option value="2">2°</option>
                    <option value="3">3°</option>
                    <option value="4">4°</option>
                    <option value="5">5°</option>
                    <option value="6">6°</option>
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
                location.href="MostrarTablaGruposCarreras.jsp?idG=<%=gr%>";
            </script>
    
    <%
        }else
        {
        }
    %>
    
    <jsp:include page="Pie_1.jsp"/>