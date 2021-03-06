package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BFuncion;
import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BUser;

import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class PeliculasDao extends BaseDao{
    private static String sql_select="select idpelicula,nombre,calificacion,duracion,genero,informacion from peliculas;";
    private static String sql_select2="select po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po " +
            "on (ph.profesionales_idprofesional=po.idprofesional) where peliculas_idpelicula=?;";
    int variable=0;


    public ArrayList<BPeliculas> listasPeliculas() {

        ArrayList<BPeliculas> listaBpeliculas = new ArrayList<>();

        String sql = "select p.idpelicula,p.nombre,p.calificacion,p.duracion,p.genero,p.informacion,subq.existeCompra\n" +
                "from peliculas p left join (select p.idpelicula,idcompra as 'existeCompra' from peliculas p left join funciones f\n" +
                "on (p.idpelicula=f.idpelicula) left join compradefunciones cf\n" +
                "on (cf.idfuncion=f.idfuncion) group by p.idpelicula) subq\n" +
                "on (p.idpelicula=subq.idpelicula);";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                int idpelicula = rs.getInt(1);
                String nombre = rs.getString(2);
                double calificacion = rs.getDouble(3);
                int duracion = rs.getInt(4);
                String genero = rs.getString(5);
                String informacion = rs.getString(6);
                int existeCompra = rs.getInt(7);
                BPeliculas peliculas = new BPeliculas(idpelicula, nombre, duracion, calificacion, genero, informacion,existeCompra);
                listaBpeliculas.add(peliculas);
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listaBpeliculas;
    }


    public ArrayList<BPeliculas> listaPromedio() {

        ArrayList<BPeliculas> lista = new ArrayList<>();
        String sql = "select p.idpelicula, avg(cf.calificacion) from peliculas p  inner join funciones  f on (p.idpelicula=f.idpelicula)\n" +
                "left join compradefunciones cf on (cf.idfuncion=f.idfuncion)\n" +
                "group by p.idpelicula;\n";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            try (ResultSet resultSet = pstmt.executeQuery();) {
                while (resultSet.next()) {
                    BPeliculas p = new BPeliculas();
                    p.setIdpeliculas(resultSet.getInt(1));
                    p.setCalificacion(resultSet.getInt(2));
                    lista.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return lista;
    }

    public void cargarCalificacion(double calificacion , int idpelicula){
        String sql = "update peliculas set calificacion=? where idpelicula=?;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setDouble(1, calificacion);
            pstmt.setInt(2, idpelicula);
            System.out.println("Se actulizo pelicula");
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Hubo un error en la conexi??n obteneter actualizar!");
            ex.printStackTrace();
        }
    }




    public ArrayList<BPeliculas> listasPeliculasCliente() {

        ArrayList<BPeliculas> listaBpeliculas = new ArrayList<>();

        String sql = "select p.idpelicula,p.nombre,p.calificacion,p.duracion,p.genero,p.informacion,subq.existeCompra,timestampdiff(minute,now(),concat(subq.fecha,' ',subq.hora))\n" +
                "                from peliculas p left join (select p.idpelicula,idcompra as 'existeCompra',f.fecha as 'fecha',f.hora as 'hora' from peliculas p left join funciones f\n" +
                "                on (p.idpelicula=f.idpelicula) left join compradefunciones cf\n" +
                "                on (cf.idfuncion=f.idfuncion) group by f.idfuncion) subq\n" +
                "                on (p.idpelicula=subq.idpelicula);";


        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {
            int i=0;

            while (rs.next()) {
                int idpelicula = rs.getInt(1);
                String nombre = rs.getString(2);
                double calificacion = rs.getDouble(3);
                int duracion = rs.getInt(4);
                String genero = rs.getString(5);
                String informacion = rs.getString(6);
                int existeCompra = rs.getInt(7);
                int tiempotranscurrido=rs.getInt(8);
                if (tiempotranscurrido>0){
                    BPeliculas peliculas = new BPeliculas(idpelicula, nombre, duracion, calificacion, genero, informacion,existeCompra);

                    if(peliculas.getIdpeliculas()!=variable){
                        //XDSystem.out.println(peliculas.getIdpeliculas());
                        listaBpeliculas.add(peliculas);

                    }
                    variable=peliculas.getIdpeliculas();
                }

              i++;
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listaBpeliculas;
    }


    public ArrayList<BPeliculas> listaradom(){
        ArrayList<BPeliculas> lista= this.listasPeliculasCliente();
        ArrayList<BPeliculas> listaradom = new ArrayList<>();
        int tamano ;
        if (lista.size()>=5){
            tamano=5;
        }else{
            tamano=lista.size();
        }
        Random rand = new Random();
        int i = 0;
        while (i<tamano){
            int randomIndex = rand.nextInt(lista.size());
            if (!listaradom.contains(lista.get(randomIndex))){
                listaradom.add(lista.get(randomIndex));
                i++;
            }

        }

        return listaradom;
    }

    public ArrayList<BPeliculas> listapeliculaprofesional(int id) {
        ArrayList<BPeliculas> lista= new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql_select2);) {
            pstmt.setInt(1,id);
            try (ResultSet rs = pstmt.executeQuery()) {
                System.out.println(rs);
                int i=0;
                while (rs.next()) {
                    int idprofesional=rs.getInt(1);
                    String nombre = rs.getString(2);
                    String apellido = rs.getString(3);
                    String rol = rs.getString(4);
                    BProfesional profesional = new BProfesional(idprofesional,nombre, apellido,rol);
                    BPeliculas peliculas = new BPeliculas(id,profesional);
                    lista.add(peliculas);

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    public ArrayList<BProfesional> listapeliculaDirector(int id) {

        ArrayList<BProfesional> listap = new ArrayList<>();
        String sql = "select po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po\n" +
                "on (ph.profesionales_idprofesional=po.idprofesional) where peliculas_idpelicula=? and po.rol = 'd'\n" +
                "order by po.nombre desc;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet resultSet = pstmt.executeQuery();) {
                while (resultSet.next()) {
                    BProfesional p = new BProfesional();
                    p.setIdProfesional(resultSet.getInt(1));
                    p.setNombre(resultSet.getString(2));
                    p.setApellido(resultSet.getString(3));
                    p.setRol(resultSet.getString(4));
                    listap.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listap;
    }
    public ArrayList<BProfesional> listapeliculaActor(int id) {

        ArrayList<BProfesional> listap = new ArrayList<>();
        String sql = "select po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po\n" +
                "on (ph.profesionales_idprofesional=po.idprofesional) where peliculas_idpelicula=? and po.rol = 'a'\n" +
                "order by po.nombre desc;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, id);
            try (ResultSet resultSet = pstmt.executeQuery();) {
                while (resultSet.next()) {
                    BProfesional p = new BProfesional();
                    p.setIdProfesional(resultSet.getInt(1));
                    p.setNombre(resultSet.getString(2));
                    p.setApellido(resultSet.getString(3));
                    p.setRol(resultSet.getString(4));
                    listap.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listap;
    }

    public ArrayList<BProfesional> listaActor() {

        ArrayList<BProfesional> listap = new ArrayList<>();
        String sql = "select peliculas_idpelicula, po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po\n" +
                "on (ph.profesionales_idprofesional=po.idprofesional) where  po.rol = 'a'\n" +
                "order by po.nombre desc;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            try (ResultSet resultSet = pstmt.executeQuery();) {
                while (resultSet.next()) {
                    BProfesional p = new BProfesional();
                    p.setIdPelicula(resultSet.getInt(1));
                    p.setIdProfesional(resultSet.getInt(2));
                    p.setNombre(resultSet.getString(3));
                    p.setApellido(resultSet.getString(4));
                    p.setRol(resultSet.getString(5));
                    listap.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listap;
    }

    public ArrayList<BProfesional> listaDirector() {

        ArrayList<BProfesional> listap = new ArrayList<>();
        String sql = "select peliculas_idpelicula, po.idprofesional,po.nombre,po.apellido,po.rol from peliculas_has_profesionales ph inner join profesionales po\n" +
                "on (ph.profesionales_idprofesional=po.idprofesional) where  po.rol = 'd'\n" +
                "order by po.nombre desc;";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            try (ResultSet resultSet = pstmt.executeQuery();) {
                while (resultSet.next()) {
                    BProfesional p = new BProfesional();
                    p.setIdPelicula(resultSet.getInt(1));
                    p.setIdProfesional(resultSet.getInt(2));
                    p.setNombre(resultSet.getString(3));
                    p.setApellido(resultSet.getString(4));
                    p.setRol(resultSet.getString(5));
                    listap.add(p);
                }
            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
        return listap;
    }


    public  BPeliculas obtener_pelicula(int id,ArrayList<BPeliculas> lista){
        for (BPeliculas bPeliculas : lista){
            if (bPeliculas.getIdpeliculas() == id){
                return bPeliculas;
            }
        }
        return null;
    }




    public void crearPelicula(String nombre, int duracion, String genero, InputStream foto, String informacion)  {

        String sql = "insert into peliculas (nombre, duracion , genero, foto, informacion)\n" +
                "values(?,?,?,?,?)";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, nombre);
            pstmt.setInt(2,duracion );
            pstmt.setString(3 ,genero);
            pstmt.setBlob(4, foto);
            pstmt.setString(5, informacion);
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }


    }

    public BPeliculas obtenerPelicula(int idpelicula) {

        BPeliculas p = null;

        String sql = "select * FROM peliculas WHERE  idpelicula = ? ";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idpelicula);

            try (ResultSet rs = pstmt.executeQuery();) {
                while (rs.next()){
                    p = new BPeliculas();
                    p.setIdpeliculas(rs.getInt(1));
                    p.setNombre(rs.getString(2));
                    p.setDuracion(rs.getInt(3));
                    p.setCalificacion(rs.getInt(4));
                    p.setGenero(rs.getString(5));
                    p.setFoto(rs.getBlob(6));
                    p.setInformaci??n(rs.getString(7));
                }
            }

        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n en obtenerViaje!");
            e.printStackTrace();
        }
        return p;

    }






    public void borrarPelicula(int idpelicula)  {

        String sql = "DELETE FROM peliculas WHERE idpelicula = ?";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){

            pstmt.setInt(1,idpelicula );;
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }


    }
    public void actualizarFuncion(String fecha, String hora, int precio, int id) {

        String sql = "update funciones set fecha = ?, hora =?, precio_ticket=? \n" +
                "where idfuncion= ?;";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, fecha);
            pstmt.setString(2, hora);
            pstmt.setInt(3, precio);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Hubo un error en la conexi??n obteneter actualizar!");
            ex.printStackTrace();
        }
    }
    public void borrarFunciondeunaPelicula(int idpelicula)  {
        String sql = "DELETE FROM funciones WHERE idpelicula = ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){

            pstmt.setInt(1,idpelicula );
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }
    }

    public Integer cointaner(int tama??o){
        if(tama??o%6==0){
            return tama??o/6;
        }else {
         return tama??o/6+1;
        }
    }
    public Integer valor(int tama??o){
        if(tama??o%3==0){
            return tama??o/3;
        }else {
            return tama??o/3+1;
        }
    }

    public void crearFuncion(String fecha, int hora, int precio_ticket, int edad_minima, int idpersonal, int idsala, int idpelicula)  {

        String sql = "insert into funciones (fecha, hora, precio_ticket , edad_minima, idpersonal, idsala, idpelicula)\n" +
                "values(?,?,?,?,?,?,?);";

        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1, fecha);
            pstmt.setInt(2, hora);
            pstmt.setInt(3,precio_ticket );
            pstmt.setInt(4 ,edad_minima);
            pstmt.setInt(5, idpersonal);
            pstmt.setInt(6, idsala);
            pstmt.setInt(7, idpelicula);
            pstmt.executeUpdate();

        }catch(SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }


    }
    public ArrayList<BPeliculas> buscarPeliculaporNombre(String txtBuscar) {
        ArrayList<BPeliculas> listaPeliculas = new ArrayList<>();

        String sql = "select p.idpelicula,p.nombre,p.calificacion,p.duracion,p.genero,p.informacion,subq.existeCompra\n" +
                "from peliculas p left join (select p.idpelicula,idcompra as 'existeCompra' from peliculas p left join funciones f\n" +
                "on (p.idpelicula=f.idpelicula) left join compradefunciones cf\n" +
                "on (cf.idfuncion=f.idfuncion) group by p.idpelicula) subq\n" +
                "on (p.idpelicula=subq.idpelicula)\n" +
                "where (lower(p.nombre) like ?)";


        try (Connection conn= this.getConnection();
             PreparedStatement pstmt= conn.prepareStatement(sql)) {

            pstmt.setString(1, "%" + txtBuscar.toLowerCase() + "%");

            try(ResultSet rs = pstmt.executeQuery()){
            while (rs.next()) {
                int idpelicula = rs.getInt(1);
                String nombre = rs.getString(2);
                double calificacion = rs.getDouble(3);
                int duracion = rs.getInt(4);
                String genero = rs.getString(5);
                String informacion = rs.getString(6);
                int existeCompra = rs.getInt(7);
                BPeliculas peliculas = new BPeliculas(idpelicula, nombre, duracion, calificacion, genero, informacion,existeCompra);
                listaPeliculas.add(peliculas);
            }

            }
        } catch (SQLException e) {
            System.out.println("Hubo un error en la conexi??n!");
            e.printStackTrace();
        }

        return listaPeliculas;
    }
    public void ActualizarPortadaPeli(int id, InputStream foto) {

        String sql = "UPDATE peliculas set foto=? where idpelicula=?;";

        try (Connection conn= this.getConnection();
             PreparedStatement pstmt= conn.prepareStatement(sql)) {

            pstmt.setBlob(1, foto);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }



}
