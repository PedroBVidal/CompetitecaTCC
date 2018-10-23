
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "competicaomodalidadecoletiva")
@PrimaryKeyJoinColumn(name = "idCompeticaoModalidade")
@Proxy(lazy = false)
public class CompeticaoModalidadeColetiva extends CompeticaoModalidade implements Serializable{
    
        
    @OneToOne
    private ModalidadeColetiva modalidadeColetiva;
    
    @OneToMany
    private List<EquipeCompeticao> equipeCompeticao;

    public CompeticaoModalidadeColetiva() {
        super();
        this.modalidadeColetiva = new ModalidadeColetiva();
        this.equipeCompeticao = new ArrayList<>();
    }

    public CompeticaoModalidadeColetiva(ModalidadeColetiva modalidadeColetiva, List<EquipeCompeticao> equipeCompeticao, int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos) {
        super(idCompeticaoModalidade, nomeCompeticao, sistemaDeCompeticao, confrontos);
        this.modalidadeColetiva = modalidadeColetiva;
        this.equipeCompeticao = equipeCompeticao;
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
    public List<EquipeCompeticao> getEquipeCompeticao() {
        return equipeCompeticao;
    }

    /**
     * @param equipeCompeticao the equipeCompeticao to set
     */
    public void setEquipeCompeticao(List<EquipeCompeticao> equipeCompeticao) {
        this.equipeCompeticao = equipeCompeticao;
    }

    
    
    
    
            
            
}
