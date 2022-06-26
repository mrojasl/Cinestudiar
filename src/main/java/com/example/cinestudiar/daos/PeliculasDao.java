package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BPeliculas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PeliculasDao extends BaseDao{
    private static String sql_select="select idpelicula,nombre,información from peliculas;";

    public ArrayList<BPeliculas> listasPeliculas(){
        ArrayList<BPeliculas> listaBpeliculas=new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_select);) {
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                while (rs.next()) {
                    int idpelicula = rs.getInt(1);
                    String nombre = rs.getString(2);
                    String informacion = rs.getString(3);

                    BPeliculas peliculas = new BPeliculas(idpelicula,nombre,informacion);
                    listaBpeliculas.add(peliculas);
                    System.out.println(peliculas.getInformación());
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaBpeliculas;
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


}
