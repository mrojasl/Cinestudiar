package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BProfesional;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;

public class PeliculasDao extends BaseDao{
    private static String sql_select="select idpelicula,nombre,calificacion,duracion,genero,informacion from peliculas;";
    private static String sql_select2="select po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po " +
            "on (ph.profesionales_idprofesional=po.idprofesional) where peliculas_idpelicula=?;";

    public ArrayList<BPeliculas> listasPeliculas() {

        ArrayList<BPeliculas> listaBpeliculas = new ArrayList<>();
        String sql = "select idpelicula,nombre,calificacion,duracion,genero,informacion from peliculas";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                int idpelicula = rs.getInt(1);
                String nombre = rs.getString(2);
                double calificacion = rs.getDouble(3);
                int duracion = rs.getInt(4);
                String genero = rs.getString(5);
                String informacion = rs.getString(6);
                BPeliculas peliculas = new BPeliculas(idpelicula, nombre, duracion, calificacion, genero, informacion);
                listaBpeliculas.add(peliculas);
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }
        return listaBpeliculas;
    }

    public ArrayList<BPeliculas> listapeliculaprofesional(int id) {
        ArrayList<BPeliculas> lista= new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_select2);) {
            pstmt.setInt(1,id);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                int i=0;
                while (rs.next()) {
                    int idprofesional=rs.getInt(1);
                    String nombre = rs.getString(2);
                    String apellido = rs.getString(3);
                    String rol = rs.getString(4);
                    BProfesional profesional = new BProfesional(idprofesional,nombre, apellido,rol);
                    BPeliculas peliculas = new BPeliculas(id,profesional);
                    lista.add(peliculas);
                    System.out.println(lista.get(i).getIdpeliculas());
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public  BPeliculas obtener_pelicula(int id,ArrayList<BPeliculas> lista){
        for (BPeliculas bPeliculas : lista){
            if (bPeliculas.getIdpeliculas() == id){
                return bPeliculas;
            }
        }
        return null;
    }

    public void crearPelicula(String nombre, int duracion, String genero, InputStream foto, String informacion)  {

        String sql = "insert into peliculas (nombre, duracion , genero, foto, informacion)\n" +
                "values(?,?,?,?,?)";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, nombre);
            pstmt.setInt(2,duracion );
            pstmt.setString(3 ,genero);
            pstmt.setBlob(4, foto);
            pstmt.setString(5, informacion);
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }


    }
    public Integer cointaner(int tamaño){
        if(tamaño%6==0){
            return tamaño/6;
        }else {
         return tamaño/6+1;
        }
    }
    public Integer valor(int tamaño){
        if(tamaño%3==0){
            return tamaño/3;
        }else {
            return tamaño/3+1;
        }
    }

    public void crearFuncion(String fecha, int hora, int precio_ticket, int edad_minima, int idpersonal, int idsala, int idpelicula)  {

        String sql = "insert into funciones (fecha, hora, precio_ticket , edad_minima, idpersonal, idsala, idpelicula)\n" +
                "values(?,?,?,?,?,?,?);";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, fecha);
            pstmt.setInt(2, hora);
            pstmt.setInt(3,precio_ticket );
            pstmt.setInt(4 ,edad_minima);
            pstmt.setInt(5, idpersonal);
            pstmt.setInt(6, idsala);
            pstmt.setInt(7, idpelicula);
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexión!");
            e.printStackTrace();
        }


    }
}
