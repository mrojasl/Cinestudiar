package com.example.cinestudiar.beans;

public class BUsuarioFuncion {

    private int idpelicula;
    private String nombrepelicula;
    private int cantidadtickets;
    private String fechapelicula;
    private String horapelicula;
    private String sede;

    private int historialcompra;




    public BUsuarioFuncion() {
        this.idpelicula = idpelicula;
        this.nombrepelicula = nombrepelicula;
        this.cantidadtickets = cantidadtickets;
        this.fechapelicula = fechapelicula;
        this.horapelicula = horapelicula;
        this.sede = sede;
    }
    public int getHistorialcompra() {
        return historialcompra;
    }

    public void setHistorialcompra(int historialcompra) {
        this.historialcompra = historialcompra;
    }
    public int getIdpelicula() {
        return idpelicula;
    }

    public void setIdpelicula(int idpelicula) {
        this.idpelicula = idpelicula;
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
