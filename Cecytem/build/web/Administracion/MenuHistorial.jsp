<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<script>
    function Mostrar(op)
    {
        var opciones = op.value;
        if (opciones == 1)
        {
            var divMostrar = document.getElementById("menuAlumnos");
            divMostrar.style.display = "block";
            var divMostrar = document.getElementById("menu");
            divMostrar.style.display = "none";
        }
         if (opciones == 2)
        {
            var divMostrar = document.getElementById("menuAsistencia");
            divMostrar.style.display = "block";
            var divMostrar = document.getElementById("menu");
            divMostrar.style.display = "none";
            var divMostrar = document.getElementById("menuAlumnos");
            divMostrar.style.display = "none";
        }
    }
    function Cancelar()
    {
      location.href="MenuHistorial.jsp";     
    }
    function Enviar()
    {
       
        var idCa = $("#carrera").val();
        var idP = $("#periodos").val();
        if(idCa=="" || idP =="")
        {
            
            alertify.error("Es necesario elegir el Ciclo, el Periodo y Carrera ");
        } else
        {
           location.href="MostrarGruposHistorialAlumnos.jsp?idCa="+idCa+"&idP="+idP;
        }
        
    }
     function EnviarA()
    {
       
        var idCa = $("#carreraA").val();
        var idP = $("#periodosA").val();
        if(idCa=="" || idP =="")
        {
        
            alertify.error("Es necesario elegir el Ciclo, el Periodo y Carrera ");
        }else
        {
            
         
            location.href="MostrarGruposAsistencia.jsp?idCa="+idCa+"&idP="+idP;
        }

    }
</script>
<center>
    <form method="GET" action="#" style=" margin: 180px; padding-left: 20px; max-width:1480px;">
        <div id="menu">
            <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                <li class="active"><a href="#">Consulta de Historial</a></li>
                <li class="dropdown">

                    <select id="historial" style="width: 250px" onchange="Mostrar(this)" required="requiered">
                        <option value="">Opciones</option>
                        <option value="1">Alumnos</option>
                        <option value="2">Asistencia</option>
                    </select>
                </li>
                <br>    
                <input type="submit" value="Enviar" class="btn-blue">  
            </ul></div>

        <div id="menuAlumnos" style="display: none">
            <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                <li class="active"><a href="#">Consulta Historial Alumnos</a></li>
                <li class="dropdown">
      
                    <div class="">
                        <label class="title">Selecciona un Periodo
                            <span class="required">*
                            </span>
                        </label>

                        <div class="null">
                            <span>
                                <select id="periodos" required="required" style="width: 250px">
                                    <option value="">Periodos</option>
                                    <%
                                        conectarBD c = new conectarBD();
                                        if (c.conectar()) {
                                          
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from periodoesc");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Periodo");
                                                    filas1[1] = res1.getString("periodo");
                                    %>
                                    <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </select><i></i></span></div></div>
                    <div class="">
                        <label class="title">Selecciona la Carrera
                            <span class="required">*
                            </span>
                        </label>
                        <div class="null">
                            <span>
                                <select required="required" style="width: 250px" id="carrera">
                                    <option value="">Carreras</option>
                                    <%
                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from carrera");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Carrera");
                                                    filas1[1] = res1.getString("nombreCarrera");
                                    %>
                                    <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </select></span></div></div>
                </li>
                <br>      
                <input type="submit" value="Enviar" class="btn-blue" onclick="Enviar()"> 
                <input type="button" value="Cancelar" class="btn-blue" onclick="Cancelar()"> 
            </ul></div>

        <div id="menuAsistencia" style="display: none">
            <ul class="nav-tabs accordion-inner alert" style="position: fixed; background:  #049cdb; width: max-content"  >
                <li class="active"><a href="#">Consulta Historial Asistencia</a></li>
                <li class="dropdown">
                    <div class="">
                        <label class="title">Selecciona un Periodo
                            <span class="required">*
                            </span>
                        </label>

                        <div class="null">
                            <span>
                                <select id="periodosA" required="required" style="width: 250px">
                                    <option value="">Periodos</option>
                                    <%
                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from periodoesc");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Periodo");
                                                    filas1[1] = res1.getString("periodo");
                                    %>
                                    <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </select><i></i></span></div></div>
                    <div class="">
                        <label class="title">Selecciona la Carrera
                            <span class="required">*
                            </span>
                        </label>
                        <div class="null">
                            <span>
                                <select required="required" style="width: 250px" id="carreraA">
                                    <option value="">Carreras</option>
                                    <%
                                        if (c.conectar()) {
                                            Object[] filas1 = new Object[2];
                                            ResultSet res1 = c.consultas("Select * from carrera");
                                            if (res1 != null) {

                                                while (res1.next()) {
                                                    filas1[0] = res1.getInt("Id_Carrera");
                                                    filas1[1] = res1.getString("nombreCarrera");
                                    %>
                                    <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </select><i></i></span></div></div>
                             
                </li>
                <br>
                <input type="submit" value="Enviar" class="btn-blue" onclick="EnviarA()">  
                <input type="button" value="Cancelar" class="btn-blue" onclick="Cancelar()"> 
            </ul></div>

    </form>
</center>
<jsp:include page="Pie_1.jsp"/>