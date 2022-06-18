package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BComprafuncion;
import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BUser;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;

public class UsuariosDao {

    public static void añadir(String codigo_pucp, String nombre, String apellido, String rol, String dni, String telefono, String correo, String contraseña, String fecha_nacimiento, String direccion, Blob foto, String tarjeta) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "INSERT INTO usuarios (codigo_pucp, nombre, apellido, rol,dni, telefono, correo, contraseña, fecha_nacimiento, direccion, foto, tarjeta) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo_pucp);
            pstmt.setString(2, nombre);
            pstmt.setString(3, apellido);
            pstmt.setString(4, rol);
            pstmt.setString(5, dni);
            pstmt.setString(6,telefono );
            pstmt.setString(7, correo);
            pstmt.setString(8, contraseña);
            pstmt.setString(9, fecha_nacimiento);
            pstmt.setString(10,direccion);
            pstmt.setBlob(11,foto);
            pstmt.setString(12,tarjeta);
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

    public BUser buscarPorId(String id) {
        BUser buser = null;

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/hr";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String sql = "select * from usuarios where codigo_pucp = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, id);

            try (ResultSet rs = pstmt.executeQuery();) {

                if (rs.next()) {
                    buser = new BUser();
                    buser.setCodigoPucp(rs.getString(1));
                    buser.setNombres(rs.getString(2));
                    buser.setApellidos(rs.getString((3));
                    buser.setRol(rs.getString(4));
                    buser.setDni(rs.getInt(5));
                    buser.setTelefono(rs.getString(6));
                    buser.setCorreo(rs.getString(7));
                    buser.setContrasena(rs.getString(8));
                    buser.setFechaNacimiento(rs.getDate(9));
                    buser.setDireccion(rs.getString(10));
                    buser.setFoto(rs.getBlob(11));
                    buser.setDatosTarjeta(rs.getString(12));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return buser;
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
