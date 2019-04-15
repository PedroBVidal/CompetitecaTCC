
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "sistemaeliminatorio")
@PrimaryKeyJoinColumn(name = "idSistemaDeCompeticao")
@Proxy(lazy = false)
public class SistemaEliminatorio extends SistemaDeCompeticao implements Serializable{
    
    
    @Column(name="aprovado")
    @Type(type="true_false")
    private boolean repescagem;
    
    @OneToMany
    private List<ParesConfronto> paresConfronto;

    public SistemaEliminatorio() {
        super();
        repescagem = false;
        paresConfronto = new ArrayList<>();
    }
    
    

    public SistemaEliminatorio(boolean repescagem, int idSistemaDeCompeticao, String nome, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, competicaoModalidade);
        this.repescagem = repescagem;
        this.paresConfronto = new ArrayList<>();
    }

    public SistemaEliminatorio(boolean repescagem, List<ParesConfronto> paresConfronto, int idSistemaDeCompeticao, String nome,  CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome,competicaoModalidade);
        this.repescagem = repescagem;
        this.paresConfronto = paresConfronto;
    }

    public SistemaEliminatorio(boolean repescagem, List<ParesConfronto> paresConfronto, int idSistemaDeCompeticao, String nome, List<Confronto> confrontosMarcados, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, confrontosMarcados, competicaoModalidade);
        this.repescagem = repescagem;
        this.paresConfronto = paresConfronto;
    }

    /**
     * @return the repescagem
     */
    public boolean isRepescagem() {
        return repescagem;
    }

    /**
     * @param repescagem the repescagem to set
     */
    public void setRepescagem(boolean repescagem) {
        this.repescagem = repescagem;
    }

    /**
     * @return the paresConfronto
     */
    public List<ParesConfronto> getParesConfronto() {
        return paresConfronto;
    }

    /**
     * @param paresConfronto the paresConfronto to set
     */
    public void setParesConfronto(List<ParesConfronto> paresConfronto) {
        this.paresConfronto = paresConfronto;
    }
    
    
    
    
    
    
    
    
}
