
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<center>
    <form method="GET" action="#" style=" margin: 180px; padding-left: 20px; max-width:1480px;">
<div>
    <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                            <li class="active"><a href="#">¿Ingrese el grupo?</a></li>
                            <li class="dropdown">
                                
                                <input type="text" name="Bgrupo" class="tab-content" required="required"> 
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