<%@page import="logica.conectarBD"%>
<%@page import="java.sql.ResultSet"%>
<%@page session="true"%>
<!DOCTYPE html>
<html >
    <head>
         <div id="ventana" style="display: none">
            <p>El usuario o contraseña son incorrectos.<br><br>
            Vuelve a intentarlo</p><br>
        </div>
    <div id="ventana1" style="display: none">
            <p>Lo sentimos tu cuenta a sido Desactivada.<br><br>
            Por Favor solicitar la Activacion con el Administrador</p><br>
        </div>
        <meta charset="UTF-8">
        <title>Inicio de Sesión</title>  
        <link rel="stylesheet" href="login/css/reset.min.css">
        <link rel="stylesheet" href="login/css/styles.css">
           <link href="notificacion/css/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="notificacion/css/css/style.css" rel="stylesheet" type="text/css"/>
    </head>
     <script src="notificacion/js/js/jquery-1.12.4.js" type="text/javascript"></script>
    <script src="notificacion/js/js/jquery-ui.js" type="text/javascript"></script>
    <body style="background-color: #073A52">
        <br><br>
    <center><h2 style="size: A4">Colegio de Estudios Cientificos y Tecnologicos del Estado de Mexico</h2></center>
        <br>
    <center><h1>Inicio de Sesion</h1></center>
        <div class="login">
            <header class="login-header"><span class="text">
                    <img src="img/descarga (3)_1.jpg" height="200" style="border-image-slice: fill; border-image:radial-gradient; border-radius: 25px; ">
                </span><span class="loader"></span></header>
            <form class="login-form">
                <input type="text" placeholder="Usuario" class="login-input" name="txtUsuario"/>
                <input type="password" placeholder="Password" class="login-input" name="txtPassword"/>
                <br>
                <a href="Registropaciente.jsp">Registrate</a>
                
                <button type="submit" class="login-btn">Ingresar</button>	
            </form>
           
        </div>
        <%
            Object [] fila = new Object[1];
            if (request.getParameter("txtUsuario") != null) {
                String user, password;
                int status=0;
                user = request.getParameter("txtUsuario");
                password = request.getParameter("txtPassword");
                conectarBD cdb = new conectarBD();
                if (cdb.conectar()) {
            int tipo = cdb.buscarUsuario(user, password);
            ResultSet res = cdb.consultas("Select Status from usuarios where User='"+user+"' and Password='"+password+"'");
            if(res!=null)
            {
                while(res.next())
                {
                    status=res.getInt("Status");
                }
            }
            
            
           if(tipo>0)
           {
               if(status==1)
            {
               switch (tipo) {
                case 1:
                    HttpSession sesionAdmin = request.getSession();
                    sesionAdmin.setAttribute("sesionAdministrador", user);
        %>
        <script lang="JavaScript">
            location.href = "Administracion/index.jsp";
//window.location("");       </script>
            <%
                    break;
                case 2:

                    HttpSession sesionDoctor = request.getSession();
                    sesionDoctor.setAttribute("sesionPersonal", user);
            %>
        <script lang="JavaScript">
            location.href = "Personal/index.jsp";
//window.location("");       </script>
            <%
                                break;
                                case 3:

                    HttpSession sesionPaciente = request.getSession();
                    sesionPaciente.setAttribute("sesionMaestros", user);
            %>
        <script lang="JavaScript">
            location.href = "Paciente/index.jsp?clave=<%=fila[0]%>";
//window.location("");       </script>
            <%
                                break;

                        }
%> 
            
            
            
            <%
                }else
{
%>
      <script>
        $(function ()
        {
            $("#ventana1").dialog({
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
<%

}
               
               
           }else
           {
               %>
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
    <%
           }


                    }
                }


            %>
        <script src='js/jquery.min.js'></script>  
    </body>
</html>
