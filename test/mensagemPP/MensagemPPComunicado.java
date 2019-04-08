/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mensagemPP;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioAdministradorDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioParticipanteDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido;
import br.edu.ifpr.irati.ti.modelo.ComunicadoPPEnviado;
import br.edu.ifpr.irati.ti.modelo.ComunicadoPPRecebido;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class MensagemPPComunicado {
    public static void main(String[] args) {
        
        Dao<ComunicadoPPEnviado> comunicadoEnviadoDAO = new GenericDAO<>(ComunicadoPPEnviado.class);
        Dao<ComunicadoPPRecebido> comunicadoRecebidoDAO = new GenericDAO<>(ComunicadoPPRecebido.class);

        Dao<UsuarioParticipante2> usuarioParticipante2DAO = new GenericDAO<>(UsuarioParticipante2.class);
        UsuarioParticipanteDAO upartiDAO = new UsuarioParticipanteDAO();
        
        //UsuarioParticipante userRemetente = new UsuarioParticipante(0, "Pedro", "pedropopa98@gmail.com", "pedro123");
        //UsuarioParticipante userDestinatario = new UsuarioParticipante(0, "Marco", "marco@gmail.com", "marco123");
        
        UsuarioParticipante2 userDestinatario = upartiDAO.buscarPorId(1);
        UsuarioParticipante2 userRemetente = upartiDAO.buscarPorId(2);
        

        
        
        System.out.println("Usuário remetente (Nome): "+ userRemetente.getNome());
        System.out.println("Usuário destinatário (Nome): "+ userDestinatario.getNome());
        
        ComunicadoPPEnviado comunicadoEnviado = new ComunicadoPPEnviado("Não participarei do próximo confronto", 0, "W.0");
        ComunicadoPPRecebido comunicadoRecebido = new ComunicadoPPRecebido("Não participarei do próximo confronto", userRemetente, 0, true, "W.0");
        
        
       
       
        userRemetente.adicionarMensagemEnviada(comunicadoEnviado);
        userDestinatario.adicionarMensagemRecebida(comunicadoRecebido);
        
        comunicadoEnviadoDAO.salvar(comunicadoEnviado);
        comunicadoRecebidoDAO.salvar(comunicadoRecebido);
        
        usuarioParticipante2DAO.alterar(userRemetente);
        usuarioParticipante2DAO.alterar(userDestinatario);
        
        
        
        System.exit(0);
        
    }
    }

