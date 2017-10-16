<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%

%>
<script>
    function asignar(id)
    {
        var idS = id.valueOf();
        var carrera = $("#carrera" + idS).val();
        var turno = $("#turno" + idS).val();
        if (carrera == "" || turno == "")
        {
            alertify.error("Es necesario seleccionar Carrera y Turno");
        } else
        {
            $.ajax({
                type: 'POST',
                url: "ProcesaCarreraG.jsp",
                data: {n: idS, idC: carrera, turno: turno},
                success: function (respueta) {
                    $("#respuestaAsg").html(respueta);
                }
            });
        }

    }
</script>
<%    conectarBD c = new conectarBD();
    int se = Integer.parseInt(request.getParameter("n"));
    int idPe = 0;
    int idG = 0;
    String periodo = "";

    if (c.conectar()) {
        ResultSet res1 = c.consultas("Select periodoesc.Id_periodo,periodoesc.periodo from periodoesc where periodoesc.Estado=" + 1);
        if (res1 != null) {
            while (res1.next()) {
                idPe = res1.getInt("Id_periodo");
            }
        }
       
        if (idPe > 0) {
            ResultSet result = c.consultas("Select Id_Grupo from grupos where Semestre=" + se + " and Id_Periodo=" + idPe);
            if (result != null) {
                while (result.next()) {
                    idG = result.getInt("Id_Grupo");
                }
            }
            if (idG > 0) {
                %>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 170px; padding-left: 120px; max-width:780px;" 
      method="POST">
    <div class="">
        <label class="title"><h2>Asignar Carrera-Grupo</h2>
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
                        if (c.conectar()) {
                            ResultSet res = c.consultas("Select grupos.Grupo, grupos.Semestre from grupos, periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                    + " periodoesc.Estado=" + 1 + " and grupos.Semestre=" + se + " and grupos.Carrera=0");
                            if (res != null) {

                                while (res.next()) {

                                    filas[0] = res.getInt("Grupo");
                                    verf = res.getInt("Semestre");
                    %>

                    <tr>

                        <td><%=filas[0]%></td>
                        <td>

                            <div class="">
                                <label class="title">Selecciona la Carrera
                                    <span class="required">*
                                    </span>
                                </label>
                                <div class="null">
                                    <span>
                                        <select required="required" style="width: 250px" id="carrera<%=filas[0]%>">
                                            <option value="">Carreras</option>
                                            <%
                                                if (c.conectar()) {
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
                                        <select id="turno<%=filas[0]%>" required="required" style="width: 250px" onchange="grupos(this)">
                                            <option value="">Turnos</option>
                                            <option value="Matutino">Matutino</option>
                                            <option value="Vespertino">Vespertino</option>
                                        </select><i></i></span></div></div>
                        </td>
                        <td><div class="submit"><input type="button" value="Enviar" onclick="asignar(<%=filas[0]%>)"/></div></div></td>

                    </tr>
                    <%
                            }
                        } else {
                        }
                        if (verf <=0) {
                    %>
                <script>
                    alertify.success("Los Grupos fueron asignados correctamente");

                    function redireccionando()
                    {
                        location.href = "TablaGrupos.jsp";

                    }
                    setTimeout("redireccionando()", 1500);
                </script>
                <%
                        }
                    }
                %>


                </tbody>
            </table>

        </div>   
</form>
<div id="respuestaAsg"></div>



<%
                
                

            } else {
%>
<script>
    alertify.error("Es necesario Registrar Grupos al Semetre: " + <%=se%>);

    function redireccionando()
    {
        location.href = "CicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 1500);
</script>
<%
            }
        }
    }
%>
