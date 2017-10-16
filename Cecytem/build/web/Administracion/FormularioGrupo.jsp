<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%

%>
<script>
    function asignar()
    {
        alert("sifunciono");
        var grupo = $("#grupo").val();
        var semestre = $("#semestre").val();
        var carrera = $("#carrera").val();
        var turno = $("#turno").val();
        if (carrera == "" || turno == "" || grupo == "" || semestre == "")
        {
            alertify.error("Es necesario seleccionar Grupo, Semestre, Carrera y Turno");
        } else

        {
            alert("si funciono" + grupo + carrera + turno);
            var opc = "registrargrupo";
            $.ajax({
                type: 'POST',
                url: "Procesaborrar.jsp",
                data: {grupo: grupo, idC: carrera, turno: turno, semestre: semestre, opcion: opc},
                success: function (respueta) {
                    $("#respuestaAsg").html(respueta);
                }
            });
        }

    }
function a()
{
                    function redireccionando()
                    {
                       var divMostrar = document.getElementById("validacion");
                       return divMostrar.style.display = "none"; 

                    }
                    setTimeout("redireccionando()", 1000);
                }           
</script>
<%    conectarBD c = new conectarBD();
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 170px; padding-left: 0px; max-width:780px;" 
      method="POST" id="miFrom">
    <div class="">
        <label class="title"><h2>Registro Nuevo Grupo-Carrera</h2>
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <table border="7" width="4" cellspacing="4" cellpadding="4">
                <thead>
                    <tr>
                        <th>Grupos</th>
                        <th>Carrera</th>
                        <th>Turnos</th>
                        <th>Guardar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <td>
                            <label class="title">Ingresa grupo ejemplo(101..)
                                <span class="required">*
                                </span>
                            </label>
                            <input type="number" required="required" id="grupo" style="width: 210px" onkeypress="return validarNumeros(event)" ></td>

                        </td>
                        <td>
                            <div class="">
                                <label class="title">Semestres
                                    <span class="required">*
                                    </span>
                                </label>
                                <div class="null">
                                    <span>
                                        <select id="semestre" required="required" style="width: 150px">
                                            <option value="">Semestres</option>
                                            <option value="1">1°</option>
                                            <option value="2">2°</option>
                                            <option value="3">3°</option>
                                            <option value="4">4°</option>
                                            <option value="5">5°</option>
                                            <option value="6">6°</option>
                                        </select><i></i></span></div></div>
                        </td>
                        <td>
                            <div class="">
                                <label class="title">Selecciona la Carrera
                                    <span class="required">*
                                    </span>
                                </label>
                                <div class="null">
                                    <span>
                                        <select required="required" style="width: 170px" id="carrera">
                                            <option value="">Carreras</option>
                                            <%
                                                if (c.conectar()) {
                                                    Object[] filas1 = new Object[2];
                                                    ResultSet res2 = c.consultas("Select * from carrera");
                                                    if (res2 != null) {

                                                        while (res2.next()) {
                                                            filas1[0] = res2.getInt("Id_Carrera");
                                                            filas1[1] = res2.getString("nombreCarrera");
                                            %>
                                            <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                                        </select><i></i></span></div></div>
                        </td>
                        <td>
                            <div class="">
                                <label class="title">Selecciona el Turno
                                    <span class="required">*
                                    </span>
                                </label>

                                <div class="null">
                                    <span>
                                        <select id="turno" required="required" style="width: 160px">
                                            <option value="">Turnos</option>  
                                            <option value="Matutino">Matutino</option>  
                                            <option value="Vespertino">Vespertino</option>
                                        </select><i></i></span></div></div>
                        </td>
                        <td><div class="submit"><input type="button" value="Enviar" onclick="asignar()" /></div></div></td>

                    </tr>
                </tbody>
            </table>

        </div>   
</form>
<div id="validacion" style="margin: 10px; 
     padding-left: 250; 
     background: #DA1111;max-width: 
     180px; width: auto; border-radius: 50px; display: none">Solo se permite numeros</div>                            
<div id="respuestaAsg" style="margin: 180px; 
     padding-left: 250; 
     background: #31708f;max-width: 
     600px; width: auto; border-radius: 50px;"></div>

