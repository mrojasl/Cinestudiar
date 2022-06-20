package com.example.cinestudiar.beans;

import java.io.File;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Time;

public class BCarrito {


    private String nombre_pelicula;
    private String fecha;
    private String hora;
    private String nombre_sede;
    private int cantidad_funcion;
    private int precio_ticket;
    private String imagen;

    private byte[] archivoimagen;

    private int idpelicula;
    private String codigoEstudiante;

    private int idfuncion;
    private int historialcompra;

    public int getHistorialcompra() {
        return historialcompra;
    }

    public void setHistorialcompra(int historialcompra) {
        this.historialcompra = historialcompra;
    }

    public BCarrito(String nombre, int cantidadxfuncion, String nombrepelicula, Date diafuncion, Time horafuncion, int precioxticket) {
    }

    public BCarrito() {

    }

    public byte[] getArchivoimagen() {
        return archivoimagen;
    }

    public void setArchivoimagen(byte[] archivoimagen) {
        this.archivoimagen = archivoimagen;
    }

    public int getIdfuncion() {
        return idfuncion;
    }

    public void setIdfuncion(int idfuncion) {
        this.idfuncion = idfuncion;
    }

    private int idcompra;
    private int aforoOperador;


    public int getAforoOperador() {
        return aforoOperador;
    }

    public void setAforoOperador(int aforoOperador) {
        this.aforoOperador = aforoOperador;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public String getCodigoEstudiante() {
        return codigoEstudiante;
    }

    public void setCodigoEstudiante(String codigoEstudiante) {
        this.codigoEstudiante = codigoEstudiante;
    }

    public String getNombre_pelicula() {
        return nombre_pelicula;
    }

    public void setNombre_pelicula(String nombre_pelicula) {
        this.nombre_pelicula = nombre_pelicula;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getNombre_sede() {
        return nombre_sede;
    }

    public void setNombre_sede(String nombre_sede) {
        this.nombre_sede = nombre_sede;
    }

    public int getCantidad_funcion() {
        return cantidad_funcion;
    }

    public void setCantidad_funcion(int cantidad_funcion) {
        this.cantidad_funcion = cantidad_funcion;
    }

    public int getPrecio_ticket() {
        return precio_ticket;
    }

    public void setPrecio_ticket(int precio_ticket) {
        this.precio_ticket = precio_ticket;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getIdpelicula() {
        return idpelicula;
    }

    public void setIdpelicula(int idpelicula) {
        this.idpelicula = idpelicula;
    }
}
//check