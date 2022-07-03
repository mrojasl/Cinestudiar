package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.UsuariosDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoguinServlet", value = "/loguin")
public class LoguinServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("Usuario/loguin.jsp");
        view.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        UsuariosDao usuariosDao = new UsuariosDao();
        String codigo= request.getParameter("codigo");
        String contraseña = request.getParameter("password");
        System.out.println(codigo+contraseña);

        BUser usuario = usuariosDao.validarPass(contraseña,codigo);

        if(usuario !=null){
            session.setAttribute("usuario",usuario);
            session.setMaxInactiveInterval(60*60);
            session.setAttribute("codigo_pucp",codigo);
            String rol=usuario.getRol();
            System.out.println(usuario.getRol());
            switch (rol){
                case "admin"->{
                    response.sendRedirect(request.getContextPath()+"/ServAdmin");
                }
                case "operador"->{
                    response.sendRedirect(request.getContextPath()+"/OperadorServlet");
                }
                case "cliente"->{
                    response.sendRedirect(request.getContextPath()+"/inicio?action=registrado");
                }
            }

        }else{
            session.setAttribute("indicador","error");
            response.sendRedirect(request.getContextPath()+"/loguin");
        }



    }
}
