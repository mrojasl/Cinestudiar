package com.example.cinestudiar.beans;


import java.io.InputStream;
import java.sql.Blob;
import java.util.Date;

public class BUser {
    private String codigoPucp;
    private String nombres;
    private String apellidos;
    private String rol;
    private String dni;



    private String telefono;
    private String correo;
    private String contrasena;
    private String fechaNacimiento;



    private String direccion;
    private InputStream foto;
    private byte foto2;
    private String datosTarjeta;

    public BUser() {
    }


    public BUser(String codigoPucp, String contrasena) {
        this.codigoPucp = codigoPucp;
        this.contrasena = contrasena;
    }

    public BUser(String nombres, String rol, String contrasena) {
        this.nombres = nombres;
        this.rol = rol;
        this.contrasena = contrasena;
    }

    public BUser(String codigoPucp, String nombres, String apellidos, String rol, String dni, String telefono, String correo, String contrasena, String fechaNacimiento, String direccion, InputStream foto, String datosTarjeta) {
        this.codigoPucp = codigoPucp;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.rol = rol;
        this.dni = dni;
        this.telefono = telefono;
        this.correo = correo;
        this.contrasena = contrasena;
        this.fechaNacimiento = fechaNacimiento;
        this.direccion = direccion;
        this.foto = foto;
        this.datosTarjeta = datosTarjeta;
    }

    public String getCodigoPucp() {
        return codigoPucp;
    }

    public void setCodigoPucp(String codigoPucp) {
        this.codigoPucp = codigoPucp;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }

    public byte getFoto2() {
        return foto2;
    }

    public void setFoto2(byte foto2) {
        this.foto2 = foto2;
    }

    public String getDatosTarjeta() {
        return datosTarjeta;
    }

    public void setDatosTarjeta(String datosTarjeta) {
        this.datosTarjeta = datosTarjeta;
    }
}