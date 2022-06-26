package com.example.cinestudiar.beans;

public class BPeliculas {
        private int idpeliculas;
        private String nombre;
        private int duracion;
        private String calificacion;
        private String genero;
        private String información;


        public BPeliculas(int idpeliculas, String nombre, String información) {
                this.idpeliculas = idpeliculas;
                this.nombre = nombre;
                this.información = información;
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

        public String getCalificacion() {
                return calificacion;
        }

        public void setCalificacion(String calificacion) {
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
