package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCarrito;


import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class CarritoDao {



    public ArrayList<BCarrito> listarUsuario(){
        ArrayList<BCarrito> listausuarios = new ArrayList<>();

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
             ResultSet rs = stmt.executeQuery("select p.foto,p.nombre,f.fecha,f.hora,sala.nombre_sede,cf.cantidad_por_funcion,f.precio_ticket,u.codigo_pucp,cf.idcompra,sala.aforo_operador from usuarios u\n" +
                     "                     inner join compradefunciones cf on (cf.usuarios_codigo_pucp=u.codigo_pucp)\n" +
                     "                     inner join funciones f on (f.idfuncion=cf.idfuncion)\n" +
                     "                     inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                     "                     inner join salas sala on (sala.idsala=f.idsala)\n" +
                     "                     where u.codigo_pucp=20195957 AND cf.asistencia=4;");) {

            while(rs.next()){
                BCarrito bCarrito = new BCarrito();
                bCarrito.setImagen(rs.getString(1));
                bCarrito.setNombre_pelicula(rs.getString(2));
                bCarrito.setFecha(rs.getString(3));
                bCarrito.setHora(rs.getString(4));
                bCarrito.setNombre_sede(rs.getString(5));
                bCarrito.setCantidad_funcion(rs.getInt(6));
                bCarrito.setPrecio_ticket(rs.getInt(7));
                bCarrito.setCodigoEstudiante(rs.getString(8));
                bCarrito.setIdcompra(rs.getInt(9));
                bCarrito.setAforoOperador(rs.getInt(10));
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
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compradefunciones set cantidad_por_funcion=? where idcompra=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setInt(1, idfuncion.getCantidad_funcion());
            pstmt.setInt(2, idfuncion.getIdcompra());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void borrarReserva(String codigo) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "delete from compradefunciones where idcompra = ?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


}
