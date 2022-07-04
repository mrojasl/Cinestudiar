package com.example.cinestudiar.beans;

public class BFuncionUsuario {

    private int idFuncion;
    private String fecha;
    private String hora;
    private double precioTicket;
    private int edadMinima;
    private BProfesional bProfesional;
    private BSedeUsuario bSedeUsuario;
    private BPeliculas pelicula;
    private float calificacion;
    private float asistencia;

    public BFuncionUsuario(int idFuncion, String fecha, String hora, double precioTicket, int edadMinima, BSedeUsuario bSedeUsuario, BPeliculas pelicula) {
        this.idFuncion = idFuncion;
        this.fecha = fecha;
        this.hora = hora;
        this.precioTicket = precioTicket;
        this.edadMinima = edadMinima;
        this.bProfesional = bProfesional;
        this.bSedeUsuario = bSedeUsuario;
        this.pelicula = pelicula;
    }

    public int getIdFuncion() {
        return idFuncion;
    }

    public void setIdFuncion(int idFuncion) {
        this.idFuncion = idFuncion;
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

    public double getPrecioTicket() {
        return precioTicket;
    }

    public void setPrecioTicket(double precioTicket) {
        this.precioTicket = precioTicket;
    }

    public int getEdadMinima() {
        return edadMinima;
    }

    public void setEdadMinima(int edadMinima) {
        this.edadMinima = edadMinima;
    }

    public BProfesional getbProfesional() {
        return bProfesional;
    }

    public void setbProfesional(BProfesional bProfesional) {
        this.bProfesional = bProfesional;
    }

    public BSedeUsuario getbSedeUsuario() {
        return bSedeUsuario;
    }

    public void setbSedeUsuario(BSedeUsuario bSedeUsuario) {
        this.bSedeUsuario = bSedeUsuario;
    }

    public BPeliculas getPelicula() {
        return pelicula;
    }

    public void setPelicula(BPeliculas pelicula) {
        this.pelicula = pelicula;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    public float getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(float asistencia) {
        this.asistencia = asistencia;
    }
}
