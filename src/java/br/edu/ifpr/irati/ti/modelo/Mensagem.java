
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.Proxy;


@Entity(name = "mensagem")
@Proxy(lazy = false)
public class Mensagem implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idMensagem;
    
    
   @Column(name = "texto", nullable = false)
    private String nome;

    public Mensagem() {
        idMensagem = 0;
        nome = "";
    }

    public Mensagem(int idMensagem, String nome) {
        this.idMensagem = idMensagem;
        this.nome = nome;
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
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
   
   
   
}
