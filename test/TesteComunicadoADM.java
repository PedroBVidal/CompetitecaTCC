
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.ComunicadoADM;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteComunicadoADM {
    
    public static void main(String[] args) {
        
        Dao<ComunicadoADM> comuDao = new GenericDAO<>(ComunicadoADM.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);
        
        //UsuarioParticipante userRemetente = new UsuarioParticipante(0, "Pedro", "pedropopa98@gmail.com", "pedro123");
        //UsuarioParticipante userDestinatario = new UsuarioParticipante(0, "Marco", "marco@gmail.com", "marco123");
        
        UsuarioParticipante userRemetente = usuarioParticipanteDAO.buscarPorId(1);
        UsuarioParticipante userDestinatario = usuarioParticipanteDAO.buscarPorId(2);
        
        
        ComunicadoADM comunicadoADM = new ComunicadoADM("Este é um comunicado", userRemetente, userDestinatario, 0, false, "Comunicado");
        
        
        userDestinatario.adicionarMensagemRecebida(comunicadoADM);
        userDestinatario.adicionarMensagemEnviada(comunicadoADM);
        userRemetente.adicionarMensagemEnviada(comunicadoADM);
        
        comuDao.salvar(comunicadoADM);
        
        
        usuarioParticipanteDAO.alterar(userRemetente);
        usuarioParticipanteDAO.alterar(userDestinatario);
        
        
        //usuarioParticipanteDAO.salvar(userRemetente);
        //usuarioParticipanteDAO.salvar(userDestinatario);
        
        System.exit(0);
    }
    
    
}
