
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAARecebido;
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
        
        Dao<ComunicadoAARecebido> comuDao = new GenericDAO<>(ComunicadoAARecebido.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);
        
        //UsuarioParticipante userRemetente = new UsuarioParticipante(0, "Pedro", "pedropopa98@gmail.com", "pedro123");
        //UsuarioParticipante userDestinatario = new UsuarioParticipante(0, "Marco", "marco@gmail.com", "marco123");
        
        UsuarioParticipante userRemetente = usuarioParticipanteDAO.buscarPorId(1);
        UsuarioParticipante userDestinatario = usuarioParticipanteDAO.buscarPorId(2);
        
        for(int i = 0; i < 2; i++){
           ComunicadoAARecebido comunicadoADM = new ComunicadoAARecebido("Este é um comunicado", userRemetente, 0, false, "Você foi adicionado a competição TESTE");
           
           if(i == 0){
               comuDao.salvar(comunicadoADM);
               userRemetente.adicionarMensagemEnviada(comunicadoADM);
           }
           if(i == 1){
               comuDao.salvar(comunicadoADM);
               
           }
        }
        
        
        userDestinatario.adicionarMensagemRecebida(comunicadoADM);
        userRemetente.adicionarMensagemEnviada(comunicadoADM);
        
        comuDao.salvar(comunicadoADM);
        
        
        usuarioParticipanteDAO.alterar(userRemetente);
        usuarioParticipanteDAO.alterar(userDestinatario);
        
        
        //usuarioParticipanteDAO.salvar(userRemetente);
        //usuarioParticipanteDAO.salvar(userDestinatario);
        
        System.exit(0);
    }
    
    
}
