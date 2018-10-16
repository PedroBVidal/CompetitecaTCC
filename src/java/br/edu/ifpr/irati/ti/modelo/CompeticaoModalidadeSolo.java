
package br.edu.ifpr.irati.ti.modelo;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import static org.eclipse.jdt.internal.compiler.parser.Parser.name;
import org.hibernate.annotations.Proxy;

@Entity(name = "competicaomodalidadesolo")
@PrimaryKeyJoinColumn(name = "idCompeticaoModalidade")
@Proxy(lazy = false)
public class CompeticaoModalidadeSolo extends CompeticaoModalidade implements Serializable{
    
    @OneToOne
    private ModalidadeSolo modalidadeSolo;
    
    
    @OneToMany
    private List<AtletaCompeticao> atletasCompeticao;
    @Column(name="status_formulario_inscricao_publica")
    private boolean statusFormularioInscricaoPublica;

    public CompeticaoModalidadeSolo() {
        super();
        modalidadeSolo = new ModalidadeSolo();
        atletasCompeticao = new ArrayList<>();
        statusFormularioInscricaoPublica = false;
    }

    public CompeticaoModalidadeSolo(ModalidadeSolo modalidadeSolo, List<AtletaCompeticao> atletasCompeticao, boolean statusFormularioInscricaoPublica, int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, confrontos);
        this.modalidadeSolo = modalidadeSolo;
        this.atletasCompeticao = atletasCompeticao;
        this.statusFormularioInscricaoPublica = statusFormularioInscricaoPublica;
    }
    

    
    
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
    
    
    
    
    
    
}
