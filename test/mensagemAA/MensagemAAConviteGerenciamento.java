/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensagemAA;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAARecebido;
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAARecebido;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

/**
 *
 * @author Usuário
 */
public class MensagemAAConviteGerenciamento {
    
    public static void main(String[] args) {
        
        Dao<ConviteGerenciamentoAAEnviado> conviteGerenciamentoEnviadoDAO = new GenericDAO<>(ConviteGerenciamentoAAEnviado.class);
        Dao<ConviteGerenciamentoAARecebido> conviteGerenciamentoRecebidoDAO = new GenericDAO<>(ConviteGerenciamentoAARecebido.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);
        Dao<Competicao> competicaoDAO = new GenericDAO<>(Competicao.class);
        
        UsuarioParticipante userRemetente = usuarioParticipanteDAO.buscarPorId(1);
        UsuarioParticipante userDestinatario = usuarioParticipanteDAO.buscarPorId(2);
        Competicao competicao = competicaoDAO.buscarPorId(1);
        
        
        System.out.println("Usuário remetente (Nome): "+ userRemetente.getNome());
        System.out.println("Usuário destinatario (Nome): "+ userDestinatario.getNome());
        
        ConviteGerenciamentoAAEnviado cge = new ConviteGerenciamentoAAEnviado("Você foi convidado a gerenciar tal COMPETICAO", competicao, 0, "Convite gerenciamento");
        cge.adicionarUsuarioAdministrador(userDestinatario);
        ConviteGerenciamentoAARecebido cgr = new ConviteGerenciamentoAARecebido("Você foi convidado a gerenciar tal COMPETICAO", false, competicao, userRemetente, 0,false, "Convite gerenciamento");
        
        userRemetente.adicionarMensagemEnviada(cge);
        userDestinatario.adicionarMensagemRecebida(cgr);
        
        conviteGerenciamentoEnviadoDAO.salvar(cge);
        conviteGerenciamentoRecebidoDAO.salvar(cgr);
        
        usuarioParticipanteDAO.alterar(userRemetente);
        usuarioParticipanteDAO.alterar(userDestinatario);
        
         System.exit(0);
        
    }
}
