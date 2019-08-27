
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "confrontomodalidadesolo")
@PrimaryKeyJoinColumn(name = "idConfronto")
@Proxy(lazy = false)
public class ConfrontoModalidadeSolo extends Confronto implements Serializable {
    
    
    @ManyToMany//(mappedBy = "confrontosModalidadeSolo", fetch=FetchType.EAGER)
    private List<AtletaCompeticao> atletas;
    
    @ManyToOne
    private AtletaCompeticao atletaVitorioso;
    
    @ManyToOne
    protected ModalidadeSolo modalidadeSolo;
    
    public ConfrontoModalidadeSolo() {
        super();
        this.atletas = new ArrayList<>();
        this.modalidadeSolo = new ModalidadeSolo();
    }

    public ConfrontoModalidadeSolo(List<AtletaCompeticao> atletas, ModalidadeSolo modalidadeSolo, int idConfronto, Date data, Date horaInicio, Date horaTermino, String periodo, Local local, boolean finalizado, String resultado) {
        super(idConfronto, data, horaInicio, horaTermino, periodo, local, finalizado, resultado);
        this.atletas = atletas;
        this.modalidadeSolo = modalidadeSolo;
    }

    public ConfrontoModalidadeSolo(List<AtletaCompeticao> atletas, AtletaCompeticao atletaVitorioso, ModalidadeSolo modalidadeSolo, int idConfronto, Date data, Date horaInicio, Date horaTermino, String periodo, Local local, boolean finalizado, String resultado) {
        super(idConfronto, data, horaInicio, horaTermino, periodo, local, finalizado, resultado);
        this.atletas = atletas;
        this.atletaVitorioso = atletaVitorioso;
        this.modalidadeSolo = modalidadeSolo;
    }

    

    /**
     * @return the modalidadeSolo
     */
    public ModalidadeSolo getModalidadeSolo() {
        return modalidadeSolo;
    }

    /**
     * @param modalidadeSolo the modalidadeSolo to set
     */
    public void setModalidadeSolo(ModalidadeSolo modalidadeSolo) {
        this.modalidadeSolo = modalidadeSolo;
    }

    /**
     * @return the atletas
     */
    public List<AtletaCompeticao> getAtletas() {
        return atletas;
    }

    /**
     * @param atletas the atletas to set
     */
    public void setAtletas(List<AtletaCompeticao> atletas) {
        this.atletas = atletas;
    }

    /**
     * @return the atletaVitorioso
     */
    public AtletaCompeticao getAtletaVitorioso() {
        return atletaVitorioso;
    }

    /**
     * @param atletaVitorioso the atletaVitorioso to set
     */
    public void setAtletaVitorioso(AtletaCompeticao atletaVitorioso) {
        this.atletaVitorioso = atletaVitorioso;
    }
    
    
    
    
    
    
    
    
}
