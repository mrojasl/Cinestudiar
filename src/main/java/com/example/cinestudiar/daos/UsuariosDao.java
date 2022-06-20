
package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BUser;

import java.sql.*;

/*"select concat(f.fecha,' ',f.hora) as 'Función' , f.precio_ticket as 'precio de funcón',\n" +
        "p.nombre as 'Nombre de pelicula' , p.foto as 'Foto funcion' from \n" +
        "funciones f inner join peliculas p on  (f.idpelicula=p.idpelicula);*/

public class UsuariosDao {

    private static String user = "root";
    private static String pass = "root";
    private static String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

    private static String sql_agregar="insert into usuarios(codigo_pucp,nombre,apellido,rol,dni,telefono,correo,contraseña,fecha_nacimiento,direccion,foto,datos_tarjeta)\n" +
            "values (?,?,?,?,?,?,?,?,?,?,?,?);";
    private static String sql_delete="delete from usuarios where codigo_pucp=?;";

    private static String sql_iniciar="select * from usuarios where nombre=? and contraseña=?;";
    private static String sql_rol="select rol from usuarios where nombre=? and contraseña=?";




    public static void agregar(BUser usuario) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql_agregar)
        ) {

            pstmt.setString(1, usuario.getCodigoPucp());
            pstmt.setString(2, usuario.getNombres());
            pstmt.setString(3, usuario.getApellidos());
            if (usuario.getRol() == null) {
                usuario.setRol("cliente");
            }
            pstmt.setString(4, usuario.getRol());
            pstmt.setString(5, usuario.getDni());
            pstmt.setString(6, usuario.getTelefono());
            pstmt.setString(7, usuario.getCorreo());
            pstmt.setString(8, usuario.getContrasena());
            pstmt.setString(9, usuario.getFechaNacimiento());
            pstmt.setString(10, usuario.getDireccion());
            pstmt.setBlob(11, usuario.getFoto());
            pstmt.setString(12, usuario.getDatosTarjeta());


            pstmt.executeUpdate();
        } catch (SQLException error) {
            error.printStackTrace();
        }


    }
    public static void eliminar(BUser usuario) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql_delete)
        ) {
            pstmt.setString(1, usuario.getCodigoPucp());
            pstmt.executeUpdate();

        } catch (SQLException error) {
            error.printStackTrace();
        }


    }

    public static boolean loguear(BUser usuario) {
        boolean result = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql_iniciar)
        ) {
            pstmt.setString(1, usuario.getNombres());
            pstmt.setString(2, usuario.getContrasena());
            ResultSet rs=pstmt.executeQuery();
            result=rs.next();

        } catch (SQLException error) {
            error.printStackTrace();
        }

        return result;
    }

    public static BUser rol(BUser usuario) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = conn.prepareStatement(sql_rol);
        ) {
            pstmt.setString(1, usuario.getNombres());
            pstmt.setString(2, usuario.getContrasena());

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    usuario.setRol(rs.getString(1));
                    System.out.println(rs.getString(1));
                }
            }


        } catch (SQLException error) {
            error.printStackTrace();
        }

        return usuario;
    }


}
