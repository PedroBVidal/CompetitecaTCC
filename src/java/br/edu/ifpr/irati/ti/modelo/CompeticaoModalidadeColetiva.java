
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
    
    @OneToMany(mappedBy = "competicaoModalidadeColetiva", fetch = FetchType.LAZY)
    private List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<BlocoEliminatorio> blocosEliminatorios;

    public CompeticaoModalidadeColetiva() {
        super();
        this.modalidadeColetiva = new ModalidadeColetiva();
        this.equipesCompeticao = new ArrayList<>();
    }
    

    public CompeticaoModalidadeColetiva(ModalidadeColetiva modalidadeColetiva,int idCompeticaoModalidade, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao,Competicao competicao) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao,numVagas);
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = new ArrayList<>();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicao = competicao;
    }
    
    public CompeticaoModalidadeColetiva(ModalidadeColetiva modalidadeColetiva,int idCompeticaoModalidade, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao,Competicao competicao, String informacaoExtra) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, informacaoExtra, numVagas);
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = new ArrayList<>();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicao = competicao;
    }

    public CompeticaoModalidadeColetiva(Competicao competicao, ModalidadeColetiva modalidadeColetiva, List<EquipeCompeticao> equipesCompeticao, List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas, int idCompeticaoModalidade, String informacaoExtra, String nomeCompeticao, int numVagas,SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos, boolean statusFormularioInscricaoPublica, boolean inativo, boolean jogosEmAndamento) {
        super(idCompeticaoModalidade, informacaoExtra, nomeCompeticao, sistemaDeCompeticao, confrontos, statusFormularioInscricaoPublica, inativo, jogosEmAndamento, numVagas);
        this.competicao = competicao;
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipesCompeticao = equipesCompeticao;
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
    }

    
    public List<BlocoEliminatorio> filtrarBlocoEliminatorioPorEtapa(int valor, int extensao, boolean repescagem){
        
        List<BlocoEliminatorio> blocos = new ArrayList();
        for(BlocoEliminatorio bE : this.getBlocosEliminatorios()){
            
            if(bE.getEtapa() >= valor && bE.getEtapa() <= (valor + extensao -1) && bE.isBlocoRepescagem() == false){
                blocos.add(bE);
            }
        }
        
        return blocos;
    }
    
        public List<BlocoEliminatorio> filtrarBlocoEliminatorioRepescagemPorEtapa(int valor, int extensao, boolean repescagem){
        
        List<BlocoEliminatorio> blocos = new ArrayList();
        for(BlocoEliminatorio bE : this.getBlocosEliminatorios()){
            
            if(bE.getEtapa() >= valor && bE.getEtapa() <= (valor + extensao -1) && bE.isBlocoRepescagem() == true){
                blocos.add(bE);
            }
        }
        
        return blocos;
    }
        
        
    public List<BlocoEliminatorio> buscarBlocosEliminatorios(){
        List<BlocoEliminatorio> blocos = new ArrayList();
        for(BlocoEliminatorio bE : this.getBlocosEliminatorios()){
            if(bE.isBlocoRepescagem() == false){
                blocos.add(bE);
            }
        }
        return blocos;
    }
    
    public List<BlocoEliminatorio> buscarBlocosEliminatoriosRepescagem(){
        List<BlocoEliminatorio> blocos = new ArrayList();
        for(BlocoEliminatorio bE : this.getBlocosEliminatorios()){
            if(bE.isBlocoRepescagem() == true){
                blocos.add(bE);
            }
        }
        return blocos;
    }
    
    
    public void setBlocosEliminatorios(List<BlocoEliminatorio> blocosEliminatorios) {
        this.blocosEliminatorios = blocosEliminatorios;
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
    
    public void adicionarEquipeCompeticao(EquipeCompeticao equipeCompeticao){
        this.equipesCompeticao.add(equipeCompeticao);
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

    public List<BlocoEliminatorio> getBlocosEliminatorios() {
        return blocosEliminatorios;
    }

    
    
    
    
    
            
            
}
