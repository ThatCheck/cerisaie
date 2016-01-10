package Cerisaie.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "emplacement", schema = "cerisaie")
public class EmplacementEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "numempl")
    private int id;

    @ManyToOne()
    @JoinColumn(name = "codetypee")
    private TypeEmplacementEntity type;

    @Column(name = "surfaceempl")
    private short surface;

    @Column(name = "nbpersmaxempl")
    private short nbMaxPerson;

    public EmplacementEntity() {}


    public EmplacementEntity(String id) {
        this.id = Integer.parseInt(id);
    }

    public EmplacementEntity(TypeEmplacementEntity type, short surface, short nbMaxPerson) {
        this.type = type;
        this.surface = surface;
        this.nbMaxPerson = nbMaxPerson;
    }

    public int getId() {
        return id;
    }

    public TypeEmplacementEntity getType() {
        return type;
    }

    public short getSurface() {
        return surface;
    }

    public short getNbMaxPerson() {
        return nbMaxPerson;
    }
}
