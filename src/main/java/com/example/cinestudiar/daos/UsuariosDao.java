package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BComprafuncion;
import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BUser;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;

public class UsuariosDao {

    public static void actualizar(BUser cliente) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "update usuarios set codigo_pucp=?,nombre=?,apellido=?,telefono = ?" +
                ", direccion =?,rol=?,tarjeta=?,correo=?,fecha_nacimiento=?;";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, cliente.getCodigoPucp());
            pstmt.setString(2, cliente.getNombres());
            pstmt.setString(3, cliente.getApellidos());
            pstmt.setString(4, cliente.getTelefono());
            pstmt.setString(5, cliente.getDireccion());
            pstmt.setString(6, cliente.getRol());
            pstmt.setString(7, cliente.getCorreo());
            pstmt.setString(8, cliente.getFechaNacimiento());


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public static ArrayList<BFuncion> obtenerFunciones(){
        ArrayList<BFuncion> listaFunciones= new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select concat(f.fecha,' ',f.hora) as 'Función' , f.precio_ticket as 'precio de funcón',\n" +
                    "p.nombre as 'Nombre de pelicula' , p.foto as 'Foto funcion' from \n" +
                    "funciones f inner join peliculas p on  (f.idpelicula=p.idpelicula);";

            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BFuncion fu = new BFuncion();
                fu.setFecha(rs.getString(1).split(" ")[0]);
                fu.setHora(rs.getString(1).split(" ")[1]);
                fu.setPelicula(rs.getString(2));
                fu.setPelicula(rs.getString(3));
                listaFunciones.add(fu);
                System.out.println(fu.getFecha()+" "+fu.getFecha());
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaFunciones;
    }


    public  void actualizar(BComprafuncion comprafuncion) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "UPDATE compradefunciones SET  idfuncion= ?, cantidad_por_funcion = ?, asistencia = ? ";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, comprafuncion.getIdfuncion());
            pstmt.setInt(2, comprafuncion.getCantidad_por_funcion());
            pstmt.setString(3, comprafuncion.getAsistencia());

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
