
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;
import org.hibernate.annotations.Proxy;

@Entity(name="modalidadesolo")
@Proxy(lazy = false)
public class ModalidadeSolo implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idModalidadeSolo;
    
    @Column (name = "nome", nullable = false, length = 100)
    private String nome;
    
    @ManyToMany(mappedBy = "modalidadesSolo" , fetch=FetchType.EAGER)
    private List<Atleta> atletas;
    
    // FICAR DE OLHO
    //@Transient
    //@OneToOne
    //private CompeticaoModalidadeSolo competicaoModalidadeSolo;
    

    public ModalidadeSolo() {
        idModalidadeSolo = 0;
        nome = "";
        atletas = new ArrayList<>();
        //competicaoModalidadeSolo = new CompeticaoModalidadeSolo();
    }

    public ModalidadeSolo(int idModalidadeSolo, String nome) {
        this.idModalidadeSolo = idModalidadeSolo;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        //this.competicaoModalidadeSolo = new CompeticaoModalidadeSolo();
    }

    public ModalidadeSolo(int idModalidadeSolo, String nome, List<Atleta> atletas/*, CompeticaoModalidadeSolo competicaoModalidadeSolo*/) {
        this.idModalidadeSolo = idModalidadeSolo;
        this.nome = nome;
        this.atletas = atletas;
        //this.competicaoModalidadeSolo = competicaoModalidadeSolo;
    }
    
    
    public void adicionarAtleta(Atleta atleta){
        
        this.atletas.add(atleta);
    }
    
    public void removerAtleta(Atleta atleta){
        
        this.atletas.remove(atleta);
    }

    /**
     * @return the idModalidadeSolo
     */
    public int getIdModalidadeSolo() {
        return idModalidadeSolo;
    }

    /**
     * @param idModalidadeSolo the idModalidadeSolo to set
     */
    public void setIdModalidadeSolo(int idModalidadeSolo) {
        this.idModalidadeSolo = idModalidadeSolo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the atletas
     */
    public List<Atleta> getAtletas() {
        return atletas;
    }

    /**
     * @param atletas the atletas to set
     */
    public void setAtletas(List<Atleta> atletas) {
        this.atletas = atletas;
    }

    /**
     * @return the competicaoModalidadeSolo
     */
   /* public CompeticaoModalidadeSolo getCompeticaoModalidadeSolo() {
        return competicaoModalidadeSolo;
    }*/

    /**
     * @param competicaoModalidadeSolo the competicaoModalidadeSolo to set
     */
    /*public void setCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.competicaoModalidadeSolo = competicaoModalidadeSolo;
    }*/

    
    
    
    
    
    
    
    
}
