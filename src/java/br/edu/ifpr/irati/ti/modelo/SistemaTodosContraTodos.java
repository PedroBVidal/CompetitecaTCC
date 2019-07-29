
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "sistematodoscontratodos")
@PrimaryKeyJoinColumn(name = "idSistemaDeCompeticao")
@Proxy(lazy = false)
public class SistemaTodosContraTodos extends SistemaDeCompeticao implements Serializable{
 
    @OneToOne
    private SistemaDeContagem sistemaDeContagem;
    
    @OneToOne
    private SistemaDeDesempate sistemaDeDesempate;
    
    @Column(name="jogosIdaVolta")
    @Type(type="true_false")
    private boolean jogosIdaVolta;
    
    
    public SistemaTodosContraTodos() {
        super();
        sistemaDeContagem = new SistemaDeContagem();
        sistemaDeDesempate = new SistemaDeDesempate();
        jogosIdaVolta = false;
        
    }

    public SistemaTodosContraTodos(SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, int idSistemaDeCompeticao, String nome,CompeticaoModalidade competicaoModalidade,boolean jogosIdaVolta) {
        super(idSistemaDeCompeticao, nome, competicaoModalidade);
        this.sistemaDeContagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
        this.jogosIdaVolta = jogosIdaVolta;
    }

    public SistemaTodosContraTodos(SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, int idSistemaDeCompeticao, String nome, List<Confronto> confrontosMarcados, CompeticaoModalidade competicaoModalidade, boolean jogosIdaVolta) {
        super(idSistemaDeCompeticao, nome, confrontosMarcados, competicaoModalidade);
        this.sistemaDeContagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
        this.jogosIdaVolta = jogosIdaVolta;
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

    /**
     * @return the jogosIdaVolta
     */
    public boolean isJogosIdaVolta() {
        return jogosIdaVolta;
    }

    /**
     * @param jogosIdaVolta the jogosIdaVolta to set
     */
    public void setJogosIdaVolta(boolean jogosIdaVolta) {
        this.jogosIdaVolta = jogosIdaVolta;
    }
    
    
    
    
    
    
}
