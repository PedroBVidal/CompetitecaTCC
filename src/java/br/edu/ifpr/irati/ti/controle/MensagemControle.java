/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Mensagem;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;

/**
 *
 * @author user
 */
public class MensagemControle {
    
    public void enviarMensagem(Object remetente, Object destinatario,String categoria,String assunto, String mensagem){
        Dao<Mensagem> msg = new GenericDAO<>(Mensagem.class);
        Dao<UsuarioParticipante> up = new GenericDAO<>(UsuarioParticipante.class);
        Dao<UsuarioParticipante2> up2 = new GenericDAO<>(UsuarioParticipante2.class);
        
        try{
            UsuarioParticipante upar = (UsuarioParticipante) remetente;
            UsuarioParticipante2 upar2= (UsuarioParticipante2)destinatario;
            Mensagem msgg = new Mensagem(0,categoria,assunto ,mensagem, upar, upar2, 1, 1);
            upar.addMensagem(msgg);
            upar2.addMensagem(msgg);
            msg.salvar(msgg);
            up.alterar(upar);
            up2.alterar(upar2);
        }catch(Exception e){
            UsuarioParticipante upar = (UsuarioParticipante) destinatario;
            UsuarioParticipante2 upar2= (UsuarioParticipante2)remetente;
            Mensagem msgg = new Mensagem(0,categoria,assunto ,mensagem, upar, upar2, 1, 2);
            upar.addMensagem(msgg);
            upar2.addMensagem(msgg);
            msg.salvar(msgg);
            up.alterar(upar);
            up2.alterar(upar2);
        }
    }
}
