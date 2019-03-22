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
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAARecebido;
import br.edu.ifpr.irati.ti.modelo.MensagemEnviada;
import br.edu.ifpr.irati.ti.modelo.MensagemRecebida;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;


/**
 *
 * @author Usuário
 */
public class ConsultarMensagensVinculadas {
    
     public static void main(String[] args) {
        
        UsuarioAdministradorDAO uadmDAO = new UsuarioAdministradorDAO();
        UsuarioParticipanteDAO upartiDAO = new UsuarioParticipanteDAO();

        UsuarioParticipante user1 = uadmDAO.buscarPorId(1);
        UsuarioParticipante2 userParticipante1 = upartiDAO.buscarPorId(1);
        UsuarioParticipante2 userParticipante2 = upartiDAO.buscarPorId(2);
        UsuarioParticipante2 userParticipante3 = upartiDAO.buscarPorId(3);

        System.out.println("Usuário ADM 1: (Nome): " + user1.getNome());
        System.out.println("Mensagens enviadas: ");
        
        for (MensagemEnviada mE : user1.getMensagensEnviadas()) {

            if (mE instanceof ComunicadoAAEnviado) {
                ComunicadoAAEnviado cE = (ComunicadoAAEnviado) mE;
                System.out.println("Texto comunicado: " + cE.getTexto());

            }

            if (mE instanceof ConviteGerenciamentoAAEnviado) {
                ConviteGerenciamentoAAEnviado cGe = (ConviteGerenciamentoAAEnviado) mE;
                System.out.println("Texto convite: " + cGe.getTexto());
            }
            
            if (mE instanceof ComunicadoAPEnviado) {
                ComunicadoAPEnviado cE = (ComunicadoAPEnviado) mE;
                System.out.println("Texto comunicado: " + cE.getTexto());

            }
        }

        System.out.println("Mensagens recebidas");
        for (MensagemRecebida mR : user1.getMensagensRecebidas()) {

            if (mR instanceof ComunicadoAARecebido) {
                ComunicadoAARecebido cR = (ComunicadoAARecebido) mR;
                System.out.println("Texto comunicado: " + cR.getTexto());

            }

            if (mR instanceof ConviteGerenciamentoAARecebido) {
                ConviteGerenciamentoAARecebido cGr = (ConviteGerenciamentoAARecebido) mR;
                System.out.println("Texto convite: " + cGr.getTexto());
            }

        }

         System.out.println("Usuário 1 Participante: (Nome): " + userParticipante1.getNome());

         System.out.println("Mensagens recebidas");
         for (MensagemRecebida mR : userParticipante1.getMensagensRecebidas()) {

             if (mR instanceof ComunicadoAPRecebido) {
                 ComunicadoAPRecebido cR = (ComunicadoAPRecebido) mR;
                 System.out.println("Texto comunicado: " + cR.getTexto());
             }

         }

         System.out.println("Usuário 2 Participante: (Nome): " + userParticipante2.getNome());


         System.out.println("Mensagens recebidas");
         for (MensagemRecebida mR : userParticipante2.getMensagensRecebidas()) {

             if (mR instanceof ComunicadoAPRecebido) {
                 ComunicadoAPRecebido cR = (ComunicadoAPRecebido) mR;
                 System.out.println("Texto comunicado: " + cR.getTexto());
             }

         }

         System.out.println("Usuário 3 Participante: (Nome): " + userParticipante3.getNome());

         System.out.println("Mensagens recebidas");
         for (MensagemRecebida mR : userParticipante1.getMensagensRecebidas()) {

             if (mR instanceof ComunicadoAPRecebido) {
                 ComunicadoAPRecebido cR = (ComunicadoAPRecebido) mR;
                 System.out.println("Texto comunicado: " + cR.getTexto());
             }

         }
        System.exit(0);
    }
    
    
    
    
    }
