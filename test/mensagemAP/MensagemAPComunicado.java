/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensagemAP;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioAdministradorDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioParticipanteDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAARecebido;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class MensagemAPComunicado {
    
    public static void main(String[] args) {
        int i = 1;
        
        Dao<ComunicadoAPEnviado> comunicadoEnviadoDAO = new GenericDAO<>(ComunicadoAPEnviado.class);
        Dao<ComunicadoAPRecebido> comunicadoRecebidoDAO = new GenericDAO<>(ComunicadoAPRecebido.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);
        Dao<UsuarioParticipante2> usuarioParticipante2DAO = new GenericDAO<>(UsuarioParticipante2.class);
        UsuarioAdministradorDAO uadmDAO = new UsuarioAdministradorDAO();
        UsuarioParticipanteDAO upartiDAO = new UsuarioParticipanteDAO();
        
        //UsuarioParticipante userRemetente = new UsuarioParticipante(0, "Pedro", "pedropopa98@gmail.com", "pedro123");
        //UsuarioParticipante userDestinatario = new UsuarioParticipante(0, "Marco", "marco@gmail.com", "marco123");
        
        UsuarioParticipante userRemetente = uadmDAO.buscarPorId(1);
        UsuarioParticipante2 userDestinatario1 = upartiDAO.buscarPorId(1);
        UsuarioParticipante2 userDestinatario2 = upartiDAO.buscarPorId(2);
        UsuarioParticipante2 userDestinatario3 = upartiDAO.buscarPorId(3);
        
        List<UsuarioParticipante2> usuariosDestinatarios = new ArrayList<>();
        usuariosDestinatarios.add(userDestinatario3);
        usuariosDestinatarios.add(userDestinatario2);
        usuariosDestinatarios.add(userDestinatario1);
        
        
        System.out.println("Usuário remetente (Nome): "+ userRemetente.getNome());
        for(UsuarioParticipante2 userDestinatario : usuariosDestinatarios){
            System.out.println("User destinatario "+i+":"+userDestinatario.getNome());
            i++;
        }
        
        ComunicadoAPEnviado comunicadoEnviado = new ComunicadoAPEnviado("Confronto próximo, DATA: 22/03", 0, "Confronto próximo TESTE");
        comunicadoEnviado.adicionarUsuarioParticipante(userDestinatario1);
        comunicadoEnviado.adicionarUsuarioParticipante(userDestinatario2);
        comunicadoEnviado.adicionarUsuarioParticipante(userDestinatario3);
        
        
       //Mensagem recebida, lida?
       
        userRemetente.adicionarMensagemEnviada(comunicadoEnviado);
        
        System.out.println("User remetente " + userRemetente.getMensagensEnviadas());
        
        comunicadoEnviadoDAO.salvar(comunicadoEnviado);
        usuarioParticipanteDAO.alterar(userRemetente);
        
        
        for(UsuarioParticipante2 userDestinatario : usuariosDestinatarios){
            
            ComunicadoAPRecebido comunicadoRecebido = new ComunicadoAPRecebido("Confronto próximo, DATA: 22/03", userRemetente, 0, false,"Confronto próximo");
    
            comunicadoRecebidoDAO.salvar(comunicadoRecebido);
            userDestinatario.adicionarMensagemRecebida(comunicadoRecebido);
            System.out.println("ID usuer destinatario: " + userDestinatario.getIdUsuario());
            usuarioParticipante2DAO.alterar(userDestinatario);
        }
        
        
        System.exit(0);
        
    }
    
}
