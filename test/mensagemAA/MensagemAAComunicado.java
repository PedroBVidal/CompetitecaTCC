/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensagemAA;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAARecebido;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

/**
 *
 * @author Usuário
 */
public class MensagemAAComunicado {
    
    public static void main(String[] args) {
        
        Dao<ComunicadoAAEnviado> comunicadoEnviadoDAO = new GenericDAO<>(ComunicadoAAEnviado.class);
        Dao<ComunicadoAARecebido> comunicadoRecebidoDAO = new GenericDAO<>(ComunicadoAARecebido.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);
        
        //UsuarioParticipante userRemetente = new UsuarioParticipante(0, "Pedro", "pedropopa98@gmail.com", "pedro123");
        //UsuarioParticipante userDestinatario = new UsuarioParticipante(0, "Marco", "marco@gmail.com", "marco123");
        
        UsuarioParticipante userRemetente = usuarioParticipanteDAO.buscarPorId(2);
        UsuarioParticipante userDestinatario = usuarioParticipanteDAO.buscarPorId(1);
        
        System.out.println("Usuário remetente (Nome): "+ userRemetente.getNome());
        System.out.println("Usuário destinatario (Nome): "+ userDestinatario.getNome());
        
        ComunicadoAAEnviado comunicadoEnviado = new ComunicadoAAEnviado("O usuário ADM adicionou você como gerenciador da competição IRAJIF", 0, "Novo gerenciador");
        comunicadoEnviado.adicionarUsuarioAdministrador(userDestinatario);
        ComunicadoAARecebido comunicadoRecebido = new ComunicadoAARecebido("O usuário ADM adicionou você como gerenciador da competição IRAJIF", userRemetente, 0, false,"Novo gerenciador");
        
       
        userRemetente.adicionarMensagemEnviada(comunicadoEnviado);
        userDestinatario.adicionarMensagemRecebida(comunicadoRecebido);
        
        
        comunicadoEnviadoDAO.salvar(comunicadoEnviado);
        comunicadoRecebidoDAO.salvar(comunicadoRecebido);
        
        usuarioParticipanteDAO.alterar(userRemetente);
        usuarioParticipanteDAO.alterar(userDestinatario);
        

        System.exit(0);
        
    }
    
}
