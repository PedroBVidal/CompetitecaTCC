
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;


@Entity(name = "confrontomodalidadecoletiva")
@PrimaryKeyJoinColumn(name = "idConfronto")
@Proxy(lazy = false)
public class ConfrontoModalidadeColetiva extends Confronto implements Serializable {
    
    
    @ManyToMany(mappedBy = "confrontosModalidadeColetiva", fetch=FetchType.EAGER)
    protected List<Equipe> equipes;
    
    @ManyToOne
    protected ModalidadeColetiva modalidadeColetiva;

    public ConfrontoModalidadeColetiva() {
        super();
        equipes = new ArrayList<>();
        modalidadeColetiva = new ModalidadeColetiva();
    }

    public ConfrontoModalidadeColetiva(List<Equipe> equipes, ModalidadeColetiva modalidadeColetiva, int idConfronto, Date data, Date horaInicio, Date horaTermino, String periodo, Local local, boolean finalizado, String resultado) {
        super(idConfronto, data, horaInicio, horaTermino, periodo, local, finalizado, resultado);
        this.equipes = equipes;
        this.modalidadeColetiva = modalidadeColetiva;
    }

    /**
     * @return the equipes
     */
    public List<Equipe> getEquipes() {
        return equipes;
    }

    /**
     * @param equipes the equipes to set
     */
    public void setEquipes(List<Equipe> equipes) {
        this.equipes = equipes;
    }

    /**
     * @return the modalidadeColetiva
     */
    public ModalidadeColetiva getModalidadeColetiva() {
        return modalidadeColetiva;
    }

    /**
     * @param modalidadeColetiva the modalidadeColetiva to set
     */
    public void setModalidadeColetiva(ModalidadeColetiva modalidadeColetiva) {
        this.modalidadeColetiva = modalidadeColetiva;
    }
    
    
    
    


    
    
    
    
    
}
