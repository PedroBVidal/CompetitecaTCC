
package br.edu.ifpr.irati.ti.modelo;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "competicaomodalidadesolo")
@PrimaryKeyJoinColumn(name = "idCompeticaoModalidade")
@Proxy(lazy = false)
public class CompeticaoModalidadeSolo extends CompeticaoModalidade implements Serializable{
    
    @OneToOne
    private ModalidadeSolo modalidadeSolo;
    
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<AtletaCompeticao> atletasCompeticao;
    

    
    @OneToMany(fetch = FetchType.EAGER)
    private List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo;

    public CompeticaoModalidadeSolo() {
        super();
        modalidadeSolo = new ModalidadeSolo();
        atletasCompeticao = new ArrayList<>();
        inscricoesCompeticaoSolo = new ArrayList<>();
    }
    

    public CompeticaoModalidadeSolo(ModalidadeSolo modalidadeSolo,int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao);
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = new ArrayList<>();
        this.inscricoesCompeticaoSolo = new ArrayList<>();
    }

    public CompeticaoModalidadeSolo(ModalidadeSolo modalidadeSolo, List<AtletaCompeticao> atletasCompeticao, List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo, int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos, boolean statusFormularioInscricaoPublica) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, confrontos, statusFormularioInscricaoPublica);
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = atletasCompeticao;
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
    }

    
    
    

    

    
/*   
    public void distribuirAtletasCompeticao(){
        
        if (statusFormularioInscricaoPublica == false) {
            
            for (Atleta atleta: modalidadeSolo.getAtletas()){
                
                
                AtletaCompeticao atletaCompeticao = new AtletaCompeticao();
                Dao<AtletaCompeticao> atletaCompDao = new GenericDAO<>(AtletaCompeticao.class);
                
                atletaCompeticao.setAtleta(atleta);
                atletaCompDao.salvar(atletaCompeticao);
                
            }
        }
        
    }
*/
    
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
    
    
    
    
    
    
}
