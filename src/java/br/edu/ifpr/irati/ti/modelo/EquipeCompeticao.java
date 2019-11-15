
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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name="equipecompeticao")
@Proxy(lazy = false)
public class EquipeCompeticao implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idEquipeCompeticao;
    
    @OneToOne
    private Equipe equipe;
    
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Atleta> atletasEquipe;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<SumulaEquipeConfronto> sumulasEquipeConfronto;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<PosicaoChave> posicoesChave;
    
    @Column(name="pontosMarcados")
    private double pontosMarcados;
    
    @Column(name="pontosSofridos")
    private double pontosSofridos;
    
    @Column(name="vitorias")
    private int vitorias;
    
    @Column(name="empates")
    private int empates;
        
    @Column(name="derrotas")
    private int derrotas;
    
    @Column(name="jogos")
    private int jogos;
    
    @Column(name="pontos")
    private double pontos;
    
    @Column(name="saldoDePontos")
    private double saldoDePontos; 
    
    // Especifica a posição da equipe na chave (Utilizado apenas no sistema eliminatorio);
    @Column(name="posicaoChave")
    private int posicaoChave;
    
    // Especifica se a equipe é repescada ou não (Utilizado apenas no sistema eliminatorio)
    @Column(name="repescada")
    @Type(type="true_false")
    private boolean repescada;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeVenceu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipePerdeu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeEmpatou;

    public EquipeCompeticao() {
        idEquipeCompeticao = 0;
        equipe = new Equipe();
        atletasEquipe = new ArrayList<>();
        pontosMarcados = 0;
        pontosSofridos = 0;
        adversariosQueAEquipeVenceu = new ArrayList<>();
        adversariosQueAEquipePerdeu = new ArrayList<>();
        adversariosQueAEquipeEmpatou = new ArrayList<>();
        vitorias = 0;
        jogos = 0;
        pontos = 0;
        derrotas = 0;
        empates = 0;
        saldoDePontos = 0;
        posicaoChave = 0;
        repescada = false;
        sumulasEquipeConfronto = new ArrayList<>();
        posicoesChave = new ArrayList<>();
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe,List<Atleta> atletasEquipe) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.pontosMarcados = 0;
        this.pontosSofridos = 0;
        this.atletasEquipe = atletasEquipe;
        this.adversariosQueAEquipeVenceu = new ArrayList<>();
        this.adversariosQueAEquipePerdeu = new ArrayList<>();
        this.adversariosQueAEquipeEmpatou = new ArrayList<>();
        this.posicoesChave = new ArrayList<>();
        this.vitorias = 0;
        this.jogos = 0;
        this.pontos = 0;
        this.derrotas = 0;
        this.empates = 0;
        this.saldoDePontos = 0;
        this.saldoDePontos = 0;
        this.repescada = false;
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe, List<Atleta> atletasEquipe, List<SumulaEquipeConfronto> sumulasEquipeConfronto, List<PosicaoChave> posicoesChave, double pontosMarcados, double pontosSofridos, int vitorias, int empates, int derrotas, int jogos, double pontos, double saldoDePontos, int posicaoChave, boolean repescada, List<Equipe> adversariosQueAEquipeVenceu, List<Equipe> adversariosQueAEquipePerdeu, List<Equipe> adversariosQueAEquipeEmpatou) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.atletasEquipe = atletasEquipe;
        this.sumulasEquipeConfronto = sumulasEquipeConfronto;
        this.posicoesChave = posicoesChave;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
        this.vitorias = vitorias;
        this.empates = empates;
        this.derrotas = derrotas;
        this.jogos = jogos;
        this.pontos = pontos;
        this.saldoDePontos = saldoDePontos;
        this.posicaoChave = posicaoChave;
        this.repescada = repescada;
        this.adversariosQueAEquipeVenceu = adversariosQueAEquipeVenceu;
        this.adversariosQueAEquipePerdeu = adversariosQueAEquipePerdeu;
        this.adversariosQueAEquipeEmpatou = adversariosQueAEquipeEmpatou;
    }

    

    
    public void adicionarSumulaEquipeConfronto(SumulaEquipeConfronto sec){
        this.getSumulasEquipeConfronto().add(sec);
    }
    
    public void removerSumulaEquipeConfronto(SumulaEquipeConfronto sec){
        this.getSumulasEquipeConfronto().remove(sec);
    }
    
    public void removerTodasSumulasEquipeConfronto(){
        this.getSumulasEquipeConfronto().removeAll(getSumulasEquipeConfronto());
    }
    
    public void adicionarPosicaoChave(PosicaoChave p){
        this.getPosicoesChave().add(p);
    }
    
    public void removerPosicaoChave(PosicaoChave p){
        this.getPosicoesChave().remove(p);
    }
    /**
     * @return the idEquipeCompeticao
     */
    public int getIdEquipeCompeticao() {
        return idEquipeCompeticao;
    }

    /**
     * @param idEquipeCompeticao the idEquipeCompeticao to set
     */
    public void setIdEquipeCompeticao(int idEquipeCompeticao) {
        this.idEquipeCompeticao = idEquipeCompeticao;
    }

    /**
     * @return the equipe
     */
    public Equipe getEquipe() {
        return equipe;
    }

    /**
     * @param equipe the equipe to set
     */
    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    /**
     * @return the atletasEquipe
     */
    public List<Atleta> getAtletasEquipe() {
        return atletasEquipe;
    }

    /**
     * @param atletasEquipe the atletasEquipe to set
     */
    public void setAtletasEquipe(List<Atleta> atletasEquipe) {
        this.atletasEquipe = atletasEquipe;
    }

    /**
     * @return the pontosMarcados
     */
    public double getPontosMarcados() {
        return pontosMarcados;
    }

    /**
     * @param pontosMarcados the pontosMarcados to set
     */
    public void setPontosMarcados(double pontosMarcados) {
        this.pontosMarcados = pontosMarcados;
    }

    /**
     * @return the pontosSofridos
     */
    public double getPontosSofridos() {
        return pontosSofridos;
    }

    /**
     * @param pontosSofridos the pontosSofridos to set
     */
    public void setPontosSofridos(double pontosSofridos) {
        this.pontosSofridos = pontosSofridos;
    }

    /**
     * @return the vitorias
     */
    public int getVitorias() {
        return vitorias;
    }

    /**
     * @param vitorias the vitorias to set
     */
    public void setVitorias(int vitorias) {
        this.vitorias = vitorias;
    }

    /**
     * @return the empates
     */
    public int getEmpates() {
        return empates;
    }

    /**
     * @param empates the empates to set
     */
    public void setEmpates(int empates) {
        this.empates = empates;
    }

    /**
     * @return the derrotas
     */
    public int getDerrotas() {
        return derrotas;
    }

    /**
     * @param derrotas the derrotas to set
     */
    public void setDerrotas(int derrotas) {
        this.derrotas = derrotas;
    }

    /**
     * @return the jogos
     */
    public int getJogos() {
        return jogos;
    }

    /**
     * @param jogos the jogos to set
     */
    public void setJogos(int jogos) {
        this.jogos = jogos;
    }

    /**
     * @return the pontos
     */
    public double getPontos() {
        return pontos;
    }

    /**
     * @param pontos the pontos to set
     */
    public void setPontos(double pontos) {
        this.pontos = pontos;
    }

    /**
     * @return the adversariosQueAEquipeVenceu
     */
    public List<Equipe> getAdversariosQueAEquipeVenceu() {
        return adversariosQueAEquipeVenceu;
    }

    /**
     * @param adversariosQueAEquipeVenceu the adversariosQueAEquipeVenceu to set
     */
    public void setAdversariosQueAEquipeVenceu(List<Equipe> adversariosQueAEquipeVenceu) {
        this.adversariosQueAEquipeVenceu = adversariosQueAEquipeVenceu;
    }

    /**
     * @return the adversariosQueAEquipePerdeu
     */
    public List<Equipe> getAdversariosQueAEquipePerdeu() {
        return adversariosQueAEquipePerdeu;
    }

    /**
     * @param adversariosQueAEquipePerdeu the adversariosQueAEquipePerdeu to set
     */
    public void setAdversariosQueAEquipePerdeu(List<Equipe> adversariosQueAEquipePerdeu) {
        this.adversariosQueAEquipePerdeu = adversariosQueAEquipePerdeu;
    }

    /**
     * @return the adversariosQueAEquipeEmpatou
     */
    public List<Equipe> getAdversariosQueAEquipeEmpatou() {
        return adversariosQueAEquipeEmpatou;
    }

    /**
     * @param adversariosQueAEquipeEmpatou the adversariosQueAEquipeEmpatou to set
     */
    public void setAdversariosQueAEquipeEmpatou(List<Equipe> adversariosQueAEquipeEmpatou) {
        this.adversariosQueAEquipeEmpatou = adversariosQueAEquipeEmpatou;
    }

    /**
     * @return the saldoDePontos
     */
    public double getSaldoDePontos() {
        return saldoDePontos;
    }

    /**
     * @param saldoDePontos the saldoDePontos to set
     */
    public void setSaldoDePontos(double saldoDePontos) {
        this.saldoDePontos = saldoDePontos;
    }

    /**
     * @return the posicaoChave
     */
    public int getPosicaoChave() {
        return posicaoChave;
    }

    /**
     * @param posicaoChave the posicaoChave to set
     */
    public void setPosicaoChave(int posicaoChave) {
        this.posicaoChave = posicaoChave;
    }

    /**
     * @return the repescada
     */
    public boolean isRepescada() {
        return repescada;
    }

    /**
     * @param repescada the repescada to set
     */
    public void setRepescada(boolean repescada) {
        this.repescada = repescada;
    }

    /**
     * @return the sumulasEquipeConfronto
     */
    public List<SumulaEquipeConfronto> getSumulasEquipeConfronto() {
        return sumulasEquipeConfronto;
    }

    /**
     * @param sumulasEquipeConfronto the sumulasEquipeConfronto to set
     */
    public void setSumulasEquipeConfronto(List<SumulaEquipeConfronto> sumulasEquipeConfronto) {
        this.sumulasEquipeConfronto = sumulasEquipeConfronto;
    }

    /**
     * @return the posicoesChave
     */
    public List<PosicaoChave> getPosicoesChave() {
        return posicoesChave;
    }

    /**
     * @param posicoesChave the posicoesChave to set
     */
    public void setPosicoesChave(List<PosicaoChave> posicoesChave) {
        this.posicoesChave = posicoesChave;
    }

    
    
    

    
}
