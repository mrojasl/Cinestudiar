package com.example.cinestudiar.servlets;

import java.io.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "inicioServlet", urlPatterns = {"/inicio-servlet",""})
public class inicioServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher requestDispatcher =request.getRequestDispatcher("index.jsp");
        requestDispatcher.forward(request,response);

    }

}