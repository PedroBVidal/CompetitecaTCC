
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "sistemamisto")
@PrimaryKeyJoinColumn(name = "idSistemaDeCompeticao")
@Proxy(lazy = false)
public class SistemaMisto extends SistemaDeCompeticao implements Serializable {
    
    @Column(name="aprovado")
    @Type(type="true_false")
    private boolean repescagem;
    
    @OneToOne
    private SistemaDeContagem sistemadecontagem;
    
    @OneToOne
    private SistemaDeDesempate sistemaDeDesempate;
    
    @OneToMany
    private List<ParesConfronto> paresConfronto;

    public SistemaMisto() {
        super();
        this.repescagem = false;
        this.sistemadecontagem = new SistemaDeContagem();
        this.sistemaDeDesempate = new SistemaDeDesempate();
        this.paresConfronto = new ArrayList<>();
    }
    
    
   
    public SistemaMisto(boolean repescagem, SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate,  int idSistemaDeCompeticao, String nome, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, competicaoModalidade);
        this.repescagem = repescagem;
        this.sistemadecontagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
        this.paresConfronto = new ArrayList<>();
    }
    public SistemaMisto(boolean repescagem, SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, List<ParesConfronto> paresConfronto, int idSistemaDeCompeticao, String nome, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, competicaoModalidade);
        this.repescagem = repescagem;
        this.sistemadecontagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
        this.paresConfronto = paresConfronto;
    }

    public SistemaMisto(boolean repescagem, SistemaDeContagem sistemaDeContagem, SistemaDeDesempate sistemaDeDesempate, List<ParesConfronto> paresConfronto, int idSistemaDeCompeticao, String nome, List<Confronto> confrontosMarcados, CompeticaoModalidade competicaoModalidade) {
        super(idSistemaDeCompeticao, nome, confrontosMarcados, competicaoModalidade);
        this.repescagem = repescagem;
        this.sistemadecontagem = sistemaDeContagem;
        this.sistemaDeDesempate = sistemaDeDesempate;
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

    /**
     * @return the sistemadecontagem
     */
    public SistemaDeContagem getSistemadecontagem() {
        return sistemadecontagem;
    }

    /**
     * @param sistemadecontagem the sistemadecontagem to set
     */
    public void setSistemadecontagem(SistemaDeContagem sistemadecontagem) {
        this.sistemadecontagem = sistemadecontagem;
    }

    
    
    
    
    
    
    
    
}
