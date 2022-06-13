package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncion;

import java.sql.*;
import java.util.ArrayList;

public class UsuariosDao {

    public static ArrayList<BFuncion> obteneFunciones(){
        ArrayList<BFuncion> listaFunciones= new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select concat(f.fecha,'',f.hora) as 'Función' , f.precio_ticket as 'precio de funcón',\n" +
                    "p.nombre as 'Nombre de pelicula' from \n" +
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
}
