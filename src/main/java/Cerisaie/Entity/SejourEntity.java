package Cerisaie.Entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.Date;
import java.util.List;
/**
 * Created by Cabbibi on 09/01/2016.
 */
@Entity
@Table(name = "sejour", schema = "cerisaie")
public class SejourEntity {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "numsej")
    private int id;

    @ManyToOne
    @JoinColumn(name = "numcli")
    private ClientEntity client;

    @ManyToOne
    @JoinColumn(name = "numempl")
    private EmplacementEntity emplacement;

    @Column(name = "datedebsej")
    @Temporal(TemporalType.DATE)
    private Date debutSejour;

    @Column(name = "datefinsej")
    @Temporal(TemporalType.DATE)
    private Date finSejour;

    @Column(name = "nbpersonnes")
    private int nbPersonne;


    @OneToMany(fetch = FetchType.LAZY, mappedBy ="sejour")
    @JsonManagedReference
    private List<ActiviteEntity> activites;

    public SejourEntity() {}

    public SejourEntity(ClientEntity client, EmplacementEntity emplacement,
                  LocalDateTime debutSejour, LocalDateTime finSejour,
                  int nbPersonne) {
        this.client = client;
        this.emplacement = emplacement;
        this.debutSejour = Date.from(debutSejour.toInstant(ZoneOffset.UTC));
        this.finSejour = Date.from(finSejour.toInstant(ZoneOffset.UTC));
        this.nbPersonne = nbPersonne;
    }

    public int getId() {
        return id;
    }

    public ClientEntity getClient() {
        return client;
    }

    public EmplacementEntity getEmplacement() {
        return emplacement;
    }

    public Date getDebutSejour() {
        return debutSejour;
    }

    public Date getFinSejour() {
        return finSejour;
    }

    public int getNbPersonne() {
        return nbPersonne;
    }

    public List<ActiviteEntity> getActivites() {
        return activites;
    }

    public void setActivites(List<ActiviteEntity> activites) {
        this.activites = activites;
    }
}
