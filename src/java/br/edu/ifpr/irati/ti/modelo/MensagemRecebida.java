
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;


@Entity(name = "mensagem_recebida")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MensagemRecebida implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idMensagemRecebida;
    

    @Column(name="lido")
    @Type(type="true_false")
    protected boolean lido;
    
    @Column(name = "assunto",nullable = false)
    protected String assunto;
    

    public MensagemRecebida() {
        idMensagemRecebida = 0;
        lido = false;
        assunto = "";
    }

    public MensagemRecebida(int idMensagemRecebida,String assunto) {
        this.idMensagemRecebida = idMensagemRecebida;
        this.lido = false;
        this.assunto = assunto;
    }

    public MensagemRecebida(int idMensagemRecebida, boolean lido, String assunto) {
        this.idMensagemRecebida = idMensagemRecebida;
        this.lido = lido;
        this.assunto = assunto;
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
     * @return the idMensagemRecebida
     */
    public int getIdMensagemRecebida() {
        return idMensagemRecebida;
    }

    /**
     * @param idMensagemRecebida the idMensagemRecebida to set
     */
    public void setIdMensagemRecebida(int idMensagemRecebida) {
        this.idMensagemRecebida = idMensagemRecebida;
    }

 
}
