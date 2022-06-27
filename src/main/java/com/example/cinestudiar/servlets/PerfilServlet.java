package com.example.cinestudiar.servlets;


import com.example.cinestudiar.beans.BCarrito;
import com.example.cinestudiar.beans.BCompra;
import com.example.cinestudiar.beans.BPerfil;
import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.daos.AdminDao;
import com.example.cinestudiar.daos.CarritoDao;
import com.example.cinestudiar.daos.PerfilDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;

@WebServlet(name = "PerfilServlet", value = "/PerfildeUsuario")
public class PerfilServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("a") == null ? "listar" : request.getParameter("a");
        PerfilDao perfilDao= new PerfilDao();

        request.setAttribute("perfilDusuario",perfilDao.listarUsuario());
        request.setAttribute("usuarioFunciones",perfilDao.listarFunciones());

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
        if ("filtroprofesional".equals(action)) {
            String parametro = request.getParameter("filtroprof");
            if (parametro.equals("Todo")) {
                response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=profesional");
            } else{
                if (parametro.equals("Director")) {
                    parametro="d";
                } else if (parametro.equals("Actor/Actriz")){
                    parametro="a";
                }
                ArrayList<BProfesional> listaProfesionales= AdminDao.ObtenerProfesionalesFiltro(parametro);
                request.setAttribute("listaProfesionales",listaProfesionales);
                RequestDispatcher rd4 =request.getRequestDispatcher("Admin/actoresydirectores.jsp");
                rd4.forward(request,response);
            }


        }


    }
}

