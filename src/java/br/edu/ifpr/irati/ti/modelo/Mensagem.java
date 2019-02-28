
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Proxy;


@Entity(name = "mensagem")
@Proxy(lazy = false)
public class Mensagem implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idMensagem;
    
    @ManyToOne(fetch = FetchType.EAGER)
    private UsuarioParticipante tipoAdm;
    
    @ManyToOne(fetch = FetchType.EAGER)
    private UsuarioParticipante2 tipoUser;
    
    //Tipo de Remetente 1 para Usuario Administrador,  2 Para usuário comum
    @Column
    private int tipoRemetente;
    @Column
    private String categoria;
    
    @Column(name="tipoMsg", nullable = false)
    private int tipo;
    
    @Column
    private boolean lido;
    
    @Column(nullable = false)
    private String assunto;
    
   @Column(name = "texto", nullable = false)
    private String texto;

    public Mensagem() {
        idMensagem = 0;
        texto = "";
    }

    public Mensagem(int idMensagem, UsuarioParticipante tipoAdm, UsuarioParticipante2 tipoUser, int tipo, String texto) {
        this.idMensagem = idMensagem;
        this.tipoAdm = tipoAdm;
        this.tipoUser = tipoUser;
        this.tipo = tipo;
        this.texto = texto;
    }

    public Mensagem(int idMensagem,String categoria,String assunto, String texto,UsuarioParticipante tipoAdm, UsuarioParticipante2 tipoUser,int tipoMsg,int tipoRemetente) {
        this.idMensagem = idMensagem; 
        this.texto = texto;
        this.tipoAdm = tipoAdm;
        this.tipoUser = tipoUser;
        this.tipo = tipoMsg;
        this.tipoRemetente = tipoRemetente;
        this.assunto = assunto;
        this.lido = false;
        this.categoria = categoria;
    }

    /**
     * @return the idMensagem
     */
    public int getIdMensagem() {
        return idMensagem;
    }

    /**
     * @param idMensagem the idMensagem to set
     */
    public void setIdMensagem(int idMensagem) {
        this.idMensagem = idMensagem;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }

    /**
     * @return the remetente
     */
    public UsuarioParticipante getTipoAdm() {
        return tipoAdm;
    }

    /**
     * @param remetente the remetente to set
     */
    public void setTipoAdm(UsuarioParticipante tipoAdm) {
        this.tipoAdm = tipoAdm;
    }

    /**
     * @return the destinatario
     */
    public UsuarioParticipante2 getTipoUser() {
        return tipoUser;
    }

    /**
     * @param destinatario the destinatario to set
     */
    public void setTipoUser(UsuarioParticipante2 tipoUser) {
        this.tipoUser=tipoUser;
    }

    /**
     * @return the tipoRemetente
     */
    public int getTipoRemetente() {
        return tipoRemetente;
    }

    /**
     * @param tipoRemetente the tipoRemetente to set
     */
    public void setTipoRemetente(int tipoRemetente) {
        this.tipoRemetente = tipoRemetente;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the lido
     */
    public boolean isLido() {
        return lido;
    }

    /**
     * @param lido the lido to set
     */
    public void setLido(boolean lido) {
        this.lido = lido;
    }

    /**
     * @return the assunto
     */
    public String getAssunto() {
        return assunto;
    }

    /**
     * @param assunto the assunto to set
     */
    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }

    /**
     * @return the categoria
     */
    public String getCategoria() {
        return categoria;
    }

    /**
     * @param categoria the categoria to set
     */
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    
    
   
   
   
}
