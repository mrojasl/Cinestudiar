package com.example.cinestudiar.DTO;

public class DTOpeliculas_has_profesionales {
    private int peliculas_idpelicula;
    private int profesionales_idprofesional;
    private String pelicula;

    public int getPeliculas_idpelicula() {
        return peliculas_idpelicula;
    }

    public void setPeliculas_idpelicula(int peliculas_idpelicula) {
        this.peliculas_idpelicula = peliculas_idpelicula;
    }

    public int getProfesionales_idprofesional() {
        return profesionales_idprofesional;
    }

    public void setProfesionales_idprofesional(int profesionales_idprofesional) {
        this.profesionales_idprofesional = profesionales_idprofesional;
    }

    public String getPelicula() {
        return pelicula;
    }

    public void setPelicula(String pelicula) {
        this.pelicula = pelicula;
    }
}
