<jsp:include page="Encabezado.jsp"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width,scale-initial=1">
        <title>JSP Page</title>
        <link href="notificacion/css/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="notificacion/css/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <script src="notificacion/js/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="notificacion/js/js/jquery-ui.js" type="text/javascript"></script>
    <script>
        $(function ()
        {
            $("#ventana").dialog({
               //establecemos propiedades 
               autoOpen:true,
               show:{
                   effect:"explode",
                   duration:1000
               },
               hide:
                       {
                           effect:"explode",
                           duration:1000
                       },
                     
                   });
                   $("#abrirVentana").on("click",function (){
                       $("#ventana").dialog("open")
                   {
                       
                   }
            });
        }); 
        
        function abrirventana ()
        {
           $("#ventana").dialog("open");
            {
                
            }
        }
    </script>
    <body>
        <div id="ventana">
            <p>No pudes tomar asistencia nuevamente</p><br>
        </div>
    </body>
</html>

<jsp:include page="Pie.jsp"/>