
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "sistematodoscontratodos")
@PrimaryKeyJoinColumn(name = "idSistemaDeCompeticao")
@Proxy(lazy = false)
public class SistemaTodosContraTodos extends SistemaDeCompeticao implements Serializable{
 
    @OneToOne
    private SistemaDeContagem sistemaDeContagem;
    
    @OneToOne
    private SistemaDeDesempate sistemaDeDesempate;

    public SistemaTodosContraTodos() {
        super();
        sistemaDeContagem = new SistemaDeContagem();
        sistemaDeDesempate = new SistemaDeDesempate();
        
    }

    public SistemaTodosContraTodos(SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, int idSistemaDeCompeticao, String nome,CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, competicaoModalidade);
        this.sistemaDeContagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
    }

    public SistemaTodosContraTodos(SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, int idSistemaDeCompeticao, String nome, List<Confronto> confrontosMarcados, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, confrontosMarcados, competicaoModalidade);
        this.sistemaDeContagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
    }
    
    

    
    /**
     * @return the sistemaDeContagem
     */
    public SistemaDeContagem getSistemaDeContagem() {
        return sistemaDeContagem;
    }

    /**
     * @param sistemaDeContagem the sistemaDeContagem to set
     */
    public void setSistemaDeContagem(SistemaDeContagem sistemaDeContagem) {
        this.sistemaDeContagem = sistemaDeContagem;
    }

    /**
     * @return the sistemaDeDesempate
     */
    public SistemaDeDesempate getSistemaDeDesempate() {
        return sistemaDeDesempate;
    }

    /**
     * @param sistemaDeDesempate the sistemaDeDesempate to set
     */
    public void setSistemaDeDesempate(SistemaDeDesempate sistemaDeDesempate) {
        this.sistemaDeDesempate = sistemaDeDesempate;
    }
    
    
    
    
    
    
}
