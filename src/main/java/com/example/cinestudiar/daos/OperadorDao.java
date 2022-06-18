package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BProfesional;
/*import com.example.cinestudiar.beans.BUser;*/

import java.sql.*;
import java.util.ArrayList;

public class OperadorDao {
    public ArrayList<BFuncion> obtenerFunciones(){
        ArrayList<BFuncion> obtenerFuncion = new ArrayList<>();
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        try {
            String sql = "select f.idfuncion as 'IdFunción',p.nombre as `Título de Película`,\n" +
                    "f.fecha,f.hora,\n" +
                    "se.nombre_sede as `Sede`,\n" +
                    "sa.idsala as `Sala`\n" +
                    "from funciones f\n" +
                    "inner join salas sa on (f.idsala=sa.idsala)\n" +
                    "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                    "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                    "where datediff(f.fecha,now())>=0\n" +
                    "order by se.nombre_sede,sa.idsala,f.fecha desc;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BFuncion fu = new BFuncion();
                fu.setIdFuncion(Integer.parseInt(rs.getString(1)));
                fu.setPelicula(rs.getString(2));
                fu.setFecha(rs.getString(3));
                fu.setHora(rs.getString(4));
                fu.setSede(rs.getString(5));
                fu.setIdSala(rs.getInt(6));


                obtenerFuncion.add(fu);
            }
        } catch (SQLException e){
            throw new RuntimeException(e);
        }

        return obtenerFuncion;
    }
    public static ArrayList<BProfesional> obtenerProfesionalesMejorCalificados(){
        ArrayList<BProfesional> listaProMejorCalif = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select pro.nombre,pro.apellido,\n" +
                    "cali.calificacion as `Calificacion`,\n" +
                    "pro.rol as `Rol`\n" +
                    "from peliculas p \n" +
                    "inner join peliculas_has_profesionales php on (p.idpelicula = php.peliculas_idpelicula)\n" +
                    "inner join profesionales pro on (php.profesionales_idprofesional=pro.idprofesional)\n" +
                    "inner join calificaciondeprofesionales cali on (cali.idprofesional=pro.idprofesional)\n" +
                    "order by cali.calificacion desc;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BProfesional pr = new BProfesional();
                pr.setNombre(rs.getString(1));
                pr.setApellido(rs.getString(2));
                pr.setCalificacion(rs.getFloat(3));
                pr.setRol(rs.getString(4));

                listaProMejorCalif.add(pr);
            }
        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaProMejorCalif;
    }
    public static ArrayList<BFuncion> obtenerFuncionMejorCalificada(){
        ArrayList<BFuncion> listaFunMejorCalif = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select p.nombre,p.calificacion\n" +
                    "from peliculas p \n" +
                    "order by p.calificacion desc\n" +
                    "limit 1;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BFuncion fu = new BFuncion();
                fu.setPelicula(rs.getString(1));
                fu.setCalificacion(rs.getFloat(2));

                listaFunMejorCalif.add(fu);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaFunMejorCalif;
    }
    public static ArrayList<BFuncion> obtenerFuncionMasVista(){
        ArrayList<BFuncion> listaFunMasVis = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select p.nombre,cdf.asistencia\n" +
                    "from funciones f\n" +
                    "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                    "inner join compradefunciones cdf on (cdf.idfuncion=f.idfuncion)\n" +
                    "order by cdf.asistencia desc\n" +
                    "limit 1;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BFuncion fu = new BFuncion();
                fu.setPelicula(rs.getString(1));
                fu.setAsistencia(rs.getFloat(2));

                listaFunMasVis.add(fu);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaFunMasVis;
    }
    public static ArrayList<BFuncion> obtenerFuncionMenosVista(){
        ArrayList<BFuncion> listaFunMenVis = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select p.nombre,cdf.asistencia\n" +
                    "from funciones f\n" +
                    "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                    "inner join compradefunciones cdf on (cdf.idfuncion=f.idfuncion)\n" +
                    "order by cdf.asistencia asc\n" +
                    "limit 1;";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){
                BFuncion fu = new BFuncion();
                fu.setPelicula(rs.getString(1));
                fu.setAsistencia(rs.getFloat(2));

                listaFunMenVis.add(fu);
            }

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return listaFunMenVis;
    }


}
