<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%

%>
<script>
    function asignar(op)
    {
        var idG = op;
        var carrera = $("#carrera").val();
        var turno = $("#turno").val();
        if (carrera == "" || turno == "")
        {
            alertify.error("Es necesario seleccionar Carrera y Turno");
        } else
            alert("si funciono" + idG + carrera + turno);
        {
            $.ajax({
                type: 'POST',
                url: "ProcesaModicaGrupos.jsp",
                data: {idG: idG, idC: carrera, turno: turno},
                success: function (respueta) {
                    $("#respuestaAsg").html(respueta);
                }
            });
        }

    }
    
</script>
<%    conectarBD c = new conectarBD();
    int idG = Integer.parseInt(request.getParameter("idH"));
%>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 170px; padding-left: 120px; max-width:780px;" 
      method="POST">
    <div class="">
        <label class="title"><h2>Editar Carrera-Grupo</h2>
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
                    <%
                        Object[] filas = new Object[2];
                        Object[] filas1 = new Object[2];

                        int verf = 0;
                        String turno = "";
                        int idC = 0;
                        int idc = 0;
                        if (c.conectar()) {
                            ResultSet res = c.consultas("Select grupos.Grupo, grupos.Carrera, grupos.Turno, grupos.Semestre from grupos where Id_Grupo=" + idG);
                            if (res != null) {

                                while (res.next()) {

                                    filas[0] = res.getInt("Grupo");
                                    verf = res.getInt("Semestre");
                                    idC = res.getInt("Carrera");
                                    turno = res.getString("Turno");
                    %>

                    <tr>

                        <td><%=filas[0]%></td>
                        <td>

                            <div class="">
                                <label class="title">Selecciona la nueva Carrera
                                    <span class="required">*
                                    </span>
                                </label>
                                <div class="null">
                                    <span>
                                        <select required="required" style="width: 250px" id="carrera">
                                            <option value="">Carreras</option>
                                            <%
                                                if (c.conectar()) {
                                                    ResultSet res2 = c.consultas("Select * from carrera");
                                                    if (res2 != null) {

                                                        while (res2.next()) {
                                                            idc = res2.getInt("Id_Carrera");
                                                            filas1[1] = res2.getString("nombreCarrera");
                                            %>
                                            <option value="<%=idc%>">
                                                <%
                                                    if (idC == idc) {
                                                        out.println("Carrera Actual:" + filas1[1]);
                                                    } else {
                                                %>
                                                <%=filas1[1]%></option>
                                                <%
                                                                }

                                                            }
                                                        }
                                                    }
                                                %>
                                        </select><i></i></span></div></div>
                        </td>
                        <td>
                            <div class="">
                                <label class="title">Selecciona el nuevo Turno
                                    <span class="required">*
                                    </span>
                                </label>

                                <div class="null">
                                    <span>
                                        <select id="turno" required="required" style="width: 250px" onchange="grupos(this)">
                                            <option value="">Turnos</option>  
                                            <option value="Matutino">Matutino</option>  
                                            <option value="Vespertino">Vespertino</option>
                                        </select><i></i></span></div></div>
                        </td>
                        <td><div class="submit"><input type="button" value="Enviar" onclick="asignar(<%=idG%>)"/></div></div></td>

                    </tr>
                </tbody>
            </table>

        </div>   
</form>
<%
            }
        }
    }
%>
<div id="respuestaAsg" style="margin: 180px; 
     padding-left: 250; 
     background: #31708f;max-width: 
     600px; width: auto; border-radius: 50px;"></div>

