package com.example.cinestudiar.filter;

import com.example.cinestudiar.beans.BUser;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebFilter(filterName = "NoSesionFilter",servletNames = {"InicioSinSesionServlet","LoguinServlet","DetallesSinSesion"})
public class NoSesionFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {


        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;

        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");

        if (usuarioLogueado!=null){
            String rol=usuarioLogueado.getRol();

            switch (rol){
                case "cliente" ->{
                    response.sendRedirect(request.getContextPath()+"/inicio?action=registrado");
                }
                case "operador" ->{
                    response.sendRedirect(request.getContextPath()+"/OperadorServlet");
                }
                case "admin" ->{
                    response.sendRedirect(request.getContextPath()+"/ServAdmin");
                }
            }
        }
        else{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setHeader("Expires", "0"); // Proxies.
            chain.doFilter(request,response);
        }






    }
}
