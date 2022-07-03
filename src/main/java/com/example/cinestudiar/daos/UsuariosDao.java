
package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BUser;

import java.io.InputStream;
import java.sql.*;

/*"select concat(f.fecha,' ',f.hora) as 'Función' , f.precio_ticket as 'precio de funcón',\n" +
        "p.nombre as 'Nombre de pelicula' , p.foto as 'Foto funcion' from \n" +
        "funciones f inner join peliculas p on  (f.idpelicula=p.idpelicula);*/

public class UsuariosDao extends BaseDao{
    private static String sql_agregar="insert into usuarios(codigo_pucp,nombre,apellido,rol,dni,telefono,correo,contraseña,fecha_nacimiento,direccion,foto,datos_tarjeta)\n" +
            "values (?,?,?,?,?,?,?,sha2(?,256),?,?,?,?);";
    private static String sql_delete="delete from usuarios where codigo_pucp=?;";

    private static String sql_iniciar="select * from usuarios where codigo_pucp=? and contraseña=sha2(?,256);";
    private static String sql_rol="select rol from usuarios where codigo_pucp=? and contraseña=sha2(?,256)";


    public void agregar(BUser usuario) {

        try (Connection conn = this.getConnection();
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
    public  void eliminar(BUser usuario) {

        try (Connection conn =this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_delete)
        ) {
            pstmt.setString(1, usuario.getCodigoPucp());
            pstmt.executeUpdate();

        } catch (SQLException error) {
            error.printStackTrace();
        }


    }
    public  boolean loguear(BUser usuario) {
        boolean result = false;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_iniciar)
        ) {

            pstmt.setString(1, usuario.getCodigoPucp());
            pstmt.setString(2, usuario.getContrasena());
            ResultSet rs=pstmt.executeQuery();
            result=rs.next();

        } catch (SQLException error) {
            error.printStackTrace();
        }

        return result;
    }

    public BUser buscarPorId(String codigo_pucp) {
        BUser usuario = null;

        String sql = "select * from usuarios where codigo_pucp = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo_pucp);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    usuario = new BUser();
                    usuario.setCodigoPucp(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }
    public BUser buscarPorCorreo(String correo) {
        BUser usuario = null;

        String sql = "select * from usuarios where correo = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, correo);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    usuario = new BUser();
                    usuario.setCorreo(rs.getString(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }


    public BUser validarPass(String password, String codigoPucp){
        BUser usuario = null;

        String sql = "select * from usuarios where codigo_pucp=? and contraseña=sha2(?,256)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1,codigoPucp);
            pstmt.setString(2,password);
            try(ResultSet rs = pstmt.executeQuery()){
                if(rs.next()){
                    usuario = new BUser();
                    usuario.setCodigoPucp(rs.getString(1));
                    usuario.setNombres(rs.getString(2));
                    usuario.setApellidos(rs.getString(3));
                    usuario.setRol(rs.getString(4));
                    usuario.setDni(rs.getString(5));
                    usuario.setTelefono(rs.getString(6));
                    usuario.setCorreo(rs.getString(7));
                    usuario.setContrasena(rs.getString(8));
                    usuario.setFechaNacimiento(rs.getString(9));
                    usuario.setDireccion(rs.getString(10));
                    usuario.setDatosTarjeta(rs.getString(12));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    public BUser rol(BUser usuario) {
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_rol);
        ) {
            pstmt.setString(1, usuario.getCodigoPucp());
            pstmt.setString(2, usuario.getContrasena());

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()) {
                    usuario.setRol(rs.getString(1));
                }
            }


        } catch (SQLException error) {
            error.printStackTrace();
        }

        return usuario;
    }






}
