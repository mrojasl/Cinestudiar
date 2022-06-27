package com.example.cinestudiar.beans;

public class BPeliculas {
        private int idpeliculas;
        private String nombre;
        private int duracion;
        private double calificacion;
        private String genero;
        private String información;

        private BProfesional profesional;



        public BPeliculas(int idpeliculas, BProfesional profesional) {
                this.idpeliculas = idpeliculas;
                this.profesional = profesional;
        }

        public BPeliculas(int idpeliculas, String nombre, int duracion, double calificacion, String genero, String información) {
                this.idpeliculas = idpeliculas;
                this.nombre = nombre;
                this.duracion = duracion;
                this.calificacion = calificacion;
                this.genero = genero;
                this.información = información;
        }
        public BProfesional getProfesional() {
                return profesional;
        }

        public void setProfesional(BProfesional profesional) {
                this.profesional = profesional;
        }

        public int getIdpeliculas() {
                return idpeliculas;
        }

        public void setIdpeliculas(int idpeliculas) {
                this.idpeliculas = idpeliculas;
        }

        public String getNombre() {
                return nombre;
        }

        public void setNombre(String nombre) {
                this.nombre = nombre;
        }

        public int getDuracion() {
                return duracion;
        }

        public void setDuracion(int duracion) {
                this.duracion = duracion;
        }

        public double getCalificacion() {
                return calificacion;
        }

        public void setCalificacion(double calificacion) {
                this.calificacion = calificacion;
        }

        public String getGenero() {
                return genero;
        }

        public void setGenero(String genero) {
                this.genero = genero;
        }

        public String getInformación() {
                return información;
        }

        public void setInformación(String información) {
                this.información = información;
        }
}
