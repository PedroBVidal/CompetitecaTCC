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
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAAEnviado;
import br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAARecebido;
import br.edu.ifpr.irati.ti.modelo.MensagemEnviada;
import br.edu.ifpr.irati.ti.modelo.MensagemRecebida;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

/**
 *
 * @author Usuário
 */
public class ConsultaMensagensVinculadas {

    public static void main(String[] args) {

        Dao<ComunicadoAAEnviado> comunicadoEnviadoDAO = new GenericDAO<>(ComunicadoAAEnviado.class);
        Dao<ComunicadoAARecebido> comunicadoRecebidoDAO = new GenericDAO<>(ComunicadoAARecebido.class);
        Dao<UsuarioParticipante> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante.class);

        UsuarioParticipante user1 = usuarioParticipanteDAO.buscarPorId(1);
        UsuarioParticipante user2 = usuarioParticipanteDAO.buscarPorId(2);

        System.out.println("Usuário 1: (Nome): " + user1.getNome());
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

        System.out.println("Usuário 2: (Nome): " + user2.getNome());
        System.out.println("Mensagens enviadas: ");
        
        for (MensagemEnviada mE : user2.getMensagensEnviadas()) {

            if (mE instanceof ComunicadoAAEnviado) {
                ComunicadoAAEnviado cE = (ComunicadoAAEnviado) mE;
                System.out.println("Texto comunicado: " + cE.getTexto());
            }

            if (mE instanceof ConviteGerenciamentoAAEnviado) {
                ConviteGerenciamentoAAEnviado cGe = (ConviteGerenciamentoAAEnviado) mE;
                System.out.println("Texto convite: " + cGe.getTexto());
            }
        }

        System.out.println("Mensagens recebidas");
        for (MensagemRecebida mR : user2.getMensagensRecebidas()) {

            if (mR instanceof ComunicadoAARecebido) {
                ComunicadoAARecebido cR = (ComunicadoAARecebido) mR;
                System.out.println("Texto comunicado: " + cR.getTexto());

            }

            if (mR instanceof ConviteGerenciamentoAARecebido) {
                ConviteGerenciamentoAARecebido cGr = (ConviteGerenciamentoAARecebido) mR;
                System.out.println("Texto convite: " + cGr.getTexto());
            }
        }
        System.exit(0);
    }
    
    
}
