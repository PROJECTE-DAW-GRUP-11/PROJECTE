package cat.xtec.ioc.domain;

import java.io.Serializable;

public class Equip implements Serializable {

    // private static final long serialVersionUID = 1L;
    private String codi;
    private String tipus;
    private String numserie;
    private String marca;
    private String model;
    private String estat;
    private String comentari;
    private String tecnic;

    public Equip(String codi, String tipus, String numserie, String marca, String model, String estat) {
        this.codi = codi;
        this.tipus = tipus;
        this.marca = marca;
        this.model = model;
        this.estat = estat;
        this.numserie = numserie;
    }

    public Equip() {
    }

//    public static long getSerialVersionUID() {
//        return serialVersionUID;
//    }
    public String getCodi() {
        return codi;
    }

    public String getTipus() {
        return tipus;
    }

    public String getNumserie() {
        return numserie;
    }

    public String getMarca() {
        return marca;
    }

    public String getModel() {
        return model;
    }

    public String getEstat() {
        return estat;

    }

    public String getTecnic() {
        return tecnic;
    }

    public String getComentari() {
        return comentari;
    }

    public void setCodi(String codi) {
        this.codi = codi;
    }

    public void setTipus(String tipus) {
        this.tipus = tipus;
    }

    public void setNumserie(String numserie) {
        this.numserie = numserie;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public void setEstat(String estat) {
        this.estat = estat;
    }

    public void setComentari(String comentari) {
        this.comentari = comentari;
    }

    public void setTecnic(String tecnic) {
        this.tecnic = tecnic;
    }

}
