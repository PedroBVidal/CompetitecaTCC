
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name = "competicaomodalidadecoletiva")
@PrimaryKeyJoinColumn(name = "idCompeticaoModalidade")
@Proxy(lazy = false)
public class CompeticaoModalidadeColetiva extends CompeticaoModalidade implements Serializable{
    
    @ManyToOne
    private Competicao competicao;
    
    @OneToOne
    private ModalidadeColetiva modalidadeColetiva;
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<EquipeCompeticao> equipesCompeticao;
    
    @OneToMany(mappedBy = "competicaoModalidadeColetiva", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas;

    public CompeticaoModalidadeColetiva() {
        super();
        this.modalidadeColetiva = new ModalidadeColetiva();
        this.equipesCompeticao = new ArrayList<>();
    }
    

    public CompeticaoModalidadeColetiva(ModalidadeColetiva modalidadeColetiva,int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao,Competicao competicao) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao);
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = new ArrayList<>();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicao = competicao;
    }
    
    public CompeticaoModalidadeColetiva(ModalidadeColetiva modalidadeColetiva,int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao,Competicao competicao, String informacaoExtra) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, nomeCompeticao);
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = new ArrayList<>();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicao = competicao;
    }

    public CompeticaoModalidadeColetiva(Competicao competicao, ModalidadeColetiva modalidadeColetiva, List<EquipeCompeticao> equipesCompeticao, List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas, int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos, boolean statusFormularioInscricaoPublica) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, confrontos, statusFormularioInscricaoPublica);
        this.competicao = competicao;
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = equipesCompeticao;
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
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
     * @return the equipeCompeticao
     */
    public List<EquipeCompeticao> getEquipesCompeticao() {
        return equipesCompeticao;
    }

    /**
     * @param equipesCompeticao the equipeCompeticao to set
     */
    public void setEquipesCompeticao(List<EquipeCompeticao> equipesCompeticao) {
        this.equipesCompeticao = equipesCompeticao;
    }

    /**
     * @return the inscricoesCompeticoesColetivas
     */
    public List<InscricaoCompeticaoColetiva> getInscricoesCompeticoesColetivas() {
        return inscricoesCompeticoesColetivas;
    }

    /**
     * @param inscricoesCompeticoesColetivas the inscricoesCompeticoesColetivas to set
     */
    public void setInscricoesCompeticoesColetivas(List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas) {
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
    }

    public Competicao getCompeticao() {
        return competicao;
    }

    public void setCompeticao(Competicao competicao) {
        this.competicao = competicao;
    }
    public void adicionarInscricao(InscricaoCompeticaoColetiva icc){
        this.inscricoesCompeticoesColetivas.add(icc);
    }
      public void removerInscricao(InscricaoCompeticaoColetiva icc){
        this.inscricoesCompeticoesColetivas.remove(icc);
    }
    
    
    
    
    
            
            
}
