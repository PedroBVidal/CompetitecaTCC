
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name="confronto")
@Inheritance(strategy = InheritanceType.JOINED)
@Proxy(lazy = false)
public abstract class Confronto implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    protected int idConfronto;
    
    @Temporal(TemporalType.DATE)
    protected Date data;
    
    @Temporal(TemporalType.TIME)
    protected Date horaInicio;
    
    @Temporal(TemporalType.TIME)
    protected Date horaTermino;
    
    
    @Column (name = "periodo", nullable = false, length = 100)
    protected String periodo;
    
    @ManyToOne
    protected Local local;
    
        
    @Column(name="aprovado")
    @Type(type="true_false")
    protected boolean finalizado;

    
    @Column (name = "resultado", nullable = true, length = 300)
    protected String resultado;

    public Confronto() {
        this.idConfronto = 0;
        this.data = new Date();
        this.horaInicio = new Date();
        this.horaTermino = new Date();
        this.periodo = "";
        this.local = new Local();
        this.resultado = "";
        this.finalizado = false;
    }

    public Confronto(int idConfronto, Date data, Date horaInicio, Date horaTermino, String periodo) {
        this.idConfronto = idConfronto;
        this.data = data;
        this.horaInicio = horaInicio;
        this.horaTermino = horaTermino;
        this.periodo = periodo;
        this.local = new Local();
        this.resultado = "";
        this.finalizado = false;
    }

    public Confronto(int idConfronto, Date data, Date horaInicio, Date horaTermino, String periodo, Local local, boolean finalizado, String resultado) {
        this.idConfronto = idConfronto;
        this.data = data;
        this.horaInicio = horaInicio;
        this.horaTermino = horaTermino;
        this.periodo = periodo;
        this.local = local;
        this.finalizado = finalizado;
        this.resultado = resultado;
    }

    /**
     * @return the idConfronto
     */
    public int getIdConfronto() {
        return idConfronto;
    }

    /**
     * @param idConfronto the idConfronto to set
     */
    public void setIdConfronto(int idConfronto) {
        this.idConfronto = idConfronto;
    }

    /**
     * @return the data
     */
    public Date getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(Date data) {
        this.data = data;
    }

    /**
     * @return the horaInicio
     */
    public Date getHoraInicio() {
        return horaInicio;
    }

    /**
     * @param horaInicio the horaInicio to set
     */
    public void setHoraInicio(Date horaInicio) {
        this.horaInicio = horaInicio;
    }

    /**
     * @return the horaTermino
     */
    public Date getHoraTermino() {
        return horaTermino;
    }

    /**
     * @param horaTermino the horaTermino to set
     */
    public void setHoraTermino(Date horaTermino) {
        this.horaTermino = horaTermino;
    }

    /**
     * @return the periodo
     */
    public String getPeriodo() {
        return periodo;
    }

    /**
     * @param periodo the periodo to set
     */
    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    /**
     * @return the local
     */
    public Local getLocal() {
        return local;
    }

    /**
     * @param local the local to set
     */
    public void setLocal(Local local) {
        this.local = local;
    }

    /**
     * @return the finalizado
     */
    public boolean isFinalizado() {
        return finalizado;
    }

    /**
     * @param finalizado the finalizado to set
     */
    public void setFinalizado(boolean finalizado) {
        this.finalizado = finalizado;
    }

    /**
     * @return the resultado
     */
    public String getResultado() {
        return resultado;
    }

    /**
     * @param resultado the resultado to set
     */
    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
    
    
    
    
    
    
    
    
    
}
