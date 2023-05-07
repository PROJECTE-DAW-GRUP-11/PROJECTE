package cat.xtec.ioc.domain;

import java.io.Serializable;
import java.util.Date;

public class Reparacio implements Serializable {

    //private static final long serialVersionUID = 1L;
    private int idReparacio;
    private String idEquip;
    private String dataInici;
    private String dataFi;
    private String comentaris;
    private String tecnic;
    private String comentariTancament;
    private String estat;

    public Reparacio(int idReparacio, String idEquip, String dataInici, String dataFi, String comentaris, String tecnic, String comentariTancament,String estat) {
        this.idReparacio = idReparacio;
        this.idEquip = idEquip;
        this.dataInici = dataInici;
        this.dataFi = dataFi;
        this.comentaris = comentaris;
        this.tecnic = tecnic;
        this.comentariTancament = comentariTancament;
        this.estat = estat;
    }

    public Reparacio() {
    }

    public int getIdReparacio() {
        return idReparacio;
    }

    public String getIdEquip() {
        return idEquip;
    }

    public String getDataInici() {
        return dataInici;
    }

    public String getDataFi() {
        return dataFi;
    }

    public String getComentaris() {
        return comentaris;
    }

    public String getTecnic() {
        return tecnic;
    }

    public String getComentariTancament() {
        return comentariTancament;
    }

    public String getEstat() {
        return estat;
    }
    

    public void setIdReparacio(int idReparacio) {
        this.idReparacio = idReparacio;
    }

    public void setIdEquip(String idEquip) {
        this.idEquip = idEquip;
    }

    public void setDataInici(String dataInici) {
        this.dataInici = dataInici;
    }

    public void setDataFi(String dataFi) {
        this.dataFi = dataFi;
    }

    public void setComentaris(String comentaris) {
        this.comentaris = comentaris;
    }

    public void setTecnic(String tecnic) {
        this.tecnic = tecnic;
    }

    public void setComentariTancament(String comentariTancament) {
        this.comentariTancament = comentariTancament;
    }

    public void setEstat(String estat) {
        this.estat = estat;
    }

    

}
