package Cerisaie.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "sport", schema = "cerisaie")
public class SportEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "codesport")
    private int id;

    @Column(name = "libellesport")
    private String libelle;

    @Column(name = "unitetpssport")
    private String unite;

    @Column(name = "tarifunite")
    private int unitPrice;

    public SportEntity() {}

    public SportEntity(int id, String libelle, String unite, int unitPrice) {
        this.id = id;
        this.libelle = libelle;
        this.unite = unite;
        this.unitPrice = unitPrice;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public String getUnite() {
        return unite;
    }

    public int getUnitPrice() {
        return unitPrice;
    }
}
