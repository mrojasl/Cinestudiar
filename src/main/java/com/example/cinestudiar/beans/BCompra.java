package com.example.cinestudiar.beans;

public class BCompra extends BUser{
    private int idcompra;
    private String qr;
    private int cantidad_tikets;
    private Double pago_total;
    private String fecha_compra;
    private String hora_compra;

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
