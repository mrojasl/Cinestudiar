package com.example.cinestudiar.beans;

import java.sql.Blob;

public class BCompra {
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
    private Blob foto;
    private String datosTarjeta;
    private int idcompra;
    private String qr;
    private int cantidad_tikets;
    private Double pago_total;
    private String fecha_compra;
    private String hora_compra;

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

    public Blob getFoto() {
        return foto;
    }

    public void setFoto(Blob foto) {
        this.foto = foto;
    }

    public String getDatosTarjeta() {
        return datosTarjeta;
    }

    public void setDatosTarjeta(String datosTarjeta) {
        this.datosTarjeta = datosTarjeta;
    }

    public int getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(int idcompra) {
        this.idcompra = idcompra;
    }

    public String getQr() {
        return qr;
    }

    public void setQr(String qr) {
        this.qr = qr;
    }

    public int getCantidad_tikets() {
        return cantidad_tikets;
    }

    public void setCantidad_tikets(int cantidad_tikets) {
        this.cantidad_tikets = cantidad_tikets;
    }

    public Double getPago_total() {
        return pago_total;
    }

    public void setPago_total(Double pago_total) {
        this.pago_total = pago_total;
    }

    public String getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(String fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public String getHora_compra() {
        return hora_compra;
    }

    public void setHora_compra(String hora_compra) {
        this.hora_compra = hora_compra;
    }
}
