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
            String sql = "select codigo_pucp,nombre,apellido,dni from usuarios where rol='operador' order by codigo_pucp;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BUser op = new BUser();
                op.setCodigoPucp(rs.getString(1));
                op.setNombres(rs.getString(2));
                op.setApellidos(rs.getString(3));
                op.setDni(rs.getString(4));

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
            String sql = "select se.nombre_sede,sa.idsala,sa.aforo_administrador\n" +
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
}
