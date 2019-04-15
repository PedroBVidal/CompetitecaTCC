/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name = "mensagem_pp_enviada")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public class MensagemPPEnviada extends MensagemEnviada implements Serializable {
    
    @ManyToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<UsuarioParticipante2> usuariosParticipantes;

    public MensagemPPEnviada() {
    }

    public MensagemPPEnviada(int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
        this.usuariosParticipantes = new ArrayList<>();
    }

    public MensagemPPEnviada(List<UsuarioParticipante2> usuariosParticipantes, int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
        this.usuariosParticipantes = usuariosParticipantes;
    }
    
    public void adicionarUsuarioParticipante(UsuarioParticipante2 usuarioParticipante){
        this.usuariosParticipantes.add(usuarioParticipante);
    }
    
    public void removerUsuarioParticipante(UsuarioParticipante2 usuarioParticipante){
        this.usuariosParticipantes.remove(usuarioParticipante);
    }

    /**
     * @return the usuariosParticipantes
     */
    public List<UsuarioParticipante2> getUsuariosParticipantes() {
        return usuariosParticipantes;
    }

    /**
     * @param usuariosParticipantes the usuariosParticipantes to set
     */
    public void setUsuariosParticipantes(List<UsuarioParticipante2> usuariosParticipantes) {
        this.usuariosParticipantes = usuariosParticipantes;
    }
    
    
    
}
