package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServAdmin", value = "/ServAdmin")
public class ServAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("admin") == null? "sala" : request.getParameter("admin");


        switch(action){
            case "sala":
                ArrayList<BSedeYSala> listaSedesYSalas = AdminDao.obtenerSedesySalas();
                request.setAttribute("listaSedesYSalas",listaSedesYSalas);

                RequestDispatcher rd1 =request.getRequestDispatcher("Admin/salas.jsp");
                rd1.forward(request,response);

            case "operador":
                ArrayList<BUser> listaOperadores=AdminDao.obtenerOperadores();
                request.setAttribute("listaOperadores",listaOperadores);

                RequestDispatcher rd2 =request.getRequestDispatcher("Admin/operadores.jsp");
                rd2.forward(request,response);

            case "cliente":
                ArrayList<BUser> listaClientes= AdminDao.obtenerClientes();
                request.setAttribute("listaClientes",listaClientes);

                RequestDispatcher rd3 =request.getRequestDispatcher("Admin/clientes.jsp");
                rd3.forward(request,response);

            case "profesional":
                ArrayList<BProfesional> listaProfesionales= AdminDao.obtenerProfesionales();
                request.setAttribute("listaProfesionales",listaProfesionales);

                RequestDispatcher rd4 =request.getRequestDispatcher("Admin/actoresydirectores.jsp");
                rd4.forward(request,response);

        }







    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("admin") == null? "sala" : request.getParameter("admin");


        switch(action) {
            case "crearsala":
                String aforo = request.getParameter("aforo");
                String sede = request.getParameter("sede");


            case "crearprofesinal":



        }

    }
}
