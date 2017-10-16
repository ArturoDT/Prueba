/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author arturo
 */
public class conectarBD {

    private Connection cadenaConexion;
    private String url, user, password;
    //creamos el metodo que iniciara la vriable de conexion 
    private boolean conexion, consultaUsuarios;
    private boolean registroE;
    private boolean eliminar, registroI;
    private int tipoUsuario;
    private ResultSet consultaLibros, consultaUsuario, consultar;

    public boolean conectar() {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
            try {

                url = "jdbc:mysql://localhost/registro";
                user = "root";
                password = "123456";
                cadenaConexion = DriverManager.getConnection(url, user, password);
                conexion = true;
            } catch (Exception e) {
                conexion = false;
                System.out.println("No hay libreria");
            }

        } catch (ClassNotFoundException e) {
            conexion = false;
            System.out.println("Error en la conexion");
        }
        return conexion;
    }

    public void desconectar() {
        try {
            if (cadenaConexion != null) {
                cadenaConexion.close();
            }
        } catch (Exception e) {

        }
    }

    public ResultSet consultarUsuarios(String nombre, String Contraseña) {
        try {
            String consulta = "select *from usuarios where User='" + nombre + "'and Password='" + Contraseña + "'";
            Statement sentencia = cadenaConexion.createStatement();
            consultaUsuario = sentencia.executeQuery(consulta);
        } catch (Exception e) {
            consultaLibros = null;
        }
        return consultaUsuario;
    }

    public boolean ejecutaSQL(String sql) {
        try {
            Statement stEjecutar = cadenaConexion.createStatement();
            stEjecutar.executeUpdate(sql);
            registroI = true;
        } catch (Exception e) {
            registroI = false;
        }
        return registroI;
    }

    public boolean regA(int nc, String nombre, String ap, String am, int grupo, String tele, String sex, String semes, String car) {

        try {
            //declaramos una variable de tipo insert
            String insertarEspecialodad = "Insert into alumno values (?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pstEspecialidad = cadenaConexion.prepareStatement(insertarEspecialodad);
            //prepararamos una variable
            //pasamos los parametros para guardarlos en la base de datos;
            pstEspecialidad.setInt(0, nc);
            pstEspecialidad.setString(1, nombre);
            pstEspecialidad.setString(2, ap);
            pstEspecialidad.setString(3, am);
            pstEspecialidad.setInt(4, 1);
            pstEspecialidad.setInt(5, 1);
            pstEspecialidad.setInt(6, 1);
            pstEspecialidad.setString(7, sex);
            pstEspecialidad.setString(8, semes);
            pstEspecialidad.setString(9, tele);
            pstEspecialidad.setString(10, car);
            pstEspecialidad.setInt(11, 1);
            //ejecutamos la sentencia
            pstEspecialidad.executeUpdate();
            registroE = true;
        } catch (Exception e) {
            registroE = false;
        }
        return registroE;
    }
        public ResultSet consultas(String sql) {
        try {
            //Variable para ejecutar los cureis
            //creamos una variable para ejecutar los querys.
            Statement stConsulta = cadenaConexion.createStatement();
            //guradamos el contenido de la taba en la variable consultaEspecialidad
            consultar = stConsulta.executeQuery(sql);
        } catch (Exception e) {

            consultar = null;
        }

        return consultar;
    }
//Buscar usuario
            public int buscarUsuario(String user, String password) {
        try {
            String sqlBusca = "select *from usuarios where "
                    + "User='" + user + "' and Password='" + password + "'";

            Statement sqlEjecutar = cadenaConexion.createStatement();
            ResultSet resultado = sqlEjecutar.executeQuery(sqlBusca);
            if (resultado != null) {
                int contador = 0;
                while (resultado.next()) {
                    contador++;
                    tipoUsuario = resultado.getInt("Nivel");

                }
                if (contador != 1) {
                    tipoUsuario = -1;
                }

            }
        } catch (Exception e) {
            tipoUsuario = -1;
        }
        return tipoUsuario;

    }


}
