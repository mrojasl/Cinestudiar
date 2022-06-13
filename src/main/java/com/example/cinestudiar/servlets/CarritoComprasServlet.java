package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.daos.CarritocomprasDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CarritoComprasServlet", value = "/checkout")
public class CarritoComprasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarritocomprasDao carritocomprasDao= new CarritocomprasDao();
        ArrayList<BCarrito> carritoCliente=carritocomprasDao.obtenerdelCliente();


        request.setAttribute("carritoCliente",carritoCliente);
        RequestDispatcher view =request.getRequestDispatcher("Usuario/carrito_compras/checkout.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
