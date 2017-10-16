<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Horarios</h2></div>
    <br>
     <div class="">
        <label class="title">Selecciona un Grupo
            <span class="required">*
            </span>
        </label>

        <div class="null">
            <span>
                <select required="required" style="width: 250px" name="grupos">
                    <option value="">Grupos</option>
                     <%
                                                conectarBD c = new conectarBD();
                                                if (c.conectar()) {
                                                    Object[] filas1= new Object[2];
                                                    ResultSet res1 = c.consultas("Select * from grupos,periodoesc where grupos.Id_Periodo=periodoesc.Id_Periodo and "
                                                            + " periodoesc.Estado="+1);
                                                    if (res1 != null) {
                                                       
                                                        while (res1.next()) {
                                                            filas1[0] = res1.getInt("Id_Grupo");
                                                            filas1[1] = res1.getInt("Grupo");
                                            %>
                                            <option value="<%=filas1[0]%>"><%=filas1[1]%></option>
                                            <%
                                                        }
                                                    }
                                                }
                                            %>
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Dias
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="dia" required="required" onchange="validar(this)" style="width: 250px">
                    <option value="">Elige un dia</option>
                    <option value="2">LUNES</option>
                    <option value="3">MARTES</option>
                    <option value="4">MIERCOLES</option>
                    <option value="5">JUEVES</option>
                    <option value="6">VIERNES</option>
                </select><i></i></span></div></div>
                <div class="null">
                <label class="title">Horas de Entrada
        <span class="required">*
        </span>
    </label>
    <div class="null">
        <span>
            <input  type="time" required="required" name="he" style="width: 250px">
           <i></i></span></div></div>
<div class="">
    <label class="title">Horas de Salida
        <span class="required">*
        </span>
    </label>
    <div class="null">
        <span>
            <input  type="time" required="required" name="hs" style="width: 250px">
           <i></i></span></div></div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("grupos") != null) {
        int grupo = Integer.parseInt(request.getParameter("grupos"));
        String dia = request.getParameter("dia");
        String aux = request.getParameter("he");
        String aux1 = request.getParameter("hs");
        String h1 = aux + ":00";
        String h2 = aux1 + ":00";
        Time he = Time.valueOf(h1);
        Time hs = Time.valueOf(h2);

        if (c.conectar()) {
            int gr=0;
            out.println("Conectado" + grupo + " " + dia + " " + he + " " + hs);
   ResultSet resul=c.consultas("Select Grupo from horarios where Grupo=" + grupo +" and Dia="+dia);
   if(resul!=null)
   {
       while(resul.next())
       {
           gr=resul.getInt("Grupo");
       }
   }
   if(gr!=0)
   {
       %>
<script>
alertify.error("No se puede realizar el registro por que el grupo y dia ya tienen asignado un\n\
horario");
   
</script>
<%
   }else
{
            if (he.before(hs)) {
                out.println("Es mas menor");
                if (c.ejecutaSQL("Insert into horarios values(null,'" + grupo + "','" + dia + "','" + he + "','" + hs + "')")) {
%>
<script>
                    alertify.success("Registro Realizado");
</script>
<%            } else {
%>
<script>
    alertify.error("Registro no Realizado");
   
</script>
<%
    }

} else {
%>
<script>
    alertify.error("No se puede realizar el registro \n\
la hora de entrada debe ser\n\
 menor que la hora de salida");
</script>
<%
            }
}

        }
    }
%>

<jsp:include page="Pie.jsp"/>