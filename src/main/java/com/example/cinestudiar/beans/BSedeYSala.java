package com.example.cinestudiar.beans;

public class BSedeYSala {
    private String sede;
    private String direccion;
    private int idSala;
    private String aforoAdministrador;
    private int aforoOperador;
    private int existeFuncion;

    public int getExisteFuncion() {
        return existeFuncion;
    }

    public void setExisteFuncion(int existeFuncion) {
        this.existeFuncion = existeFuncion;
    }

    public String getSede() {
        return sede;
    }

    public void setSede(String sede) {
        this.sede = sede;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public String getAforoAdministrador() {
        return aforoAdministrador;
    }

    public void setAforoAdministrador(String aforoAdministrador) {
        this.aforoAdministrador = aforoAdministrador;
    }

    public int getAforoOperador() {
        return aforoOperador;
    }

    public void setAforoOperador(int aforoOperador) {
        this.aforoOperador = aforoOperador;
    }
}
