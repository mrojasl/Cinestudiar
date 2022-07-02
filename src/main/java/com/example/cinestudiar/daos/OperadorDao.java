package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BProfesional;
/*import com.example.cinestudiar.beans.BUser;*/

import java.sql.*;
import java.util.ArrayList;

public class OperadorDao extends BaseDao {
<<<<<<< HEAD

=======
>>>>>>> 8fbef29c7c315671603b0d013eca02cc9533f47c



    public static void EditarDescripcion(int id, String desc){
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/mysystem4?serverTimezone=America/Lima";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String sql = "UPDATE peliculas SET informacion= ? where idpelicula = ?";

        try (Connection connection = DriverManager.getConnection(url, user, pass);
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, desc);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

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
                        "order by p.calificacion desc";
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
                        "order by cdf.asistencia desc";
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
                        "order by cdf.asistencia asc";
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
    public ArrayList<BPeliculas> filtradoPelicula(String filtro2){
        if (filtro2.equals("") || filtro2.equals("defecto")){
            ArrayList<BPeliculas> todasLasPeliculas = new ArrayList<>();
            try {
                String sql = "SELECT idpelicula, nombre, duracion,genero, round(calificacion) FROM peliculas;;";
                Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                System.out.println("Peliculaaaas");
                while (rs.next()){
                    BPeliculas fu = new BPeliculas();
                    fu.setIdpeliculas(Integer.parseInt(rs.getString(1)));
                    fu.setNombre(rs.getString(2));
                    fu.setDuracion(Integer.parseInt(rs.getString(3)));
                    fu.setGenero(rs.getString(4));
                    fu.setCalificacion(rs.getInt(5));

                    todasLasPeliculas.add(fu);
                }
            } catch (SQLException e){
                throw new RuntimeException(e);
            }

            return todasLasPeliculas;
        }
        if (filtro2.equals("Mejor calificado")){
            ArrayList<BPeliculas> listaPeliMejorCalif = new ArrayList<>();
            try {
                String sql = "SELECT idpelicula, nombre, duracion,genero, ROUND(calificacion) FROM peliculas order by calificacion desc;";
                Connection conn = this.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()){
                    BPeliculas fu = new BPeliculas();
                    fu.setIdpeliculas(Integer.parseInt(rs.getString(1)));
                    fu.setNombre(rs.getString(2));
                    fu.setDuracion(Integer.parseInt(rs.getString(3)));
                    fu.setGenero(rs.getString(4));
                    fu.setCalificacion(rs.getInt(5));



                    listaPeliMejorCalif.add(fu);
                }

            } catch (SQLException e){
                throw new RuntimeException(e);
            }
            return listaPeliMejorCalif;
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
    private static String sql_crear_peli = "insert into peliculas (nombre, duracion, genero, foto) values (?,?,?,?);";
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
    public void crearPelicula(BPeliculas peliculas) {

        System.out.println("CREANDO MI PELI");
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql_crear_peli);) {
            pstmt.setString(1, peliculas.getNombre());
            pstmt.setInt(2, peliculas.getDuracion());
            pstmt.setString(3, peliculas.getGenero());
            pstmt.setBlob(4, peliculas.getFoto());
            pstmt.executeUpdate();

        }catch (SQLException error) {
            error.printStackTrace();
        }
    }

}


