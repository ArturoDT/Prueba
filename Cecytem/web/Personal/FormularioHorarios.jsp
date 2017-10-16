<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<form class="formoid-default-green" style="background-color:#FFFFFF;font-size:14px;font-family:'Open Sans','Helvetica Neue','Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; margin: 170px; padding-left: 350px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro de Horarios</h2></div>
    <br>
    <div class="">
        <label class="title">Grupos
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="grupo" required="required" style="width: 300px">
                    <option value="">Elige un grupo</option>
                    <option value="101">101</option>
                    <option value="102">102</option>
                    <option value="103">103</option>
                    <option value="104">104</option>
                    <option value="105">105</option>
                    <option value="201">201</option>
                    <option value="202">202</option>
                    <option value="203">203</option>
                    <option value="204">204</option>
                    <option value="205">205</option>
                    <option value="301">301</option>
                    <option value="302">302</option>
                    <option value="303">303</option>
                    <option value="304">304</option>
                    <option value="305">305</option>
                    <option value="401">401</option>
                    <option value="402">402</option>
                    <option value="403">403</option>
                    <option value="404">404</option>
                    <option value="405">405</option>
                    <option value="501">501</option>
                    <option value="502">502</option>
                    <option value="503">503</option>
                    <option value="504">504</option>
                    <option value="505">505</option>
                    <option value="601">601</option>
                    <option value="602">602</option>
                    <option value="603">603</option>
                    <option value="604">604</option>
                    <option value="605">605</option>
                    
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Dias
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="dia" required="required" onchange="validar(this)" style="width: 300px">
                    <option value="">Elige un dia</option>
                    <option value="2">LUNES</option>
                    <option value="3">MARTES</option>
                    <option value="4">MIERCOLES</option>
                    <option value="5">JUEVES</option>
                    <option value="6">VIERNES</option>
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Horas de Entrada
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="he" required="required" onchange="validar(this)" style="width: 300px">
                    <option value="">Elige laa hora</option>
                    <option value="7:00">7:00 am</option>
                    <option value="7:50">7:50 am</option>
                    <option value="8:40">8:40 am</option>
                    <option value="9:50">9:50 am</option>
                    <option value="10:40">10:40 am</option>
                    <option value="11:30">11:30 am</option>
                    <option value="12:20">12:20 pm</option>
                    <option value="13:10">13:10 pm</option>
                    <option value="14:00">14:00 pm</option>
                </select><i></i></span></div></div>
    <div class="">
        <label class="title">Horas de Entrada
            <span class="required">*
            </span>
        </label>
        <div class="null">
            <span>
                <select name="hs" required="required" onchange="validar(this)" style="width: 300px">
                    <option value="">Elige la hora</option>
                    <option value="7:50">7:50 am</option>
                    <option value="8:40">8:40 am</option>
                    <option value="9:30">9:30 am</option>
                    <option value="10:40">10:40 am</option>
                    <option value="11:30">11:30 am</option>
                    <option value="12:20">12:20 am</option>
                    <option value="13:10">13:10 pm</option>
                    <option value="14:00">14:00 pm</option>
                    <option value="14:50">14:50 pm</option>
                </select><i></i></span></div></div>
    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<%
    if (request.getParameter("grupo") != null) {
        int grupo = Integer.parseInt(request.getParameter("grupo"));
        String dia = request.getParameter("dia");
        String aux = request.getParameter("he");
        String aux1 = request.getParameter("hs");
        String h1 = aux + ":00";
        String h2 = aux1 + ":00";
        Time he = Time.valueOf(h1);
        Time hs = Time.valueOf(h2);

        conectarBD c = new conectarBD();
        if (c.conectar()) {
            int gr=0;
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