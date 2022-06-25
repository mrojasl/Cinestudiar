package com.example.cinestudiar.daos;

import java.sql.*;

public class ImageDao extends BaseDao{

    private static String sql_peliculas="select foto from peliculas where idpelicula=?;";

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
}
