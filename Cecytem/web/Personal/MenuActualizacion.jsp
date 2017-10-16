<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>

<%
 int ncl = Integer.parseInt(request.getParameter("control"));
 %>
<center>
    <form method="GET" action="#" style=" margin: 189px; padding-left: 20px; max-width:1480px;">
<div >
    <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                            <li class="active"><a href="#">¿Que desea Actualizar?</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Opciones :) Elige<i class="icon-angle-down"></i></a>
                                <ul class="dropdown-menu">
                                    <li><a href="ActualizarAlumno.jsp?control=<%=ncl%>">Datos Personales</a></li>
                                    <li><a href="ActualizarDomicilio.jsp?control=<%=ncl%>">Datos de domicilio</a></li>
                                </ul>
                            </li>
                        </ul></div>
    </form>
</center>

                                    <jsp:include page="Pie_1.jsp"/>