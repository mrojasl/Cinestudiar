package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCarrito;


import java.io.File;
import java.security.SecureRandom;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Random;

public class CarritoDao {


    Random rn = new Random();
    int range = 50000 - 10 + 1;
    int compraunidocomprafuncion =  rn.nextInt(range) + 10;


    public ArrayList<BCarrito> listarUsuario(){

        ArrayList<BCarrito> listausuarios = new ArrayList<>();

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima\n";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("select p.foto,p.nombre,f.fecha,f.hora,sala.nombre_sede,cf.cantidad_por_funcion,f.precio_ticket,u.codigo_pucp,cf.idcompra,sala.aforo_operador,cf.idfuncion,cf.idhistorialdecompras,p.idpelicula from usuarios u\n" +
                     "                     inner join compradefunciones cf on (cf.usuarios_codigo_pucp=u.codigo_pucp)\n" +
                     "                     inner join funciones f on (f.idfuncion=cf.idfuncion)\n" +
                     "                     inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                     "                     inner join salas sala on (sala.idsala=f.idsala)\n" +
                     "                     where u.codigo_pucp=20190421 AND cf.asistencia=4;");) {

            while(rs.next()){
                BCarrito bCarrito = new BCarrito();
                bCarrito.setImagen(rs.getString(1));
                bCarrito.setIdpelicula(rs.getInt(13));
                bCarrito.setNombre_pelicula(rs.getString(2));
                bCarrito.setFecha(rs.getString(3));
                bCarrito.setHora(rs.getString(4));
                bCarrito.setNombre_sede(rs.getString(5));
                bCarrito.setCantidad_funcion(rs.getInt(6));
                bCarrito.setPrecio_ticket(rs.getInt(7));
                bCarrito.setCodigoEstudiante(rs.getString(8));
                bCarrito.setIdcompra(rs.getInt(9));
                bCarrito.setAforoOperador(rs.getInt(10));
                bCarrito.setIdfuncion(rs.getInt(11));
                bCarrito.setHistorialcompra(rs.getInt(12));
                listausuarios.add(bCarrito);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listausuarios;
    }


    public void actualiza(BCarrito idfuncion) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compradefunciones set cantidad_por_funcion=? where idfuncion=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setInt(1, idfuncion.getCantidad_funcion());
            pstmt.setInt(2, idfuncion.getIdfuncion());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void borrarReserva(String codigo) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "delete from compradefunciones where idfuncion = ?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void compra(int cantidad_tickets, double pago_total, String codigo_pucp) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";
        String unique_qr=generateRandomBase64Token(16);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO compras(qr,cantidad_tickets,pago_total,fecha_compra,hora_compra,codigo_pucp) VALUES (?,?,?,now(),now(),?);";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1,unique_qr);
            pstmt.setInt(2, cantidad_tickets);
            pstmt.setDouble(3, pago_total);
            pstmt.setString(4, codigo_pucp);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void yacompro(BCarrito idcompra) {


        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compradefunciones set asistencia=?,idcompra=? where idhistorialdecompras=? and usuarios_codigo_pucp=20190421;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1,5);
            pstmt.setInt(2,idcompra.getIdcompra());
            pstmt.setInt(3, idcompra.getHistorialcompra());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public static String generateRandomBase64Token(int byteLength) {
        SecureRandom secureRandom = new SecureRandom();
        byte[] token = new byte[byteLength];
        secureRandom.nextBytes(token);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(token);
    }


    public void setId00 ( BCarrito carrito){
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "UPDATE compradefunciones set idcompra=? where idfuncion=?;";



        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1,carrito.getIdcompra());
            pstmt.setInt(2,carrito.getIdfuncion() );

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }



}
//check