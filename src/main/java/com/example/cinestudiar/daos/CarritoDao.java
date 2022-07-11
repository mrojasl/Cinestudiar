package com.example.cinestudiar.daos;

import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BUsuarioFuncion;
import com.fasterxml.jackson.databind.ser.Serializers;


import java.security.MessageDigest;

import java.sql.*;
import java.text.SimpleDateFormat;
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

        String sql="select p.foto,p.nombre,f.fecha,f.hora,sala.nombre_sede,cf.cantidad_por_funcion,f.precio_ticket,u.codigo_pucp,cf.idcompra,f.aforo_operador,cf.idfuncion,cf.idhistorialdecompras,p.idpelicula,u.correo,p.duracion,TIMESTAMPDIFF(minute,CURRENT_TIMESTAMP(),concat(f.fecha,' ',f.hora)) from usuarios u\n" +
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
                    bCarrito.setDiferenciaHoraria(rs.getInt(16));

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

        String sql = "UPDATE compradefunciones set cantidad_por_funcion=? where idfuncion=? and usuarios_codigo_pucp=? and idhistorialdecompras=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, idfuncion.getCantidad_funcion());
            pstmt.setInt(2, idfuncion.getIdfuncion());
            pstmt.setString(3,idfuncion.getCodigoEstudiante());
            pstmt.setInt(4, idfuncion.getHistorialcompra());
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



    //SE SOLICITA EL IDCOMPRA DE LA TABLA COMPRA:::
    public String SolicitaidCompras(String fecha, String hora, String codigo_pucp) {

        //String xd=codigo_pucp+cantidad_tickets+pago_total;

        //String qerre=sha256(codigo_pucp+cantidad_tickets+pago_total);
        //System.out.println(xd);

        String sql = "select idcompra from compras where fecha_compra=? and hora_compra=? and codigo_pucp=?";

        String idcompras=null;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            //System.out.println(fecha  + hora + codigo_pucp);
            pstmt.setString(1,fecha);
            pstmt.setString(2, hora);
            pstmt.setString(3, codigo_pucp);
            try (ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    //System.out.println("aqui");
                    idcompras=(rs.getString(1));

                }

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        //System.out.println("El id compras es de "+idcompras);

        return idcompras;
    }

    public void seteaIdCompra(int historialCompra, String idcompras) {


        String sql = "update compradefunciones set idcompra=? where idhistorialdecompras=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, idcompras);
            pstmt.setInt(2, historialCompra);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }




    public void yacompro(int idCompra,int historialCompra,String codigoEstudiante) {


        String sql = "UPDATE compradefunciones set asistencia=?,idcompra=? where idhistorialdecompras=? and usuarios_codigo_pucp=?;";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {


            //System.out.println("El historial de compra es el::"+historialCompra);
            pstmt.setInt(1,5);
            pstmt.setInt(2,idCompra);
            pstmt.setInt(3, historialCompra);
            pstmt.setString(4, codigoEstudiante);
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




    public void enviaCorreo(int cantidad_tickets, double pago_total, String codigo_pucp,String correo_pucp,String dias,String horas,String nombres,ArrayList<BCarrito> Comprascarrito) {

        String querre=sha256(codigo_pucp+cantidad_tickets+pago_total+dias+horas);
        //String querre="Codigo: "+codigo_pucp+"numero de tickets"+cantidad_tickets+"pago:"+pago_total;
        String fotoqr="<img src='https://chart.googleapis.com/chart?cht=qr&chl="+querre+"&chs=180x180&choe=UTF-8&chld=L|2'>";
        final String username = "cinestudiariweb@gmail.com";
        final String password = "qmkekwbccsvfuhpo";

        //System.out.println(correo_pucp);
//        System.out.prxdintln("--------------");
//        System.out.println(dias);
//        System.out.println(horas);
//        System.out.println(codigo_pucp);
//
        String resultado=this.SolicitaidCompras(dias,horas,codigo_pucp);

        String[] fechaSplit=dias.split("-");
        String anho=fechaSplit[0];
        String mes=fechaSplit[1];
        String dia=fechaSplit[2];

        String[] fechaFuncionSplit=Comprascarrito.get(0).getFecha().split("-");
        String fanho=fechaFuncionSplit[0];
        String fmes=fechaFuncionSplit[1];
        String fdia=fechaFuncionSplit[2];

        String[] horaFuncionSplit=Comprascarrito.get(0).getHora().split(":");
        String fhora=horaFuncionSplit[0];
        String fminuto=horaFuncionSplit[1];


        //System.out.println("resultado: "+resultado);
        //System.out.println("Envia correo dice::"+resultado);
//        System.out.println("--------------");

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
                    "    <p> Hola "+nombres+"!<br>Muchas Gracias por tu compra!<br>Debajo se adjunta información general de tu compra,<strong>junto a la información de una (1) de tus funciones reservadas</strong>, y el código QR que te permitirá ingresar a tu(s) sala(s) Respectivas<br><strong>Nota: " +
                    "TODAS las funciones que reservaste con esta compra las podrás ver en la seccion: 'Mis Tickets', y podrás comparar cúal pertenece a esta compra comparando el Número de ID de la compra, la cual se presenta a continuación:<br></strong></p>\n" +
                    "\n" +"<strong>ID de tu compra: "+resultado+".</strong><br>"+
                    "<strong>Fecha y hora de tu compra: </strong>"+ "Fecha(dia/mes/año): "+dia+"/"+mes+"/"+anho+" A horas (horas:minutos:segundos):"+horas+".<br>"+
                    "<strong>Pago total de tu compra: </strong>"+pago_total+" Soles.<br>"+
                    "<strong>Código Único de tu compra(más abajo se muestra la imagen qr correspondiente a este código): </strong>"+querre+"<br>"+
                    "-------------------<br>"+
                    "Nombre de la película reservada: "+Comprascarrito.get(0).getNombre_pelicula()+".<br>"+
                    "Fecha y hora de tu función: "+"Fecha(dia/mes/año): "+fdia+"/"+fmes+"/"+fanho+" A horas (horas:minutos):"+fhora+":"+fminuto+".<br>"+
                    "Cantidad de tickets reservados: "+Comprascarrito.get(0).getCantidad_funcion()+" tickets.<br>"+
                    "-------------------<br>"+
                    fotoqr +
                    "<br>Que disfrutes tu(s) funcion(es)! =D"+
                    "</body>\n" +
                    "</html>";

            message.setSubject("Gracias por tu compra!");
            message.setContent(someHtmlMessage, "text/html; charset=utf-8");

            Transport.send(message);

            System.out.println("Envio de correo dice: enviado");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


    public ArrayList <String> compra(int cantidad_tickets, double pago_total, String codigo_pucp,String correo_pucp,String nombres, ArrayList<BCarrito> Comprascarrito) {

        //String xd=codigo_pucp+cantidad_tickets+pago_total;

        //String qerre=sha256(codigo_pucp+cantidad_tickets+pago_total);
        //System.out.println(xd);

        ArrayList<String> compra = new ArrayList<String>();

        String sql = "INSERT INTO compras(qr,cantidad_tickets,pago_total,fecha_compra,hora_compra,codigo_pucp) VALUES (?,?,?,?,?,?);";


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            String dias = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());
            String horas = new SimpleDateFormat("HH:mm:ss").format(new java.util.Date());

            String codigo_qr=sha256(codigo_pucp+cantidad_tickets+pago_total+dias+horas);


            compra.add(dias);
            compra.add(horas);

            pstmt.setString(1,codigo_qr);
            pstmt.setInt(2, cantidad_tickets);
            pstmt.setDouble(3, pago_total);

            pstmt.setString(4,dias);
            pstmt.setString(5,horas);

            pstmt.setString(6, codigo_pucp);

            pstmt.executeUpdate();

            this.enviaCorreo(cantidad_tickets,pago_total,codigo_pucp,correo_pucp,dias,horas,nombres,Comprascarrito);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return compra;
    }




}
//check