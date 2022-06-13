package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;

import java.sql.*;
import java.util.ArrayList;

public class AdminDao {
    public static ArrayList<BUser> obtenerOperadores(){
        ArrayList<BUser> listaOperadores = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select codigo_pucp,nombre,apellido,dni,correo,telefono from usuarios where rol='operador' order by codigo_pucp;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BUser op = new BUser();
                op.setCodigoPucp(rs.getString(1));
                op.setNombres(rs.getString(2));
                op.setApellidos(rs.getString(3));
                op.setDni(rs.getString(4));
                op.setCorreo(rs.getString(5));
                op.setTelefono(rs.getString(6));
                listaOperadores.add(op);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaOperadores;
    }
    public static ArrayList<BUser> obtenerClientes(){
        ArrayList<BUser> listaClientes = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select codigo_pucp,nombre,apellido,dni,telefono,correo from usuarios \n" +
                    "where rol='cliente'\n" +
                    "order by codigo_pucp;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BUser cl = new BUser();
                cl.setCodigoPucp(rs.getString(1));
                cl.setNombres(rs.getString(2));
                cl.setApellidos(rs.getString(3));
                cl.setDni(rs.getString(4));
                cl.setTelefono(rs.getString(5));
                cl.setCorreo(rs.getString(6));

                listaClientes.add(cl);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaClientes;
    }
    public static ArrayList<BSedeYSala> obtenerSedesySalas(){
        ArrayList<BSedeYSala> listaSedesySalas = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select se.nombre_sede,sa.idsala,sa.aforo_administrador,sa.aforo_operador\n" +
                    "from sedes se inner join salas sa\n" +
                    "on (se.nombre_sede=sa.nombre_sede)\n" +
                    "order by se.nombre_sede,sa.idsala;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BSedeYSala sa = new BSedeYSala();
                sa.setSede(rs.getString(1));
                sa.setIdSala(rs.getInt(2));
                sa.setAforoAdministrador(rs.getString(3));
                sa.setAforoOperador(rs.getString(4));

                listaSedesySalas.add(sa);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaSedesySalas;
    }
    public static ArrayList<BProfesional> obtenerProfesionales(){
        ArrayList<BProfesional> listaProfesionales = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "SELECT idprofesional,nombre,apellido,rol\n" +
                    "FROM profesionales;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BProfesional pr = new BProfesional();
                pr.setIdProfesional(rs.getInt(1));
                pr.setNombre(rs.getString(2));
                pr.setApellido(rs.getString(3));
                pr.setRol(rs.getString(4));
                listaProfesionales.add(pr);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }

        return listaProfesionales;
    }

    public static ArrayList<BUser> obtenerClientesPorSede(){
        ArrayList<BUser> listaClientesPorSede = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select u.codigo_pucp, u.nombre, u.apellido, se.nombre_sede\n" +
                    "from usuarios u, compras c, compradefunciones co, funciones f, salas sa, sedes se\n" +
                    "where (u.codigo_pucp = c.codigo_pucp)\n" +
                    "\tand c.idcompra = co.idcompra\n" +
                    "    and co.idfuncion = f.idfuncion\n" +
                    "    and f.idsala = sa.idsala\n" +
                    "    and sa.nombre_sede = se.nombre_sede\n" +
                    "order by nombre_sede desc;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BUser cl = new BUser();
                cl.setCodigoPucp(rs.getString(1));
                cl.setNombres(rs.getString(2));
                cl.setApellidos(rs.getString(3));
                cl.setDni(rs.getString(4));

                listaClientesPorSede.add(cl);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaClientesPorSede;
    }

    public static ArrayList<BUser> obtenerClientesPorFuncion(){
        ArrayList<BUser> listaClientesPorFuncion= new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql ="select f.fecha ,c.pago_total ,co.cantidad_por_funcion,u.codigo_pucp"+
                    " from funciones f inner join compradefunciones co on (f.idfuncion=co.idfuncion)"+
                     "inner join compras c on (c.idcompra=co.idcompra)"+
                    "inner join usuarios u on (u.codigo_pucp=c.codigo_pucp)"+
            "group by f.idfuncion,u.codigo_pucp;";

            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BUser cl = new BUser();
                cl.setCodigoPucp(rs.getString(1));
                cl.setNombres(rs.getString(2));
                cl.setApellidos(rs.getString(3));
                cl.setDni(rs.getString(4));

                listaClientesPorFuncion.add(cl);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaClientesPorFuncion;
    }

    public static void crearSala(int aforo, String sede) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "INSERT INTO salas (aforo_administrador,aforo_operador,nombre_sede) VALUES (?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, aforo);
            pstmt.setInt(2, aforo);
            pstmt.setString(3, sede);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void crearProfesional(String nombre, String apellido, String profesion, Blob fotoDePerfil) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "INSERT INTO profesionales (nombre, apellido,rol,foto) VALUES (?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, nombre);
            pstmt.setString(2, apellido);
            pstmt.setString(3, profesion);
            pstmt.setBlob(4, fotoDePerfil);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public static void editarSala(int id, int aforo_ad,int aforo_op, String sede) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "UPDATE salas SET aforo_administrador= ?, aforo_operador = ?, nombre_sede = ? where idsala = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            pstmt.setInt(1, aforo_ad);
            if(aforo_ad<aforo_op){
                pstmt.setInt(2, aforo_ad);
            } else{
                pstmt.setInt(2,aforo_op);
            }
            pstmt.setString(3, sede);
            pstmt.setInt(4, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void borrarSala(int id) {

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "delete from salas where idsala = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
