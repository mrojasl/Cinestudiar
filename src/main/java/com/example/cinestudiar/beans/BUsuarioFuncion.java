package com.example.cinestudiar.beans;

import java.sql.Blob;

public class BUsuarioFuncion {

    private Blob fotofuncion;
    private String nombrepelicula;
    private int cantidadtickets;
    private String fechapelicula;
    private String horapelicula;
    private String sede;

    public BUsuarioFuncion() {
    }

    public BUsuarioFuncion(Blob fotofuncion, String nombrepelicula, int cantidadtickets, String fechapelicula, String horapelicula, String sede) {
        this.fotofuncion = fotofuncion;
        this.nombrepelicula = nombrepelicula;
        this.cantidadtickets = cantidadtickets;
        this.fechapelicula = fechapelicula;
        this.horapelicula = horapelicula;
        this.sede = sede;
    }

    public Blob getFotofuncion() {
        return fotofuncion;
    }

    public void setFotofuncion(Blob fotofuncion) {
        this.fotofuncion = fotofuncion;
    }

    public String getNombrepelicula() {
        return nombrepelicula;
    }

    public void setNombrepelicula(String nombrepelicula) {
        this.nombrepelicula = nombrepelicula;
    }

    public int getCantidadtickets() {
        return cantidadtickets;
    }

    public void setCantidadtickets(int cantidadtickets) {
        this.cantidadtickets = cantidadtickets;
    }

    public String getFechapelicula() {
        return fechapelicula;
    }

    public void setFechapelicula(String fechapelicula) {
        this.fechapelicula = fechapelicula;
    }

    public String getHorapelicula() {
        return horapelicula;
    }

    public void setHorapelicula(String horapelicula) {
        this.horapelicula = horapelicula;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }
}
