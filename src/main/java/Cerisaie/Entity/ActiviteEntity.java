package Cerisaie.Entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "activite", schema = "cerisaie")
public class ActiviteEntity {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "idactivite")
    private int id;

    @ManyToOne()
    @JoinColumn(name = "codesport")
    private SportEntity sport;

    @Column(name = "datejour")
    @Temporal(TemporalType.DATE)
    private Date datejour;

    @ManyToOne()
    @JoinColumn(name = "numsej")
    @JsonBackReference
    private SejourEntity sejour;

    @Column(name = "nbloc")
    private Integer nbLoc;

    public ActiviteEntity() {}

    public ActiviteEntity(SportEntity sport, Date datejour, SejourEntity sejour, Integer nbLoc) {
        this.sport = sport;
        this.datejour = datejour;
        this.sejour = sejour;
        this.nbLoc = nbLoc;
    }

    public int getId() {
        return id;
    }

    public SportEntity getSport() {
        return sport;
    }

    public void setSport(SportEntity sport) {
        this.sport = sport;
    }

    public SejourEntity getSejour() {
        return sejour;
    }

    public void setSejour(SejourEntity sejour) {
        this.sejour = sejour;
    }

    public Date getDatejour() {
        return datejour;
    }

    public void setDatejour(Date datejour) {
        this.datejour = datejour;
    }

    public Integer getNbLoc() {
        return nbLoc;
    }

    public void setNbLoc(Integer nbLoc) {
        this.nbLoc = nbLoc;
    }
}
