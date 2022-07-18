package com.example.cinestudiar.servlets;
import com.example.cinestudiar.DTO.DTOfunciones_peliculas;
import com.example.cinestudiar.beans.*;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.OperadorDao;
import com.example.cinestudiar.daos.PeliculasDao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import javax.crypto.spec.PSource;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.ws.rs.core.Request;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Array;
import java.sql.SQLException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "OperadorServlet", urlPatterns = {"/OperadorServlet"})
public class OperadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "funciones" : request.getParameter("action");
        //OperadorDao operadorDao = null;
        PeliculasDao peliculasDao = new PeliculasDao();
        OperadorDao operadorDao = new OperadorDao();
        String filtro = request.getParameter("listarFunciones");
        String fil_fecha;
        String fil_sala;

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        String rol=usuarioLogueado.getRol();
        RequestDispatcher requestDispatcher;
        AdminDao adminDao = new AdminDao();

        if (Objects.equals(usuarioLogueado.getRol(), "operador")){
            switch (action) {

                case "funciones" -> {
                    request.setAttribute("listarFunciones", "");
                    request.setAttribute("Funciones", operadorDao.filtradoFunciones("","",""));
                    request.setAttribute("listapelicula1",operadorDao.obtenerlistaPeliculas());
                    request.setAttribute("listaSalas", operadorDao.obtenerSala()); // Para exportar
                    request.setAttribute("listaPersonal", operadorDao.obtenerPersonal());
                    request.setAttribute("listaSalasAforo",adminDao.listarSalasAforoAdmin());

                    requestDispatcher = request.getRequestDispatcher("Operador/Todas_func.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "crearFu" ->{
                    request.setAttribute("listaPersonal",operadorDao.obtenerPersonal());
                    requestDispatcher = request.getRequestDispatcher("Operador/personal.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "reporte_send"-> {
                    fil_sala = request.getParameter("sala");
                    System.out.println("LLEGA SEÑAL");
                    fil_fecha = request.getParameter("fecha");
                    System.out.println(fil_fecha + fil_sala);
                    response.sendRedirect(request.getContextPath() + "/reporte?sala=" + fil_sala + "&fecha=" + fil_fecha);

                    break;
                }
                case "crearPe" ->{
                    ArrayList<BProfesional> listaProfesionales= AdminDao.obtenerProfesionales();
                    request.setAttribute("listaProfesionales",listaProfesionales);
                    request.setAttribute("listaPeliculas", peliculasDao.listasPeliculas());
                    requestDispatcher = request.getRequestDispatcher("Operador/profesionalOperador.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }
                case "peliculas"->{
                    ArrayList<BPeliculas> listaPeliculas = peliculasDao.listasPeliculas();

                    request.setAttribute("directores",peliculasDao.listaDirector());
                    request.setAttribute("actores",peliculasDao.listaActor());
                    request.setAttribute("Peliculas", listaPeliculas);
                    requestDispatcher = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                    requestDispatcher.forward(request, response);
                    break;
                }

                case "borrarpeli"->{
                    if (request.getParameter("id") != null) {
                        String idpeliString = request.getParameter("id");
                        int idpeli = 0;
                        try {
                            idpeli = Integer.parseInt(idpeliString);

                            request.setAttribute("Peliculas", peliculasDao.listasPeliculas());
                        } catch (NumberFormatException ex) {
                            response.sendRedirect("OperadorServlet?action=peliculas");
                        }

                        BPeliculas peli = peliculasDao.obtenerPelicula(idpeli);

                    if ( peli != null) {
                        peliculasDao.borrarFunciondeunaPelicula(idpeli);
                        peliculasDao.borrarPelicula(idpeli);
                    }
                }
                response.sendRedirect("OperadorServlet?action=peliculas");
                break;
                }
                case "borrarfuncion" ->{
                    operadorDao.borrarFuncion(Integer.parseInt(request.getParameter("id")));
                    response.sendRedirect("OperadorServlet");
                    break;
                }
                case "borrarpersonal" ->{
                    operadorDao.borrarPersonal(Integer.parseInt(request.getParameter("id")));
                    response.sendRedirect("OperadorServlet?action=crearFu");

                    break;
                }


            }
        }
        else if (Objects.equals(rol, "cliente")){
            response.sendRedirect(request.getContextPath() + "/inicio?action=registrado");
        }
        else if (Objects.equals(rol, "admin")){
            response.sendRedirect(request.getContextPath() + "/ServAdmin");
        }
        else{
            response.sendRedirect(request.getContextPath() + "/inicio");
        }












    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String action = request.getParameter("action") ;
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "redireccionar" : request.getParameter("action");
        //OperadorDao operadorDao = null;
        OperadorDao operadorDao = new OperadorDao();
        String filtro;
        PeliculasDao peliculasDao = new PeliculasDao();
        RequestDispatcher view;

        BFuncion funciones;
        //ArrayList<BFuncion> lista = operadorDao.TodasLasFunciones();
        String filtro2;
        String fechainicio;
        String fechafin;

        String fil_fecha;
        String fil_sala;
        AdminDao adminDao = new AdminDao();
        switch (action) {

            case "filtro_func" -> {
                filtro = request.getParameter("listarFunciones");
                fechainicio=request.getParameter("fecha_in");
                fechafin=request.getParameter("fecha_fin");
                System.out.println("Filtro funcion");
                System.out.println(filtro);
                System.out.println(fechainicio);
                System.out.println(fechafin);

                request.setAttribute("listapelicula1",operadorDao.obtenerlistaPeliculas());
                request.setAttribute("listaSalas", operadorDao.obtenerSala());
                request.setAttribute("listaPersonal", operadorDao.obtenerPersonal());
                request.setAttribute("Funciones", operadorDao.filtradoFunciones(filtro,fechainicio,fechafin));
                request.setAttribute("listarFunciones", filtro);
                request.setAttribute("listaSalasAforo",adminDao.listarSalasAforoAdmin());

                view = request.getRequestDispatcher("Operador/Todas_func.jsp");
                view.forward(request, response);
                break;
            }

            case "filtro_peli" -> {
                System.out.println("HOLAAA Peli");

                fechainicio=request.getParameter("fecha_in");
                fechafin=request.getParameter("fecha_fin");
                System.out.println("Filtro pelicula");
                System.out.println(fechainicio);
                System.out.println(fechafin);

                filtro2 = request.getParameter("listarPeliculas");
                request.setAttribute("Peliculas", operadorDao.filtradoPelicula(filtro2));
                request.setAttribute("listarPeliculas", filtro2);
                view = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                view.forward(request, response);
                break;
            }

            case "reporte"-> {
                fil_sala= request.getParameter("filtro_sala");

                System.out.println("LLEGA SEÑAL");
                fil_fecha = request.getParameter("filtro_fecha");
                System.out.println("HOLA" + fil_sala + fil_fecha);
                response.sendRedirect(request.getContextPath()+"/OperadorServlet?action=reporte_send&sala="+fil_sala+"&fecha="+fil_fecha);

                break;
            }

            case "editarDesc" ->{
                int id = Integer.parseInt(request.getParameter("id"));
                String desc = request.getParameter("descripcion");
                OperadorDao.EditarDescripcion(id,desc);
                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "editarPort" ->{
                int id = Integer.parseInt(request.getParameter("id"));
                Part foto = request.getPart("fotonueva");
                InputStream fotoinput = null;
                fotoinput = foto.getInputStream();
                peliculasDao.ActualizarPortadaPeli(id,fotoinput);
                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "crearpeli" ->{
                String titulo = request.getParameter("titulo");
                String genero = request.getParameter("genero");
                String descripcion = request.getParameter("descripcion");
                Part foto = request.getPart("fotopeli");
                InputStream fotoinput = null;
                fotoinput = foto.getInputStream();
                int centi = 0;
                try{
                    int duracion = Integer.parseInt(request.getParameter("duracion"));

                    if (duracion<=0){
                        request.getSession().setAttribute("errorDuracion", "Duración de película inválida");
                        centi = 1;
                    }

                    if (genero.equalsIgnoreCase("accion") || genero.equalsIgnoreCase("animación")
                    || genero.equalsIgnoreCase("aventura") || genero.equalsIgnoreCase("ciencia ficcion")
                    || genero.equalsIgnoreCase("comedia") || genero.equalsIgnoreCase("misterio")
                    || genero.equalsIgnoreCase("suspenso") || genero.equalsIgnoreCase("drama")
                    || genero.equalsIgnoreCase("terror")){

                    } else {
                        request.getSession().setAttribute("errorGenero", "Género de película inválido");
                        centi = 1;
                    }


                    if(centi==0){
                        request.getSession().setAttribute("crearPelicula", "Película creada con éxito");

                        peliculasDao.crearPelicula(titulo,duracion,genero,fotoinput,descripcion);
                    }

                } catch (NumberFormatException e){
                    request.getSession().setAttribute("errorDuracion", "Duración de película inválida");
                }



                response.sendRedirect(request.getContextPath() + "/OperadorServlet?action=peliculas");

            }
            case "buscarpelicula" ->{
                String txtbuscar = request.getParameter("txtbuscar");

                request.setAttribute("directores",peliculasDao.listaDirector());
                request.setAttribute("actores",peliculasDao.listaActor());
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("Peliculas", peliculasDao.buscarPeliculaporNombre(txtbuscar));
                view = request.getRequestDispatcher("Operador/Todas_Peli.jsp");
                view.forward(request, response);

            }
            case "crearFunciones"->{
                funciones =new BFuncion();

                int aforoOperador=Integer.parseInt(request.getParameter("aforoOperador"));
                int precio_ticket=Integer.parseInt(request.getParameter("precio_ticket"));
                int edad_minima=Integer.parseInt(request.getParameter("edad_minima"));
                int idPersonal=Integer.parseInt(request.getParameter("idPersonal"));

                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                LocalTime horaTimeInicio = LocalTime.parse(hora);
                int idSala = Integer.parseInt(request.getParameter("idSala"));
                int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
                LocalTime horaTimeFinal = horaTimeInicio.plusMinutes(operadorDao.obtenerDuracionPelicula(idPelicula));


                int centi = 0;
                ArrayList<DTOfunciones_peliculas> listaFuConDu = operadorDao.listaFuncionesDuracion();
                for (DTOfunciones_peliculas fu : listaFuConDu){
                    if (fu.getIdSala()==idSala && fu.getFecha().equals(fecha)){
                        if((horaTimeInicio.isAfter(LocalTime.parse(fu.getHora()).minusMinutes(1)) && horaTimeInicio.isBefore(LocalTime.parse(fu.getHora()).plusMinutes(fu.getDuracion()))) || (horaTimeFinal.isAfter(LocalTime.parse(fu.getHora())) && horaTimeFinal.isBefore(LocalTime.parse(fu.getHora()).plusMinutes(fu.getDuracion())))){

                            request.getSession().setAttribute("errorCrear", "Intento fallido, cruce con la funciÃ³n de ID: " + fu.getIdFuncion());
                            centi = 1;
                            break;

                        }
                    }
                }
                //Si no existe cruce de funciones, se inicia con las validaciones de los campos correspondientes::

                if (centi==0){


                    ArrayList<BSedeYSala> AforosAdmin=operadorDao.obtenerSala();
                    ArrayList<BPeliculas> ListaPelis=peliculasDao.listasPeliculas();
                    ArrayList<BEquipoLimpieza> obtenerPersonal=operadorDao.obtenerPersonal();



                    int aforoAdmin=0;
                    boolean existeSala=false;
                    boolean existePersonal=false;

                    boolean existePeli=false;

                    boolean indicadorAforo=false;
                    boolean indicadorEdad=false;
                    boolean indicadorFecha=false;
                    boolean indicadorlimite=false;

                    boolean indicadorProfesionales=false;


                    ArrayList<BProfesional> listaProfRol = operadorDao.listaProfPeliculaRol(idPelicula);
                    int validarRolA= 0;
                    int validarRolD= 0;
                    for (BProfesional p : listaProfRol){
                        if (p.getRol().equalsIgnoreCase("a")){
                            validarRolA = 1;
                        }
                        if (p.getRol().equalsIgnoreCase("p")){
                            validarRolD = 1;
                        }
                    }
                    if (validarRolA==1 && validarRolD==1){
                        indicadorProfesionales = true;
                    } else {
                        request.getSession().setAttribute("errorRolesPeli", "Error al crear: La película necesita al menos un actor y un director");
                    }



                    for(BSedeYSala sala: AforosAdmin){
                        if (idSala==sala.getIdSala()){
                            aforoAdmin= Integer.parseInt(sala.getAforoAdministrador());
                            existeSala=true;
                            break;
                        }
                    }

                    for(BEquipoLimpieza limpieza: obtenerPersonal){
                        if (idPersonal==limpieza.getIdpersonal()){
                            existePersonal=true;
                            break;
                        }
                    }

                    if (!existePersonal){
                        request.getSession().setAttribute("errorPersonal", "Error al crear:Personal seleccionado no existe. ");
                    }



                    /* -------Sala y Pelicula------- */
                    if (!existeSala){
                        request.getSession().setAttribute("errorIDSala", "Error al crear: Sala seleccionada no existe. ");
                        response.sendRedirect(request.getContextPath() + "/OperadorServlet");
                    }
                    else{
                        /* -------Aforo------- */
                        if ((aforoOperador>0) && (aforoOperador<=aforoAdmin)) { indicadorAforo=true;}
                        else { request.getSession().setAttribute("errorAforo", "Error al crear: Valor de Aforo no válido o excede al maximo dado por el administrador.");
                        }
                        /* -------edad_minima------- */

                        if ( (edad_minima>=0) && (edad_minima/25<=1) ) {indicadorEdad=true;}
                        else {request.getSession().setAttribute("errorEdad", "Error al crear: Valor de Edad no válido .");
                        }
                        /* -------Fecha y hora------- */
                        LocalDate fechainput=LocalDate.parse(fecha);
                        DateFormat fechaActual = new SimpleDateFormat("yyyy-MM-dd");
                        Date fechas = new Date();
                        LocalDate hoy= LocalDate.parse(fechaActual.format(fechas));


                        String[] limitefechas=fecha.split("-");
                        int inputlimite=Integer.parseInt(limitefechas[0]);
                        String hoylimitess= String.valueOf(hoy);
                        String[] hoylimites=hoylimitess.split("-");
                        int hoylimite=(Integer.parseInt(hoylimites[0]))+2;
                        //System.out.println(Integer.parseInt(hoylimites[0]));
                        //System.out.println(hoylimite);

                        if (inputlimite<=hoylimite){indicadorlimite=true;}
                        else{request.getSession().setAttribute("fueradelimite", "La fecha de la función está fuera de rango (Solo se crean funciones con un año no superior a: Año actual+2) ");
                        }
                        String horasActuales = new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime());
                        String[] parts = horasActuales.split(":");
                        int horaActual= Integer.parseInt(parts[0]);
                        int minutoActual= Integer.parseInt(parts[1]);

                        String[] partsinput=hora.split(":");
                        int horaInput=Integer.parseInt(partsinput[0]);
                        int minutoInput=Integer.parseInt(partsinput[1]);

                        if (fechainput.isAfter(hoy)){
                            indicadorFecha=true;}
                        if( fechainput.isEqual(hoy)){
                            if (horaInput>horaActual){
                                indicadorFecha=true;
                            }
                            else if (horaInput==horaActual){
                                if(minutoInput>minutoActual){
                                    indicadorFecha=true;
                                }
                            }
                        }

                        if (!indicadorFecha){request.getSession().setAttribute("errorFechas", "Error al crear: Fecha u Hora no válidas. ");}



                        /* -------Personal de mantenimiento------- */






                        if (indicadorProfesionales && indicadorAforo && indicadorEdad && indicadorFecha && indicadorlimite && existePersonal){
                            funciones.setFecha(fecha);
                            funciones.setHora(hora);
                            funciones.setIdSala(idSala);
                            funciones.setIdPelicula(idPelicula);
                            funciones.setPrecioTicket(precio_ticket);
                            funciones.setEdadMinima(edad_minima);
                            funciones.setIdPersonal(idPersonal);
                            funciones.setAforoOperador(aforoOperador);
                            operadorDao.crearFuncion(funciones);
                            request.getSession().setAttribute("success", "Funcion creada correctamente. ");
                        }
                            response.sendRedirect(request.getContextPath() + "/OperadorServlet");
                    }









                }




            }
            case "crearpersonal" ->{
                String jefe = request.getParameter("jefe");
                String p1 = request.getParameter("p1");
                String p2 = request.getParameter("p2");
                operadorDao.crearPersonal(jefe,p1,p2);
                response.sendRedirect("OperadorServlet?action=crearFu");
            }
            case "buscarpersonal" ->{
                String txtbuscar = request.getParameter("txtbuscar");
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("listaPersonal",operadorDao.obtenerPersonalPorNombre(txtbuscar));
                view = request.getRequestDispatcher("Operador/personal.jsp");
                view.forward(request, response);

            }
            case "buscarprofesional" ->{
                String txtbuscar = request.getParameter("txtbuscar");
                request.setAttribute("txtbuscado",txtbuscar);
                request.setAttribute("listaPeliculas", peliculasDao.listasPeliculas());
                ArrayList<BProfesional> listaProfesionales= operadorDao.obtenerProfesionalesPorNombre(txtbuscar);
                request.setAttribute("listaProfesionales",listaProfesionales);
                view = request.getRequestDispatcher("Operador/profesionalOperador.jsp");
                view.forward(request, response);

            }
            case "asignarpelicula" ->{
                int idProf = Integer.parseInt(request.getParameter("id"));
                int idPel = Integer.parseInt(request.getParameter("idPel"));
                operadorDao.asignarProfesionalaPelicula(idPel,idProf);
                response.sendRedirect("OperadorServlet?action=crearPe");
            }
            case "retirarpelicula" ->{
                int idProf = Integer.parseInt(request.getParameter("id"));
                int idPel2 = Integer.parseInt(request.getParameter("idPel2"));
                operadorDao.borrarProfesionaldePelicula(idPel2,idProf);
                response.sendRedirect("OperadorServlet?action=crearPe");
            }
            case "editarFuncion" ->{
                int idFuncion = Integer.parseInt(request.getParameter("id"));
                int idSala = Integer.parseInt(request.getParameter("idSala"));
                int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
                String fecha = request.getParameter("fecha");
                String hora = request.getParameter("hora");
                LocalTime horaTimeInicio = LocalTime.parse(hora);
                LocalTime horaTimeFinal = horaTimeInicio.plusMinutes(operadorDao.obtenerDuracionFuncion(idFuncion));


                int centi = 0;
                ArrayList<DTOfunciones_peliculas> listaFuConDu = operadorDao.listaFuncionesDuracion();
                for (DTOfunciones_peliculas fu : listaFuConDu){
                    if (fu.getIdSala()==idSala && fu.getFecha().equals(fecha)){
                        if((horaTimeInicio.isAfter(LocalTime.parse(fu.getHora()).minusMinutes(1)) && horaTimeInicio.isBefore(LocalTime.parse(fu.getHora()).plusMinutes(fu.getDuracion()))) || (horaTimeFinal.isAfter(LocalTime.parse(fu.getHora())) && horaTimeFinal.isBefore(LocalTime.parse(fu.getHora()).plusMinutes(fu.getDuracion())))){
                            if (idFuncion!=fu.getIdFuncion()) {
                                request.getSession().setAttribute("errorCrear", "Intento fallido, cruce con la función de ID: " + fu.getIdFuncion());
                                centi = 1;
                                break;
                            }
                        }
                    }
                }

                if (centi == 0) {
                    int precio = Integer.parseInt(request.getParameter("precio"));
                    peliculasDao.actualizarFuncion(fecha, hora, precio, idFuncion);
                }

                response.sendRedirect("OperadorServlet?action=funciones");

            }

        }
    }

}