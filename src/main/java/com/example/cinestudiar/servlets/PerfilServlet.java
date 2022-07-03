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

        request.setAttribute("perfilDusuario",perfilDao.listarUsuario((String) request.getSession().getAttribute("codigo_pucp")));
        request.setAttribute("usuarioFunciones",perfilDao.listarFunciones((String) request.getSession().getAttribute("codigo_pucp")));

        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/Usuario/perfilUsuario.jsp");
        requestDispatcher.forward(request,response);





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
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario");
        }

        if ("actualizardir".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            String direccion=request.getParameter("direccionnueva");
            bPerfil.setDireccion(direccion);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizadireccion(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario");
        }
        if ("actualizarcon".equals(action)) {
            BPerfil bPerfil= new BPerfil();
            String codigo=request.getParameter("codigopuke");
            String contrasenha=request.getParameter("contranueva");
            bPerfil.setContrasenha(contrasenha);
            bPerfil.setCodigopucp(codigo);
            perfilDao.actualizacontra(bPerfil);
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario");
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
            response.sendRedirect(request.getContextPath() + "/PerfildeUsuario");
        }


    }
}

