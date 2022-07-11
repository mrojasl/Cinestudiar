package com.example.cinestudiar.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProfesionalesDao extends BaseDao{
    String sql_agregar ="insert into calificaciondeprofesionales (calificacion,idcompra,idprofesional) " +
            "values (?,(select idcompra from compradefunciones where idhistorialdecompras=?),?);";

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




}
