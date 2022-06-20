package com.example.cinestudiar.beans;

import java.sql.Blob;

public class BPerfil {



    private String nombre;
    private String codigopucp;
    private String numero;
    private int dni;
    private String direccion;
    private String correo;
    private Blob fotoperfil;
    private String contrasenha;


    public BPerfil(String nombre, String codigopucp, String numero, int dni, String direccion, String correo, Blob fotoperfil, String contrasenha) {
        this.nombre = nombre;
        this.codigopucp = codigopucp;
        this.numero = numero;
        this.dni = dni;
        this.direccion = direccion;
        this.correo = correo;
        this.fotoperfil = fotoperfil;
        this.contrasenha = contrasenha;
    }

    public BPerfil() {
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigopucp() {
        return codigopucp;
    }

    public void setCodigopucp(String codigopucp) {
        this.codigopucp = codigopucp;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }



    public Blob getFotoperfil() {
        return fotoperfil;
    }

    public void setFotoperfil(Blob fotoperfil) {
        this.fotoperfil = fotoperfil;
    }

    public String getContrasenha() {
        return contrasenha;
    }

    public void setContrasenha(String contrasenha) {
        this.contrasenha = contrasenha;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }
}
