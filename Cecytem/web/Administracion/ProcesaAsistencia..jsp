<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="logica.conectarBD"%>
<%
    conectarBD c=new conectarBD();
     Calendar cal = Calendar.getInstance();
        int dia = cal.get(cal.DAY_OF_WEEK);
        Time horaE=null;
    if(c.conectar())
    {
        out.println("Conectado");
        Object[] filas= new Object[2];
        ResultSet res = c.consultas("select grupos.Grupo, horarios.HoraEntrada from grupos,horarios,periodoesc where grupos.Id_Grupo=horarios.Grupo and grupos.Id_Periodo=periodoesc.Id_Periodo and periodoesc.Estado="+1+" and horarios.Dia="+dia);
        {
            if(res!=null)
            {
                while(res.next())
                {
                filas[0]=res.getInt("Grupo");
                horaE=res.getTime("HoraEntrada");
                out.println(filas[0]);
                out.println(horaE);
                out.println("<br>");
                }
            }else
            {
                out.println("Error");
            }
            
        }
    }
    c.desconectar();
%>