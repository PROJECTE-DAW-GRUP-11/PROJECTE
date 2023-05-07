package cat.xtec.ioc.domain;

import java.io.Serializable;


public class Usuari implements Serializable {

   // private static final long serialVersionUID = 1L;
    private String idUsuari;  //EQUIVAL AL DNI
    private String nom;
    private String cognoms;
    private String password;
    private String email;
    private String rol;
    private String telefon;



    public Usuari(String idUsuari, String nom, String cognoms, String password, String email, String rol, String telefon) {
        this.idUsuari = idUsuari;
        this.nom = nom;
        this.cognoms = cognoms;
        this.password = password;
        this.email = email;
        this.rol = rol;
        this.telefon = telefon;
    }
 

    public Usuari() {
    }

//    public static long getSerialVersionUID() {
//        return serialVersionUID;
//    }

    public String getIdUsuari() {
        return idUsuari;
    }

    public String getNom() {
        return nom;
    }

    public String getCognoms() {
        return cognoms;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public String getRol() {
        return rol;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setIdUsuari(String idUsuari) {
        this.idUsuari = idUsuari;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setCognoms(String cognoms) {
        this.cognoms = cognoms;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

   



   
}
