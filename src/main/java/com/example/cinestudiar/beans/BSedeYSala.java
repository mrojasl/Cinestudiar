package com.example.cinestudiar.beans;

public class BSedeYSala {
    private String sede;
    private String direccion;
    private int idSala;
    private String aforoAdministrador;
    private String aforoOperador;

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

    public String getAforoOperador() {
        return aforoOperador;
    }

    public void setAforoOperador(String aforoOperador) {
        this.aforoOperador = aforoOperador;
    }
}
