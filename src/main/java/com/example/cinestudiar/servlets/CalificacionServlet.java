package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.daos.FuncionesDao;
import com.example.cinestudiar.daos.PerfilDao;
import com.example.cinestudiar.daos.ProfesionalesDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CalificacionServlet", value = "/calificacion")
public class CalificacionServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view;
        ProfesionalesDao profesionalesDao = new ProfesionalesDao();
        ArrayList<BProfesional> listaBProfesional = profesionalesDao.listaProfesionalesCompra(request.getParameter("historial"));
        request.setAttribute("historial",request.getParameter("historial"));
        request.setAttribute("listaProfesionales",listaBProfesional);
        view = request.getRequestDispatcher("Usuario/calificar.jsp");

        view.forward(request, response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FuncionesDao funcionesDao = new FuncionesDao();
        ProfesionalesDao profesionalesDao = new ProfesionalesDao();
        String action = request.getParameter("a") == null ? "lista" : request.getParameter("a");

        if("calificar".equals(action)){
            String funcion = request.getParameter("funcion");
            String historialCompra = request.getParameter("historial");
            System.out.println(historialCompra);
            ArrayList<BProfesional> listaBProfesional = profesionalesDao.listaProfesionalesCompra(historialCompra);

            for (BProfesional valor: listaBProfesional){
                if(valor.getRol().equals("d")){
                    String iddirector=request.getParameter("idprofesionaldirector"+valor.getIdProfesional());
                    String director= request.getParameter("director"+valor.getIdProfesional());
                    profesionalesDao.agregarCalificaciónProfesional(director,historialCompra, Integer.parseInt(iddirector));
                    //System.out.println("Director---");
                    //System.out.println(iddirector);
                    //System.out.println(director);
                }
                if(valor.getRol().equals("a")){
                    String idactor=request.getParameter("idprofesionalactor"+valor.getIdProfesional());
                    String actor=request.getParameter("actor"+valor.getIdProfesional());
                    profesionalesDao.agregarCalificaciónProfesional(actor,historialCompra, Integer.parseInt(idactor));
                    //System.out.println("Actores---");
                    //System.out.println(idactor);

                    //System.out.println(actor);
                }
            }
            funcionesDao.actualizarCalificacionFuncion(historialCompra,funcion);
            response.sendRedirect(request.getContextPath()+"/PerfildeUsuario?a=tickets");
        }

    }
}
