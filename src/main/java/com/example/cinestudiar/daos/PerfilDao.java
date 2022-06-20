package com.example.cinestudiar.daos;


import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BPerfil;

import java.sql.*;
import java.util.ArrayList;

public class PerfilDao {

    public ArrayList<BPerfil> listarUsuario(){

        ArrayList<BPerfil> listausuarios = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select concat(u.nombre,' ',u.apellido) as `nombre`, u.codigo_pucp,u.telefono,u.dni,u.direccion,u.correo,u.foto,u.contraseña from usuarios u\n" +
                     "where u.codigo_pucp='20190421';");) {

            while(rs.next()){
                BPerfil bPerfil= new BPerfil();
                bPerfil.setNombre(rs.getString(1));
                bPerfil.setCodigopucp(rs.getString(2));
                bPerfil.setNumero(rs.getString(3));
                bPerfil.setDni(Integer.parseInt(rs.getString(4)));
                bPerfil.setDireccion(rs.getString(5));
                bPerfil.setCorreo(rs.getString(6));
                bPerfil.setFotoperfil(rs.getBlob(7));
                bPerfil.setContrasenha(rs.getString(8));

                listausuarios.add(bPerfil);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listausuarios;
    }

    public void actualizatelefono(BPerfil tel) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

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
}
