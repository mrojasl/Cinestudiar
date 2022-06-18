package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminClienteServlet", value = "/admincliente")
public class AdminClienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {
        ArrayList<BUser> listaClientes= AdminDao.obtenerClientes();
        request.setAttribute("listaClientes",listaClientes);
        RequestDispatcher rd =request.getRequestDispatcher("Admin/clientes.jsp");
        rd.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
