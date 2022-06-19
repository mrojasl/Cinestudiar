package com.example.cinestudiar.servlets;

import com.example.cinestudiar.beans.BProfesional;
import com.example.cinestudiar.beans.BSedeYSala;
import com.example.cinestudiar.beans.BUser;
import com.example.cinestudiar.daos.AdminDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Blob;
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

            case "borraroperador":
                String opcodigo = request.getParameter("opcodigo");
                AdminDao.EliminarOperador(opcodigo);
                response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=operador");



        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("admin") == null? "sala" : request.getParameter("admin");


        switch (action) {
            case "crearsala" -> {
                int aforo = Integer.parseInt(request.getParameter("aforo"));
                String sede = request.getParameter("sede");
                AdminDao.crearSala(aforo, sede);
                response.sendRedirect(request.getContextPath() + "/ServAdmin");

            }

            case "editaroborrarsala" -> {
                int aforo2 = Integer.parseInt(request.getParameter("aforo2"));
                String sede2 = request.getParameter("sede2");
                int id = Integer.parseInt(request.getParameter("id"));
                int aforo_op=Integer.parseInt(request.getParameter("aforo_op"));

                if (request.getParameter("editar")!=null){
                    AdminDao.editarSala(id,aforo2,aforo_op,sede2);
                } else if (request.getParameter("borrar")!=null){
                    AdminDao.borrarSala(id);
                }
                response.sendRedirect(request.getContextPath() + "/ServAdmin");

            }

            case "crearprofesional" -> {
                String nombreyapellido = request.getParameter("nombreyapellido");
                String profesion = request.getParameter("profesion");
                Blob fotodeperfil = null;
                String[] nombreyapellido_sepa = nombreyapellido.split(" ");
                if (profesion.equalsIgnoreCase("Actor")) {
                    profesion = "a";
                } else profesion = "d";
                AdminDao.crearProfesional(nombreyapellido_sepa[0], nombreyapellido_sepa[1], profesion, fotodeperfil);
                response.sendRedirect(request.getContextPath() + "/ServAdmin");

            }

            case "buscaroperador" ->{
                String txtbuscar = request.getParameter("txtbuscar");
                request.setAttribute("listaOperadores",AdminDao.BuscarOperadorPorNombre(txtbuscar));
                request.setAttribute("txtbuscado",txtbuscar);
                RequestDispatcher rd2 =request.getRequestDispatcher("Admin/operadores.jsp");
                rd2.forward(request,response);

            }
            case "crearoperador" ->{
                String operadorcodigo = request.getParameter("operadorcodigo");
                AdminDao.AsignarOperador(operadorcodigo);
                response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=operador");
            }
            case "filtrosede" ->{
                String parametro = request.getParameter("filtrosede");
                if (parametro.equalsIgnoreCase("Sin Filtro")){
                    response.sendRedirect(request.getContextPath() + "/ServAdmin?admin=cliente");
                } else{
                    request.setAttribute("listaClientes",AdminDao.FiltrarClientePorSede(parametro));
                    RequestDispatcher rd3 =request.getRequestDispatcher("Admin/clientes.jsp");
                    rd3.forward(request,response);

                }
            }

        }
    }
}
