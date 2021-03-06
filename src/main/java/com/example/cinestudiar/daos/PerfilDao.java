package com.example.cinestudiar.daos;


import com.example.cinestudiar.beans.BPerfil;
import com.example.cinestudiar.beans.BUsuarioFuncion;

import java.sql.*;
import java.util.ArrayList;

public class PerfilDao extends BaseDao{

    private static String sql_select1="select p.idpelicula,p.nombre,f.fecha,f.hora,sala.nombre_sede,cf.cantidad_por_funcion,cf.idhistorialdecompras,cf.idcompra from usuarios u\n" +
            "                     inner join compradefunciones cf on (cf.usuarios_codigo_pucp=u.codigo_pucp)\n" +
            "                     inner join funciones f on (f.idfuncion=cf.idfuncion)\n" +
            "                     inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
            "                     inner join salas sala on (sala.idsala=f.idsala)\n" +
            "                     where u.codigo_pucp=? AND cf.asistencia=5 order by f.fecha desc;";
    private static String sql_select2="select concat(u.nombre,' ',u.apellido) as `nombre`, " +
            "u.codigo_pucp,u.telefono,u.dni,u.direccion,u.correo,u.foto,u.contraseña from usuarios u\n" +
            "where u.codigo_pucp=?;";


    public ArrayList<BUsuarioFuncion> listarFunciones(String codigo_pucp) {
        ArrayList<BUsuarioFuncion> listausuarios = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_select1);) {
            pstmt.setString(1,codigo_pucp);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                while (rs.next()) {
                    BUsuarioFuncion bUsuarioFuncion=new BUsuarioFuncion();
                    bUsuarioFuncion.setIdpelicula(Integer.parseInt(rs.getString(1)));
                    bUsuarioFuncion.setNombrepelicula(rs.getString(2));
                    bUsuarioFuncion.setFechapelicula(rs.getString(3));
                    bUsuarioFuncion.setHorapelicula(rs.getString(4));
                    bUsuarioFuncion.setSede(rs.getString(5));
                    bUsuarioFuncion.setCantidadtickets(Integer.parseInt(rs.getString(6)));
                    bUsuarioFuncion.setHistorialcompra(rs.getString(7));
                    bUsuarioFuncion.setIdCompras(Integer.parseInt(rs.getString(8)));
                    listausuarios.add(bUsuarioFuncion);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listausuarios;
    }



    public ArrayList<BPerfil> listarUsuario(String codigo_pucp) {
        ArrayList<BPerfil> listausuarios = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_select2);) {
            pstmt.setString(1,codigo_pucp);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                while(rs.next()){
                    BPerfil bPerfil= new BPerfil();
                    bPerfil.setNombre(rs.getString(1));
                    bPerfil.setCodigopucp(rs.getString(2));
                    bPerfil.setNumero(rs.getString(3));
                    bPerfil.setDni(Integer.parseInt(rs.getString(4)));
                    bPerfil.setDireccion(rs.getString(5));
                    bPerfil.setCorreo(rs.getString(6));

                    bPerfil.setContrasenha(rs.getString(8));

                    listausuarios.add(bPerfil);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listausuarios;
    }

    public void actualizatelefono(BPerfil tel) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE usuarios set telefono=? where codigo_pucp=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, tel.getNumero());
            pstmt.setString(2, tel.getCodigopucp());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void actualizadireccion(BPerfil dir) {
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE usuarios set direccion=? where codigo_pucp=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setString(1, dir.getDireccion());
            pstmt.setString(2, dir.getCodigopucp());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void actualizacontra(BPerfil con) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE usuarios set contraseña=sha2(?,256) where codigo_pucp=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setString(1, con.getContrasenha());
            pstmt.setString(2, con.getCodigopucp());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }



    public void actualizafoto(BPerfil fot) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE usuarios set foto=? where codigo_pucp=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setBlob(1, fot.getFotoperfil());
            pstmt.setString(2, fot.getCodigopucp());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }





}
