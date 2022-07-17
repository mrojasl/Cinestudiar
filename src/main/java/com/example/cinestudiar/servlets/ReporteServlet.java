package com.example.cinestudiar.servlets;

import com.example.cinestudiar.DTO.DTOfunciones_peliculas;
import com.example.cinestudiar.beans.*;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.OperadorDao;
import com.example.cinestudiar.daos.PeliculasDao;

import java.time.LocalDate;
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
import java.util.Objects;

@MultipartConfig
@WebServlet(name = "ReporteServlet", urlPatterns = {"/reporte"})
public class ReporteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "funciones" : request.getParameter("action");
        OperadorDao operadorDao = new OperadorDao();
        String fil_fecha= request.getParameter("fecha");
        String fil_sala=request.getParameter("sala");
        System.out.printf("filsala ="+fil_sala);
        RequestDispatcher requestDispatcher;

        request.setAttribute("Reporte", operadorDao.lista_reporte(fil_sala,fil_fecha));
        requestDispatcher = request.getRequestDispatcher("Operador/prueba_EXPORTADOR.jsp");
        requestDispatcher.forward(request, response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
