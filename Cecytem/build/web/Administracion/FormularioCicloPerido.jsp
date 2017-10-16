<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<jsp:include page="Encabezado.jsp"/>
<%
    conectarBD c = new conectarBD();
    if (c.conectar()) {
        int id = 0;
        ResultSet res = c.consultas("Select * from años");
        if (res != null) {
            while (res.next()) {
                id = res.getInt("id_Año");
            }
            if (id > 0) {

            } else {
                for (int i = 0; i < 51; i++) {
                    int cont = 1990 + i;

                    if (c.ejecutaSQL("Insert into años values (null," + cont + ")")) {

                    }
                }

            }
        }
    }
%>
<script>
    function mostrar(op)
    {

    }
    function confirmaA()
    {
        alertify.confirm("Deseas Desactivar el semestre anterior", function respuesta() {
            if (respuesta())
            {
                alert("Desactivar");
            } else
            {
                alert("No Desactivar");
            }
        });
    }
</script>
<form class="formoid-default-green" style="background-color:#FFFFFF;
      font-size:14px;font-family:'Open Sans','Helvetica Neue',
      'Helvetica',Arial,Verdana,sans-serif;color:#666666;min-width:150px; 
      margin: 180px; padding-left: 5px; max-width:780px;" 
      method="POST">
    <div class="title"><h2>Registro del Ciclo-Periodo Escolar</h2></div>

    <div class="">
        <label class="title">Selecciona un Año
            <span class="required">*
            </span>
        </label>

        <div class="null">
            <span>
                <select name="ciclo" required="required" style="width: 250px">
                    <option value="">Años</option>
                    <%
                            ResultSet res = c.consultas("Select * from años");

                            if (c.conectar()) {
                            
                            if (res != null) {
                                Object[] filas = new Object[1];

                                while (res.next()) {
                                    filas[0] = res.getInt("Año");
                                    %>
                                    <option><%=filas[0]%></option>
                    <%
                                }
                            }
                        }


                    %>
                </select><i></i></span></div></div>
                    <div class="">
        <label class="title">Selecciona un Periodo
            <span class="required">*
            </span>
        </label>

        <div class="null">
            <span>
                <select name="numeroP" required="required" style="width: 250px">
                    <option value="">Periodo</option>
                    <option value="1">Primer Semestre del Año</option>
                    <option value="2">Segundo Semestre del Año</option>
                </select><i></i></span></div></div>
    <div class="element-input">
        <label class="title">Ingresa el nombre el Periodo ejemplo:(Febrero 2000-Junio 2000)
            <span class="required">
                *</span>
        </label>
        <input class="null" type="text" name="periodo" required="required" style="width: 300px"/>
    </div>

    <div class="submit"><input type="submit" value="Enviar"/></div></form><p class="frmd"><a href="http://formoid.com/v29.php">html forms</a> Formoid.com 2.9</p><script type="text/javascript" src="formularioregistro_files/formoid1/formoid-default-green.js"></script>

<div id="respuesta"> </div>
<%    if (request.getParameter ( "ciclo") != null) {

     String ciclo = request.getParameter("ciclo");
     int numerpP = Integer.parseInt(request.getParameter("numeroP"));
     String cont= request.getParameter("numeroP");
    
     int verif=0;
     String suma=ciclo+cont;
     out.println(suma);
      int unico=Integer.parseInt(suma);
     if(c.conectar())
     {
     String periodo = request.getParameter("periodo");
     ResultSet ver = c.consultas("Select Id_Periodo from periodoesc where idUnico="+unico);
     if(ver!=null)
     {
         while(ver.next())
         {
             verif=ver.getInt("Id_Periodo");
            
         }
     }
      out.println(verif);
     if(verif>0)
     {
         %>
         <script>
             alertify.error("Ya existe un periodo igual asignado al Año");
         </script>
         <%
     }else
{
    if(c.conectar())
    {
        if(c.ejecutaSQL("Insert into periodoesc values(null,'"+ciclo+"','"+periodo+"',"+numerpP+","+0+","+0+",'"+ciclo+cont+"')"))
        {
        %>
         <script>
             alertify.success("Registro Correcto");
             function redireccionando()
    {
        location.href = "MostrarCicloPeriodo.jsp";

    }
    setTimeout("redireccionando()", 1500);
         </script>
         <%
        }else
        {
            %>
         <script>
             alertify.error("Error al registrar");
         </script>
         <%
        }
    }
}
    
    }
}
%>


<jsp:include page="Pie_1.jsp"/>
