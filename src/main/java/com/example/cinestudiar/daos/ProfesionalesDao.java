package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BUsuarioFuncion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProfesionalesDao extends BaseDao{
    String sql_agregar ="insert into calificaciondeprofesionales (calificacion,idcompra,idprofesional) " +
            "values (?,(select idcompra from compradefunciones where idhistorialdecompras=?),?);";
    String sql_buscar=" select cf.idhistorialdecompras , f.idfuncion, ph.profesionales_idprofesional,ph.peliculas_idpelicula,pf.nombre,pf.apellido,pf.rol  from compradefunciones cf\n" +
            " inner join funciones f on (f.idfuncion=cf.idfuncion) right join peliculas p on (f.idpelicula=p.idpelicula)\n" +
            " left join peliculas_has_profesionales ph on (p.idpelicula=ph.peliculas_idpelicula) \n" +
            " inner join profesionales pf on (pf.idprofesional=ph.profesionales_idprofesional) where cf.idhistorialdecompras=?;";

    public void agregarCalificaciónProfesional(String calificacion ,String idhistorialdecompras , int idprofesional) {
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql_agregar);) {
            pstmt.setString(1,calificacion);
            pstmt.setString(2, idhistorialdecompras);
            pstmt.setInt(3,idprofesional);
            pstmt.executeUpdate();

        }catch (SQLException error) {
            error.printStackTrace();
        }
    }

    public ArrayList<BProfesional> listaProfesionalesCompra(String idhistorialdecompras) {
        ArrayList<BProfesional> listaprofesionales = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_buscar);) {
            pstmt.setString(1,idhistorialdecompras);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                while (rs.next()) {
                    BProfesional bProfesional=new BProfesional();
                    bProfesional.setIdProfesional(rs.getInt(3));
                    if (bProfesional.getIdProfesional()!=0){
                        bProfesional.setNombre(rs.getString(5));
                        bProfesional.setApellido(rs.getString(6));
                        bProfesional.setRol(rs.getString(7));
                        listaprofesionales.add(bProfesional);
                    }else{
                        break;
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaprofesionales;
    }




}
