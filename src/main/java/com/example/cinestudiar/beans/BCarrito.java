package com.example.cinestudiar.beans;

import java.sql.Date;
import java.sql.Time;

public class BCarrito {

    private String nombres;
    private int cantidad_por_funcion;
    private String nombre_pelicula;
    private Date dia_funcion;
    private Time hora_funcion;
    private int precioxticket;


    public BCarrito(String nombres, int cantidad_por_funcion, String nombre_pelicula, Date dia_funcion, Time hora_funcion, int precioxticket) {
        this.nombres = nombres;
        this.cantidad_por_funcion = cantidad_por_funcion;
        this.nombre_pelicula = nombre_pelicula;
        this.dia_funcion = dia_funcion;
        this.hora_funcion = hora_funcion;
        this.precioxticket = precioxticket;
    }



    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public int getCantidad_por_funcion() {
        return cantidad_por_funcion;
    }

    public void setCantidad_por_funcion(int cantidad_por_funcion) {
        this.cantidad_por_funcion = cantidad_por_funcion;
    }

    public String getNombre_pelicula() {
        return nombre_pelicula;
    }

    public void setNombre_pelicula(String nombre_pelicula) {
        this.nombre_pelicula = nombre_pelicula;
    }

    public Date getDia_funcion() {
        return dia_funcion;
    }

    public void setDia_funcion(Date dia_funcion) {
        this.dia_funcion = dia_funcion;
    }

    public Time getHora_funcion() {
        return hora_funcion;
    }

    public void setHora_funcion(Time hora_funcion) {
        this.hora_funcion = hora_funcion;

    }

    public int getPrecioxticket() {
        return precioxticket;
    }

    public void setPrecioxticket(int precioxticket) {
        this.precioxticket = precioxticket;
    }
}
