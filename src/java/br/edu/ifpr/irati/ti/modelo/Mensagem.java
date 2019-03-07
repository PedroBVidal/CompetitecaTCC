
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


@Entity(name = "mensagem")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Mensagem implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idMensagem;
    

    @Column(name="lido")
    @Type(type="true_false")
    protected boolean lido;
    
    @Column(name = "assunto",nullable = false)
    protected String assunto;
    

    public Mensagem() {
        idMensagem = 0;
        lido = false;
        assunto = "";
    }

    public Mensagem(int idMensagem,String assunto) {
        this.idMensagem = idMensagem;
        this.lido = false;
        this.assunto = assunto;
    }

    public Mensagem(int idMensagem, boolean lido, String assunto) {
        this.idMensagem = idMensagem;
        this.lido = lido;
        this.assunto = assunto;
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

 
}
