package com.example.cinestudiar.servlets;


import com.example.cinestudiar.beans.BPerfil;
import com.example.cinestudiar.daos.PerfilDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@MultipartConfig
@WebServlet(name = "PerfilServlet", value = "/PerfildeUsuario")
public class PerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");

        PerfilDao perfilDao= new PerfilDao();



        if ("perfil".equals(action)) {

            request.setAttribute("perfilDusuario",perfilDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));
            request.setAttribute("usuarioFunciones",perfilDao.listarFunciones((String) request.getSession().getAttribute("codigo_pucp")));

            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/perfilUsuario.jsp");
            requestDispatcher.forward(request,response);
        }
        if ("perfilOpe".equals(action)) {

            request.setAttribute("perfilDusuario",perfilDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));

            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Operador/perfilOperador.jsp");
            requestDispatcher.forward(request,response);
        }
        if ("perfilAdmin".equals(action)) {

            request.setAttribute("perfilDusuario",perfilDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));

            RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Admin/perfilAdmin.jsp");
            requestDispatcher.forward(request,response);
        }

        if ("tickets".equals(action)) {

            request.setAttribute("usuarioFunciones",perfilDao.listarFunciones((String) request.getSession().getAttribute("codigo_pucp")));

            RequestDispatcher view = request.getRequestDispatcher("/Usuario/misTickets.jsp");
            view.forward(request, response);
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PerfilDao perfilDao= new PerfilDao();
        String action = request.getParameter("a") == null ? "lista" : request.getParameter("a");
        if ("actualizartel".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            String telefono=request.getParameter("numerotelefonico");
            bPerfil.setNumero(telefono);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizatelefono(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario?a=perfil");
        }

        if ("actualizardir".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            String direccion=request.getParameter("direccionnueva");
            bPerfil.setDireccion(direccion);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizadireccion(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario?a=perfil");
        }
        if ("actualizarcon".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            String contrasenha=request.getParameter("contranueva");
            bPerfil.setContrasenha(contrasenha);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizacontra(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario?a=perfil");
        }
        if ("actualizarfoto".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            Part foto = request.getPart("fotonueva");
            InputStream fotoinput = null;
            fotoinput = foto.getInputStream();
            bPerfil.setFotoperfil(fotoinput);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizafoto(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario?a=perfil");
        }


    }
}

