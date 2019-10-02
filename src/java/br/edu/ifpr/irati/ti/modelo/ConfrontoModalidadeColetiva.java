
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;


@Entity(name = "confrontomodalidadecoletiva")
@PrimaryKeyJoinColumn(name = "idConfronto")
@Proxy(lazy = false)
public class ConfrontoModalidadeColetiva extends Confronto implements Serializable {
    
    
    @ManyToMany(fetch=FetchType.LAZY)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<EquipeCompeticao> equipes;
    
    
    
    @ManyToOne
    protected ModalidadeColetiva modalidadeColetiva;
    
    // Coluna referente a pontuação obtida pela equipe da posição 0 da List<EquipeCompeticao> equipes
    @Column(name="placarEquipe1")
    private int placarEquipe1;
    
    // Coluna referente a pontuação obtida pela equipe da posição 1 da List<EquipeCompeticao> equipes
    @Column(name="placarEquipe2")
    private int placarEquipe2;
    
    @Column(name="confrontoRodada", nullable = true)
    private int confrontoRodada;
    
    @ManyToOne
    private ParesConfronto paresConfronto;

    public ConfrontoModalidadeColetiva() {
        super();
        equipes = new ArrayList<>();
        modalidadeColetiva = new ModalidadeColetiva();
    }

    public ConfrontoModalidadeColetiva(List<EquipeCompeticao> equipes, ModalidadeColetiva modalidadeColetiva) {
        super();
        this.equipes = equipes;
        this.modalidadeColetiva = modalidadeColetiva;
    }

    public ConfrontoModalidadeColetiva(List<EquipeCompeticao> equipes, ModalidadeColetiva modalidadeColetiva, int placarEquipe1, int placarEquipe2, int idConfronto, Date dataConfronto, Date horaInicio, Date horaTermino, String nomeJogo, String periodo, Local local, boolean finalizado, String resultado) {
        super(idConfronto, dataConfronto, horaInicio, horaTermino, nomeJogo, periodo, local, finalizado, resultado);
        this.equipes = equipes;
        this.modalidadeColetiva = modalidadeColetiva;
        this.placarEquipe1 = placarEquipe1;
        this.placarEquipe2 = placarEquipe2;
    }

    
    public void removeAllEquipesCompeticao(){
        equipes.removeAll(equipes);
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

    /**
     * @return the equipes
     */
    public List<EquipeCompeticao> getEquipes() {
        return equipes;
    }

    /**
     * @param equipes the equipes to set
     */
    public void setEquipes(List<EquipeCompeticao> equipes) {
        this.equipes = equipes;
  }

    /**
     * @return the placarEquipe1
     */
    public int getPlacarEquipe1() {
        return placarEquipe1;
    }

    /**
     * @param placarEquipe1 the placarEquipe1 to set
     */
    public void setPlacarEquipe1(int placarEquipe1) {
        this.placarEquipe1 = placarEquipe1;
    }

    /**
     * @return the placarEquipe2
     */
    public int getPlacarEquipe2() {
        return placarEquipe2;
    }

    /**
     * @param placarEquipe2 the placarEquipe2 to set
     */
    public void setPlacarEquipe2(int placarEquipe2) {
        this.placarEquipe2 = placarEquipe2;
    }

    /**
     * @return the confrontoRodada
     */
    public int getConfrontoRodada() {
        return confrontoRodada;
    }

    /**
     * @param confrontoRodada the confrontoRodada to set
     */
    public void setConfrontoRodada(int confrontoRodada) {
        this.confrontoRodada = confrontoRodada;
    }

    /**
     * @return the paresConfronto
     */
    public ParesConfronto getParesConfronto() {
        return paresConfronto;
    }

    /**
     * @param paresConfronto the paresConfronto to set
     */
    public void setParesConfronto(ParesConfronto paresConfronto) {
        this.paresConfronto = paresConfronto;
    }

    
    
}
