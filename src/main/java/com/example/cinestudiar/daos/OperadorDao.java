package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BProfesional;
/*import com.example.cinestudiar.beans.BUser;*/

import java.sql.*;
import java.util.ArrayList;

public class OperadorDao extends BaseDao {
    public OperadorDao() throws SQLException {
    }

    public ArrayList<BFuncion> filtradoFunciones(String filtro){
        if (filtro.equals("") || filtro.equals("defecto")){
            ArrayList<BFuncion> todasLasFunciones = new ArrayList<>();
            try {
                String sql = "select f.idfuncion as 'IdFunción',p.nombre     as `Título de Película`,\n" +
                        "f.fecha,f.hora,\n" +
                        "se.nombre_sede as `Sede`,\n" +
                        "sa.idsala as `Sala`,\n" +
                        "f.precio_ticket as `Precio`,\n" +
                        "round(p.calificacion) as `Calificacion`\n" +
                        "from funciones f\n" +
                        "inner join salas sa on (f.idsala=sa.idsala)\n" +
                        "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                        "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                        "order by se.nombre_sede,sa.idsala,f.fecha desc;";
                Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("PORBAAAAAANDO SI LLEGGA");
                while (rs.next()){
                    BFuncion fu = new BFuncion();
                    fu.setIdFuncion(Integer.parseInt(rs.getString(1)));
                    fu.setPelicula(rs.getString(2));
                    fu.setFecha(rs.getString(3));
                    fu.setHora(rs.getString(4));
                    fu.setSede(rs.getString(5));
                    fu.setIdSala(rs.getInt(6));
                    fu.setPrecioTicket(rs.getInt(7));
                    fu.setCalificacion(rs.getInt(8));



                    todasLasFunciones.add(fu);
                }
            } catch (SQLException e){
                throw new RuntimeException(e);
            }

            return todasLasFunciones;
        }

        if (filtro.equals("Funciones Disponibles")){
            ArrayList<BFuncion> funcionesDisponibles = new ArrayList<>();
            try {
                String sql = "select f.idfuncion as 'IdFunción',p.nombre as `Título de Película`,\n" +
                        "f.fecha,f.hora,\n" +
                        "se.nombre_sede as `Sede`,\n" +
                        "sa.idsala as `Sala`,\n" +
                        "f.precio_ticket as `Precio`,\n" +
                        "round(p.calificacion) as `Calificacion`\n" +
                        "from funciones f\n" +
                        "inner join salas sa on (f.idsala=sa.idsala)\n" +
                        "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                        "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                        "where datediff(f.fecha,now())>=0\n" +
                        "order by se.nombre_sede,sa.idsala,f.fecha desc;";
                Connection conn = this.getConnection();
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
                    fu.setPrecioTicket(rs.getInt(7));
                    fu.setCalificacion(rs.getInt(8));

                    funcionesDisponibles.add(fu);
                }
            } catch (SQLException e){
                throw new RuntimeException(e);
            }

            return funcionesDisponibles;
        }
        if (filtro.equals("Mejor calificado")){
            ArrayList<BFuncion> listaFunMejorCalif = new ArrayList<>();
            try {
                String sql = "select f.idfuncion as 'IdFunción',p.nombre as `Título de Película`,\n" +
                        "f.fecha,f.hora,\n" +
                        "se.nombre_sede as `Sede`,\n" +
                        "sa.idsala as `Sala`,\n" +
                        "f.precio_ticket as `Precio`,\n" +
                        "round(p.calificacion) as `Calificacion`\n" +
                        "from funciones f\n" +
                        "inner join salas sa on (f.idsala=sa.idsala)\n" +
                        "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                        "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                        "order by p.calificacion desc\n" +
                        "limit 1;";
                Connection conn = this.getConnection();
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
                    fu.setPrecioTicket(rs.getInt(7));
                    fu.setCalificacion(rs.getInt(8));

                    listaFunMejorCalif.add(fu);
                }

            } catch (SQLException e){
                throw new RuntimeException(e);
            }
            return listaFunMejorCalif;
        }
        if (filtro.equals("Mas visto")){
            ArrayList<BFuncion> listaFunMasVis = new ArrayList<>();
            try {
                String sql = "select f.idfuncion as 'IdFunción',p.nombre as `Título de Película`,\n" +
                        "f.fecha,f.hora,\n" +
                        "se.nombre_sede as `Sede`,\n" +
                        "sa.idsala as `Sala`,\n" +
                        "f.precio_ticket as `Precio`,\n" +
                        "round(p.calificacion) as `Calificacion`\n" +
                        "from funciones f\n" +
                        "inner join salas sa on (f.idsala=sa.idsala)\n" +
                        "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                        "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                        "inner join compradefunciones cdf on (cdf.idfuncion=f.idfuncion)\n" +
                        "order by cdf.asistencia desc\n" +
                        "limit 1;";
                Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("PORBAAAAANDOOO WIWIWIWI");
                while (rs.next()){
                    BFuncion fu = new BFuncion();
                    fu.setIdFuncion(Integer.parseInt(rs.getString(1)));
                    fu.setPelicula(rs.getString(2));
                    fu.setFecha(rs.getString(3));
                    fu.setHora(rs.getString(4));
                    fu.setSede(rs.getString(5));
                    fu.setIdSala(rs.getInt(6));
                    fu.setPrecioTicket(rs.getInt(7));
                    fu.setCalificacion(rs.getInt(8));

                    listaFunMasVis.add(fu);
                }

            } catch (SQLException e){
                throw new RuntimeException(e);
            }
            return listaFunMasVis;
        }
        if (filtro.equals("Menos visto")){
            ArrayList<BFuncion> listaFunMenVis = new ArrayList<>();
            try {

                String sql = "select f.idfuncion as 'IdFunción',p.nombre as `Título de Película`,\n" +
                        "f.fecha,f.hora,\n" +
                        "se.nombre_sede as `Sede`,\n" +
                        "sa.idsala as `Sala`,\n" +
                        "f.precio_ticket as `Precio`,\n" +
                        "round(p.calificacion) as `Calificacion`\n" +
                        "from funciones f\n" +
                        "inner join salas sa on (f.idsala=sa.idsala)\n" +
                        "inner join sedes se on (sa.nombre_sede=se.nombre_sede)\n" +
                        "inner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                        "inner join compradefunciones cdf on (cdf.idfuncion=f.idfuncion)\n" +
                        "order by cdf.asistencia asc\n" +
                        "limit 1;";
                Connection conn = this.getConnection();
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
                    fu.setPrecioTicket(rs.getInt(7));
                    fu.setCalificacion(rs.getInt(8));

                    listaFunMenVis.add(fu);
                }

            } catch (SQLException e){
                throw new RuntimeException(e);
            }
            return listaFunMenVis;
        }
        return null;
    }

    public ArrayList<BProfesional> obtenerProfesionalesMejorCalificados(){
        ArrayList<BProfesional> listaProMejorCalif = new ArrayList<>();
        try {
            String sql = "select pro.nombre,pro.apellido,\n" +
                    "cali.calificacion as `Calificacion`,\n" +
                    "pro.rol as `Rol`\n" +
                    "from peliculas p \n" +
                    "inner join peliculas_has_profesionales php on (p.idpelicula = php.peliculas_idpelicula)\n" +
                    "inner join profesionales pro on (php.profesionales_idprofesional=pro.idprofesional)\n" +
                    "inner join calificaciondeprofesionales cali on (cali.idprofesional=pro.idprofesional)\n" +
                    "order by cali.calificacion desc;";
            Connection conn = this.getConnection();
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
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
        return listaProMejorCalif;
    }

    //CREAR FUNCIONES
    private static String sql_crear_func="INSERT INTO funciones (fecha,hora,precio_ticket,edad_minima,idpersonal,idsala,idpelicula) VALUES (?,?,?,?,?,?,?);";
    public void crearFuncion(BFuncion funcion) {


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql_crear_func);) {

            pstmt.setString(1, funcion.getFecha());
            pstmt.setString(2, funcion.getHora());
            pstmt.setInt(3, funcion.getPrecioTicket());
            pstmt.setInt(4, funcion.getEdadMinima());
            pstmt.setInt(5, funcion.getIdPersonal());
            pstmt.setInt(6, funcion.getIdSala());
            pstmt.setInt(7, funcion.getIdPelicula());
            pstmt.executeUpdate();

        }catch (SQLException error) {
            error.printStackTrace();
        }
    }

}


