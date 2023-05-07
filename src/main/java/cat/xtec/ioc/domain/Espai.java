package cat.xtec.ioc.domain;

import java.io.Serializable;

public class Espai implements Serializable {

    // private static final long serialVersionUID = 1L;
    private String codi;
    private int planta;
    private String zona;
    private int posicio;

    public Espai(String codi, int planta, String zona, int posicio) {
        this.codi = codi;
        this.planta = planta;
        this.zona = zona;
        this.posicio = posicio;
    }

    public Espai() {
    }

    public String getCodi() {
        return codi;
    }

    public int getPlanta() {
        return planta;
    }

    public String getZona() {
        return zona;
    }

    public int getPosicio() {
        return posicio;
    }

    public void setCodi(String codi) {
        this.codi = codi;
    }

    public void setPlanta(int planta) {
        this.planta = planta;
    }

    public void setZona(String zona) {
        this.zona = zona;
    }

    public void setPosicio(int posicio) {
        this.posicio = posicio;
    }

}
