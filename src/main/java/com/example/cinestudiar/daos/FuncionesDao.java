package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncionUsuario;
import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BSedeUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FuncionesDao extends BaseDao{

    String sql_funciones="SELECT f.idfuncion,p.nombre, f.fecha, f.hora, f.precio_ticket, f.edad_minima, s.nombre_sede as `Sede`, \n" +
            "s.aforo_operador as `Aforo Total` , s.idsala FROM peliculas p join funciones f on (f.idpelicula = p.idpelicula)\n" +
            "join salas s on (f.idsala = s.idsala) where p.idpelicula = ?;";
    String sql_agregar="insert into compradefunciones " +
            "(idfuncion,cantidad_por_funcion,usuarios_codigo_pucp) values(?,1,?);";

    public ArrayList<BFuncionUsuario> listaFuncionesPorPelicula(int id) {
        ArrayList<BFuncionUsuario> lista = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_funciones);) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                while (rs.next()) {
                    int idFuncion = rs.getInt(1);
                    String nombre_pelicula = rs.getString(2);
                    String fecha = rs.getString(3);
                    String hora = rs.getString(4);
                    double precio_tiket = rs.getDouble(5);
                    int edad_minima = rs.getInt(6);
                    String nombre_sede = rs.getString(7);
                    String aforo_total = rs.getString(8);
                    int idSala = rs.getInt(9);
                    BPeliculas bPeliculas = new BPeliculas(id,nombre_pelicula);
                    BSedeUsuario bSedeUsuario = new BSedeUsuario(idSala,nombre_sede,aforo_total);

                    BFuncionUsuario bFuncion = new BFuncionUsuario(idFuncion,fecha,hora,precio_tiket,edad_minima,bSedeUsuario,bPeliculas);
                    lista.add(bFuncion);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public void agregarCarrito(String codigo , int idFuncion) {

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql_agregar);) {
            pstmt.setInt(1,idFuncion);
            pstmt.setString(2, codigo);
            pstmt.executeUpdate();

        }catch (SQLException error) {
            error.printStackTrace();
        }
    }









    }
