/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;
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
/**
 *
 * @author olive
 */
@Entity(name = "bloco_eliminatorio")
@Proxy(lazy = false)
public class BlocoEliminatorio {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idBloco;
    @Column
    private int etapa;
    @OneToMany(fetch = FetchType.LAZY)
    private List<Confronto> confrontos;
    public BlocoEliminatorio() {
        this.idBloco = 0;
        this.etapa = 0;
        this.confrontos = new ArrayList<>();
    }
    public BlocoEliminatorio(int etapa, List<Confronto> confrontos) {
        this.idBloco = 0;
        this.etapa = etapa;
        this.confrontos = confrontos;
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
}
