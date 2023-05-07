/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cat.xtec.ioc.domain;

import java.io.Serializable;

/**
 *
 * @author Charlie-Home
 */
public class Reserve implements Serializable{
    private int idReserve;
    private String idSala;
    private String idUsuari;
    private int setmana;
    private String dia;
    private int hora;
    private int temps;

    public Reserve() {
       
    }

    public int getIdReserve() {
        return idReserve;
    }

    public void setIdReserve(int idReserve) {
        this.idReserve = idReserve;
    }

    public String getIdSala() {
        return idSala;
    }

    public void setIdSala(String idSala) {
        this.idSala = idSala;
    }

    public String getIdUsuari() {
        return idUsuari;
    }

    public void setIdUsuari(String idUsuari) {
        this.idUsuari = idUsuari;
    }

    public int getSetmana() {
        return setmana;
    }

    public void setSetmana(int setmana) {
        this.setmana = setmana;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public int getTemps() {
        return temps;
    }

    public void setTemps(int temps) {
        this.temps = temps;
    }

    public Reserve(int idReserve, String idSala, String idUsuari, int setmana, String dia, int hora, int temps) {
        this.idReserve = idReserve;
        this.idSala = idSala;
        this.idUsuari = idUsuari;
        this.setmana = setmana;
        this.dia = dia;
        this.hora = hora;
        this.temps = temps;
    }
}
