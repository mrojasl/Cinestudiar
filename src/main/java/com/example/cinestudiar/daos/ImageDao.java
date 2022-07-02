package com.example.cinestudiar.daos;

import java.sql.*;

public class ImageDao extends BaseDao{

    private static String sql_peliculas="select foto from peliculas where idpelicula=?";
    private static String sql_usuarios="select foto from usuarios where codigo_pucp=?";
    private static String sql_profesionales="select foto from profesionales where idprofesional=?";

    public byte[] obtenerimagenes(int id) {
        byte[] content = null;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_peliculas);
        ) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    content = rs.getBytes("foto");
                } else{
                    content = new byte[]{(byte) 1};
                }
                return content;
            }

        } catch (SQLException error) {
            error.printStackTrace();
        }
        return content;
    }

    public byte[] obtenerimagenesUsuarios(String id) {
        byte[] content = null;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_usuarios);
        ) {
            pstmt.setString(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    content = rs.getBytes("foto");
                } else{
                    content = new byte[]{(byte) 1};
                }
                return content;
            }

        } catch (SQLException error) {
            error.printStackTrace();
        }
        return content;
    }
    public byte[] obtenerimagenesProfesionales(int id) {
        byte[] content = null;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_profesionales);
        ) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    content = rs.getBytes("foto");
                } else{
                    content = new byte[]{(byte) 1};
                }
                return content;
            }

        } catch (SQLException error) {
            error.printStackTrace();
        }
        return content;
    }
}
