package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BPeliculas;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PeliculasDao;
import com.example.cinestudiar.daos.UsuariosDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@MultipartConfig
@WebServlet(name = "InicioSinSesionServlet", urlPatterns = {"","/registro"})
public class InicioSinSesionServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        UsuariosDao usuariosDao = new UsuariosDao();
        PeliculasDao peliculasDao = new PeliculasDao();
        FuncionesDao funcionesDao = new FuncionesDao();

        RequestDispatcher view;

        switch (action){
            case ""->{
                ArrayList<BPeliculas> listapeliculas= peliculasDao.listasPeliculasCliente();
                ArrayList<BPeliculas> listaradom= peliculasDao.listaradom();
                request.setAttribute("listapeliculas",listapeliculas);
                request.setAttribute("listaradom",listaradom);
                request.setAttribute("cointaner",peliculasDao.cointaner(listapeliculas.size()));
                request.setAttribute("valor",peliculasDao.valor(listapeliculas.size()));
                view = request.getRequestDispatcher("Usuario/index.jsp");
                view.forward(request, response);
            }
            case "registrar"->{

                view = request.getRequestDispatcher("Usuario/registro.jsp");
                view.forward(request, response);
            }


        }

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsuariosDao usuariosDao = new UsuariosDao();

        BUser usuarionolog = usuariosDao.validarPass("0","0");
        session.setAttribute("usuarionolog",usuarionolog);

        RequestDispatcher view;
        BUser usuario =leerParametrosRequest2(request);




        /*  ****Validación de campos:Registro **** */

        /* Nombre completo  */
        Pattern pattern = Pattern.compile("^\\pL+[\\pL\\pZ\\pP]{1,45}$", Pattern.CASE_INSENSITIVE);
        Matcher matcher = pattern.matcher(usuario.getNombres());
        boolean nombreCompleto = matcher.find();

        /* Apellido completo  */

        Pattern patternap = Pattern.compile("^\\pL+[\\pL\\pZ\\pP]{1,45}$", Pattern.CASE_INSENSITIVE);
        Matcher matcherap = patternap.matcher(usuario.getApellidos());
        boolean apellidoCompleto = matcherap.find();


        /* DNI  */
        Pattern patternDNI = Pattern.compile("^[0-9]{8}$", Pattern.CASE_INSENSITIVE);
        Matcher matcherDNI = patternDNI.matcher(usuario.getDni());
        boolean dni = matcherDNI.find();

        /* Código */

        Pattern patternPUCP = Pattern.compile("^[0-9]{8}$", Pattern.CASE_INSENSITIVE);
        Matcher matcherPUCP = patternPUCP.matcher(usuario.getCodigoPucp());
        boolean pucp = matcherPUCP.find();

        /* Correo */
        Pattern patterncorreo = Pattern.compile("([A-Za-z0-9-_.]+@[A-Za-z0-9-_]+(?:\\.[A-Za-z0-9]+)+)", Pattern.CASE_INSENSITIVE);
        Matcher matchercorreo = patterncorreo.matcher(usuario.getCorreo());
        boolean email = matchercorreo.find();

        /* Dirección de domicilio  */

        Pattern patterndireccion = Pattern.compile("^[a-zA-Z0-9][\\sa-zA-Z0-9]*", Pattern.CASE_INSENSITIVE);
        Matcher matcherdireccion= patterndireccion.matcher(usuario.getDireccion());
        boolean direccion = matcherdireccion.find();

        /* Número de Celular  */

        Pattern patterncel = Pattern.compile("^[0-9]{9}$", Pattern.CASE_INSENSITIVE);
        Matcher matchercel = patterncel.matcher(usuario.getTelefono());
        boolean cel = matchercel.find();

        /* Fecha de nacimiento  */
        boolean nacimiento=false;

        String fecha=usuario.getFechaNacimiento();
        LocalDate fechainput=LocalDate.parse(fecha);

        LocalDate minimoNacimiento=LocalDate.parse("1900-01-01");

        DateFormat fechaActual = new SimpleDateFormat("yyyy-MM-dd");
        Date fechas = new Date();
        LocalDate nacimientoMax= LocalDate.parse(fechaActual.format(fechas));
        String nacimientoMaxi= String.valueOf(nacimientoMax);
        String [] nacimientoMaxim=nacimientoMaxi.split("-");
        int maxNacimiento=(Integer.parseInt(nacimientoMaxim[0]))-15;
        String nacimientoMaximo=maxNacimiento+"-"+nacimientoMaxim[1]+"-"+nacimientoMaxim[2];
        LocalDate maximoNacimiento=LocalDate.parse(nacimientoMaximo);

        if ( (fechainput.isEqual(maximoNacimiento) || (fechainput.isBefore(maximoNacimiento)) ) && (fechainput.isAfter(minimoNacimiento)) ){
            nacimiento=true;
        }

        /* Contraseña  */

        Pattern patterncontra = Pattern.compile("(?=.*\\d)(?=.*[A-Z])(?=.*?[#?!@$%^&*-]).{5,}", Pattern.CASE_INSENSITIVE);
        Matcher matchercontra = patterncontra.matcher(usuario.getContrasena());
        boolean contra = matchercontra.find();

        if (!nombreCompleto){request.getSession().setAttribute("errorNombre", "Error al registrarse: Nombre ingresado no válido");}

        if (!apellidoCompleto){request.getSession().setAttribute("errorApellido", "Error al registrarse: Apellido ingresado no válido. ");}

        if (!dni){request.getSession().setAttribute("errorDni", "Error al registrarse: DNI ingresado no válido. ");}

        if (!pucp){request.getSession().setAttribute("errorCodigo", "Error al registrarse: Codigo PUCP ingresado no válido. ");}

        if (!email){request.getSession().setAttribute("errorEmail", "Error al registrarse: Email ingresado no válido. ");}

        if (!direccion){request.getSession().setAttribute("errorDireccion", "Error al registrarse: Direccion ingresado no válido. ");}

        if (!cel){request.getSession().setAttribute("errorCel", "Error al registrarse: Celular ingresado no válido. ");}

        if (!nacimiento){request.getSession().setAttribute("errorNacimiento", "Error al registrarse: Fecha de nacimiento ingresado no válido (A la fecha, debes tener un mínimo de 15 años). ");}

        if (!contra){request.getSession().setAttribute("errorContra", "Error al registrarse: Contraseña ingresada no válida ");}
        /*  -------------------------------------- */

        if (usuariosDao.buscarPorId(usuario.getCodigoPucp())==null && usuariosDao.buscarPorCorreo(usuario.getCorreo())==null){

            if (nombreCompleto && apellidoCompleto && dni && pucp && email && direccion && cel && nacimiento && contra){
                usuariosDao.agregar(usuario);
                session.setAttribute("indicador2","error");
            }
            response.sendRedirect(request.getContextPath()+"/registro?action=registrar");


        }else{
            session.setAttribute("indicador","error");
            response.sendRedirect(request.getContextPath()+"/registro?action=registrar");
        }

    }


    public BUser leerParametrosRequest2(HttpServletRequest request) throws IOException, ServletException {
        String codigo_pucp = request.getParameter("codigo_pucp");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String rol = request.getParameter("rol");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contraseña = request.getParameter("password");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String direccion = request.getParameter("direccion");
        //Codigo para guardar una imagen en sql
        Part foto = request.getPart("picture");
        //System.out.println(telefono);
        //System.out.println(nombre);
        //System.out.println(foto);
        InputStream fotoinput = null;
        if (foto.getSize() > 0) {
            fotoinput = foto.getInputStream();
        }
        String tarjeta = request.getParameter("tarjeta");

        //System.out.println(codigo_pucp + nombre + apellido + telefono + dni + contraseña + correo + fecha_nacimiento + direccion + fotoinput + tarjeta);

        return new BUser(codigo_pucp, nombre, apellido, rol, dni, telefono, correo, contraseña, fecha_nacimiento, direccion, fotoinput, tarjeta);
    }
}
