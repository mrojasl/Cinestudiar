package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCarrito;

import java.sql.*;
import java.util.ArrayList;

public class CarritocomprasDao {

    public ArrayList<BCarrito> obtenerdelCliente(){
        ArrayList<BCarrito> carritoCliente = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/mysystem4";
            Class.forName("com.mysql.cj.jdbc.Driver");
            String sql = "select SUBSTRING_INDEX(u.nombre, ' ', 1) as `nombres`, SUBSTRING_INDEX(u.apellido, ' ', 2) as `Apellidos`,c.idcompra,cf.idfuncion,cf.cantidad_por_funcion,f.precio_ticket,p.nombre,f.fecha,f.hora from usuarios u\n" +
                    "inner join compras c on (c.codigo_pucp=u.codigo_pucp)\n" +
                    "inner join compradefunciones cf on (cf.idcompra=c.idcompra)\n" +
                    "inner join funciones f on (f.idfuncion=cf.idfuncion)\n" +
                    "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                    "\n" +
                    "where u.codigo_pucp=20195957";
            Connection conn = DriverManager.getConnection(url,user,pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()){

                String nombre=rs.getString(1);
                int cantidadxfuncion=rs.getInt(4);
                int precioxticket=rs.getInt(5);
                String nombrepelicula=rs.getString(6);
                Date diafuncion=rs.getDate(7);
                Time horafuncion=rs.getTime(8);
                carritoCliente.add(new BCarrito(nombre,cantidadxfuncion,nombrepelicula,diafuncion,horafuncion,precioxticket));


            }
            System.out.println(carritoCliente.get(1).getNombres());
            System.out.println(carritoCliente.get(1).getNombres());
            System.out.println(carritoCliente.get(1).getNombres());
            System.out.println(carritoCliente.get(1).getNombres());
            System.out.println(carritoCliente.get(1).getNombres());

        } catch (ClassNotFoundException | SQLException e){
            e.printStackTrace();
        }
        return carritoCliente;
    }

}

