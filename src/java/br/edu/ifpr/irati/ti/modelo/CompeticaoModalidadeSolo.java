
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

@Entity(name = "competicaomodalidadesolo")
@PrimaryKeyJoinColumn(name = "idCompeticaoModalidade")
@Proxy(lazy = false)
public class CompeticaoModalidadeSolo extends CompeticaoModalidade implements Serializable{
    
    @ManyToOne
    private Competicao competicao;
    
    @OneToOne
    private ModalidadeSolo modalidadeSolo;
    
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<AtletaCompeticao> atletasCompeticao;
    
    
    @OneToMany(mappedBy = "competicaoModalidadeSolo", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo;

    public CompeticaoModalidadeSolo() {
        super();
        modalidadeSolo = new ModalidadeSolo();
        atletasCompeticao = new ArrayList<>();
        inscricoesCompeticaoSolo = new ArrayList<>();
        competicao = new Competicao();
    }
    

    public CompeticaoModalidadeSolo(ModalidadeSolo modalidadeSolo,int idCompeticaoModalidade, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao, Competicao competicao) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao,numVagas);
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = new ArrayList<>();
        this.inscricoesCompeticaoSolo = new ArrayList<>();
        this.competicao = competicao;
    }
    
    public CompeticaoModalidadeSolo(ModalidadeSolo modalidadeSolo,int idCompeticaoModalidade, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao, Competicao competicao, String informacaoExtra) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, informacaoExtra, numVagas);
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = new ArrayList<>();
        this.inscricoesCompeticaoSolo = new ArrayList<>();
        this.competicao = competicao;
    }

    public CompeticaoModalidadeSolo(Competicao competicao, ModalidadeSolo modalidadeSolo, List<AtletaCompeticao> atletasCompeticao, List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo, int idCompeticaoModalidade, String informacaoExtra, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos, boolean statusFormularioInscricaoPublica, boolean inativo, boolean jogosEmAndamento) {
        super(idCompeticaoModalidade, informacaoExtra, nomeCompeticao, sistemaDeCompeticao, confrontos, statusFormularioInscricaoPublica, inativo, jogosEmAndamento, numVagas);
        this.competicao = competicao;
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = atletasCompeticao;
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
    }

    

    
  

    
    public void adcionarInscricaoModalidadeSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo){
        this.inscricoesCompeticaoSolo.add(inscricaoCompeticaoSolo);
    }
    
    public void removerInscricaoModalidadeSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo){
        this.inscricoesCompeticaoSolo.remove(inscricaoCompeticaoSolo);
    }
    
    public List<Confronto> gerarConfrontos(){
        
        return null;
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
     * @return the atletasCompeticao
     */
    public List<AtletaCompeticao> getAtletasCompeticao() {
        return atletasCompeticao;
    }

    /**
     * @param atletasCompeticao the atletasCompeticao to set
     */
    public void setAtletasCompeticao(List<AtletaCompeticao> atletasCompeticao) {
        this.atletasCompeticao = atletasCompeticao;
    }



    /**
     * @return the inscricoesCompeticaoSolo
     */
    public List<InscricaoCompeticaoSolo> getInscricoesCompeticaoSolo() {
        return inscricoesCompeticaoSolo;
    }

    /**
     * @param inscricoesCompeticaoSolo the inscricoesCompeticaoSolo to set
     */
    public void setInscricoesCompeticaoSolo(List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo) {
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
    }

    /**
     * @return the competicao
     */
    public Competicao getCompeticao() {
        return competicao;
    }

    /**
     * @param competicao the competicao to set
     */
    public void setCompeticao(Competicao competicao) {
        this.competicao = competicao;
    }
    
    
    
    
    
    
}
