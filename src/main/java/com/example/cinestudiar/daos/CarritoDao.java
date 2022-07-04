package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCarrito;
import com.fasterxml.jackson.databind.ser.Serializers;


import java.security.MessageDigest;

import java.sql.*;
import java.util.ArrayList;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMultipart;



public class CarritoDao extends BaseDao {

    public ArrayList<BCarrito> listarUsuario(String codigo){

        String sql="select p.foto,p.nombre,f.fecha,f.hora,sala.nombre_sede,cf.cantidad_por_funcion,f.precio_ticket,u.codigo_pucp,cf.idcompra,f.aforo_operador,cf.idfuncion,cf.idhistorialdecompras,p.idpelicula,u.correo,p.duracion from usuarios u\n" +
                "\t\t\t\t\t\t\t\t\t\tinner join compradefunciones cf on (cf.usuarios_codigo_pucp=u.codigo_pucp)\n" +
                "\t\t\t\t\t\t\t\t\t\tinner join funciones f on (f.idfuncion=cf.idfuncion)\n" +
                "\t\t\t\t\t\t\t\t\t\tinner join peliculas p on (p.idpelicula=f.idpelicula)\n" +
                "\t\t\t\t\t\t\t\t\t\tinner join salas sala on (sala.idsala=f.idsala)\n" +
                "\t\t\t\t\t\t\t\t\t\twhere u.codigo_pucp=? AND cf.asistencia=4;";



        ArrayList<BCarrito> listausuarios = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, codigo);

            try (ResultSet rs = pstmt.executeQuery()) {
                //ResultSet rs = stmt.executeQuery("");) {

                while (rs.next()) {
                    BCarrito bCarrito = new BCarrito();
                    bCarrito.setImagen(rs.getString(1));
                    bCarrito.setIdpelicula(rs.getInt(13));
                    bCarrito.setNombre_pelicula(rs.getString(2));
                    bCarrito.setFecha(rs.getString(3));
                    bCarrito.setHora(rs.getString(4));
                    bCarrito.setNombre_sede(rs.getString(5));
                    bCarrito.setCantidad_funcion(rs.getInt(6));
                    bCarrito.setPrecio_ticket(rs.getInt(7));
                    bCarrito.setCodigoEstudiante(rs.getString(8));
                    bCarrito.setIdcompra(rs.getInt(9));
                    bCarrito.setAforoOperador(rs.getInt(10));
                    bCarrito.setIdfuncion(rs.getInt(11));
                    bCarrito.setHistorialcompra(rs.getInt(12));
                    bCarrito.setCorreopucp(rs.getString(14));
                    bCarrito.setDuracionpelicula(rs.getInt(15));
                    listausuarios.add(bCarrito);
                }
            }
        }
            catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listausuarios;
    }


    public void actualiza(BCarrito idfuncion) {

        String sql = "UPDATE compradefunciones set cantidad_por_funcion=? where idfuncion=? and usuarios_codigo_pucp=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idfuncion.getCantidad_funcion());
            pstmt.setInt(2, idfuncion.getIdfuncion());
            pstmt.setString(3,idfuncion.getCodigoEstudiante());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void borrarReserva(String codigo) {


        String sql = "delete from compradefunciones where idfuncion = ?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void compra(int cantidad_tickets, double pago_total, String codigo_pucp,String correo_pucp) {

        //String xd=codigo_pucp+cantidad_tickets+pago_total;
        String qerre=enviaCorreo(cantidad_tickets,pago_total,codigo_pucp,correo_pucp);
        //String qerre=sha256(codigo_pucp+cantidad_tickets+pago_total);
        //System.out.println(xd);



        String sql = "INSERT INTO compras(qr,cantidad_tickets,pago_total,fecha_compra,hora_compra,codigo_pucp) VALUES (?,?,?,now(),now(),?);";


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1,qerre);
            pstmt.setInt(2, cantidad_tickets);
            pstmt.setDouble(3, pago_total);
            pstmt.setString(4, codigo_pucp);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void yacompro(BCarrito idcompra) {


        String sql = "UPDATE compradefunciones set asistencia=?,idcompra=? where idhistorialdecompras=? and usuarios_codigo_pucp=20196044;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1,5);
            pstmt.setInt(2,idcompra.getIdcompra());
            pstmt.setInt(3, idcompra.getHistorialcompra());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void reducciondeAforoxCompra(int reduccionAforoxCompra,int idfuncion) {


        String sql = "update funciones set aforo_operador=aforo_operador-? where idfuncion=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setInt(1,reduccionAforoxCompra);
            pstmt.setInt(2,idfuncion);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }











    public static String sha256(final String base) {
        try{
            final MessageDigest digest = MessageDigest.getInstance("SHA-256");
            final byte[] hash = digest.digest(base.getBytes("UTF-8"));
            final StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                final String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch(Exception ex){
            throw new RuntimeException(ex);
        }
    }






    public static String enviaCorreo(int cantidad_tickets, double pago_total, String codigo_pucp,String correo_pucp) {

        String querre=sha256(codigo_pucp+cantidad_tickets+pago_total);
        //String querre="Codigo: "+codigo_pucp+"numero de tickets"+cantidad_tickets+"pago:"+pago_total;
        String fotoqr="<img src='https://chart.googleapis.com/chart?cht=qr&chl="+querre+"&chs=180x180&choe=UTF-8&chld=L|2'>";
        final String username = "cinestudiariweb@gmail.com";
        final String password = "qmkekwbccsvfuhpo";

        //System.out.println(correo_pucp);

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("cinestudiariweb@gmail.com"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(correo_pucp)
            );
            String someHtmlMessage="<html lang=\"en\">\n" +
                    "<head>\n" +
                    "    <meta charset=\"UTF-8\">\n" +
                    "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n" +
                    "    \n" +
                    "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                    "    <img src=\"https://drive.google.com/uc?id=1a4PgZwW8H4jfXKVJ86rq5FkMQI5ra27f\"\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "    <p> Hola!<br>Muchas Gracias por tu compra!<br>Debajo se adjunta un código QR que te permitirá ingresar a tu(s) sala(s) Respectivas ;)</p>\n" +
                    "\n" +
                    fotoqr +
                    "</body>\n" +
                    "</html>";

            message.setSubject("Gracias por tu compra!");
            message.setContent(someHtmlMessage, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return querre;
    }

}
//check