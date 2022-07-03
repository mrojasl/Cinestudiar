package com.example.cinestudiar.filter;
import com.example.cinestudiar.beans.BUser;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "MyFilter",servletNames = {"CarritoServlet","PerfilServlet"})
public class MyFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest) req;
        HttpServletResponse response=(HttpServletResponse) resp;


        BUser usuarioLogueado = (BUser) request.getSession().getAttribute("usuarioLogueado");
        //System.out.println(request.getSession().getAttribute("usuarioLogueado"));


        if (usuarioLogueado==null){

            response.sendRedirect(request.getContextPath()+"/inicio");
        }
        else{
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setHeader("Expires", "0"); // Proxies.
            chain.doFilter(request,response);
        }
    }
}



