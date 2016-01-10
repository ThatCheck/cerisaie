package Cerisaie.Entity;

import javax.persistence.*;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "client", schema = "cerisaie")
public class ClientEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "numcli")
    private int id;

    @Column(name = "nomcli")
    private String name;

    @Column(name = "adrruecli")
    private String address;

    @Column(name = "cpcli")
    private int zipCode;

    @Column(name = "villecli")
    private String city;

    @Column(name = "piececli")
    private String piece;

    @Column(name = "numpiececli")
    private int numPiece;

    public ClientEntity() {
    }

    public ClientEntity(String id) {
        this.id = Integer.parseInt(id);
    }

    public ClientEntity(String name, String address, int zipCode, String city, String piece, int numPiece) {
        this.name = name;
        this.address = address;
        this.zipCode = zipCode;
        this.city = city;
        this.piece = piece;
        this.numPiece = numPiece;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPiece() {
        return piece;
    }

    public void setPiece(String piece) {
        this.piece = piece;
    }

    public int getNumPiece() {
        return numPiece;
    }

    public void setNumPiece(int numPiece) {
        this.numPiece = numPiece;
    }
}
