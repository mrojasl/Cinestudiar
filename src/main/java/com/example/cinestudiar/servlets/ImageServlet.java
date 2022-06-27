package com.example.cinestudiar.servlets;
import com.example.cinestudiar.daos.ImageDao;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ImageServlet", value = "/Image")
public class ImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "" : request.getParameter("action");
        ImageDao imageDao = new ImageDao();

        switch (action){
            case "peliculas"->{
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerimagenes(id);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/gif");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }
            }
            case "usuarios"->{
                int id = Integer.parseInt(request.getParameter("id"));
                byte[] content = null;
                content = imageDao.obtenerimagenesUsuarios(id);
                if (content.length == 1 && content[0] == 0) {
                    System.out.println("Algo falló al nivel de SQL/DB");
                } else if (content.length == 1 && content[0] == 1) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                } else {
                    response.setContentType("image/gif");
                    response.setContentLength(content.length);
                    response.getOutputStream().write(content);
                }

            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
