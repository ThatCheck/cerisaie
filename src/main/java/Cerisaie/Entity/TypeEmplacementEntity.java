package Cerisaie.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "type_emplacement", schema = "cerisaie")

public class TypeEmplacementEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "codetypee")
    private int id;

    @Column(name = "libtypepl")
    private String libelle;

    @Column(name = "tariftypepl")
    private int price;

    public TypeEmplacementEntity() {}

    public TypeEmplacementEntity(String libelle, int price) {
        this.libelle = libelle;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getLibelle() {
        return libelle;
    }

    public int getPrice() {
        return price;
    }
}
