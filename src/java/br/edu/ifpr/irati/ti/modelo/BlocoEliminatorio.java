/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;
/**
 *
 * @author olive
 */
@Entity(name = "bloco_eliminatorio")
@Proxy(lazy = false)
public class BlocoEliminatorio implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idBloco;
    
    @Column
    private int etapa;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<Confronto> confrontos;
        
    @Column(name="blocoRepescagem")
    @Type(type="true_false")
    private boolean blocoRepescagem;
    
    @Column(name="aceitaNovosRepescados")
    @Type(type="true_false")
    private boolean aceitaNovosRepescados;
    
    public BlocoEliminatorio() {
        this.idBloco = 0;
        this.etapa = 0;
        this.confrontos = new ArrayList<>();
        this.blocoRepescagem = false;
    }

    public BlocoEliminatorio(int idBloco, int etapa, List<Confronto> confrontos, boolean blocoRepescagem, boolean aceitaNovosRepescados) {
        this.idBloco = idBloco;
        this.etapa = etapa;
        this.confrontos = confrontos;
        this.blocoRepescagem = blocoRepescagem;
        this.aceitaNovosRepescados = aceitaNovosRepescados;
    }
    
    
    public void adicionarConfronto(Confronto confronto){
        this.confrontos.add(confronto);
    }
    
    
    public int getEtapa() {
        return etapa;
    }
    public void setEtapa(int etapa) {
        this.etapa = etapa;
    }
    public List<Confronto> getConfrontos() {
        return confrontos;
    }
    public void setConfrontos(List<Confronto> confrontos) {
        this.confrontos = confrontos;
    }

    public int getIdBloco() {
        return idBloco;
    }

    
    public void removerTodosConfrontos(){
        this.confrontos.removeAll(confrontos);
    }
    
    /**
     * @return the blocoRepescagem
     */
    public boolean isBlocoRepescagem() {
        return blocoRepescagem;
    }

    /**
     * @param blocoRepescagem the blocoRepescagem to set
     */
    public void setBlocoRepescagem(boolean blocoRepescagem) {
        this.blocoRepescagem = blocoRepescagem;
    }

    /**
     * @return the aceitaNovosRepescados
     */
    public boolean isAceitaNovosRepescados() {
        return aceitaNovosRepescados;
    }

    /**
     * @param aceitaNovosRepescados the aceitaNovosRepescados to set
     */
    public void setAceitaNovosRepescados(boolean aceitaNovosRepescados) {
        this.aceitaNovosRepescados = aceitaNovosRepescados;
    }
    
    
    
}
