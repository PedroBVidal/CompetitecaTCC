
import br.edu.ifpr.irati.ti.controle.MensagemControle;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Mensagem;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author user
 */
public class TesteMensagem {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Dao<Mensagem> msg = new GenericDAO<>(Mensagem.class);
        Dao<UsuarioParticipante> up = new GenericDAO<>(UsuarioParticipante.class);
        Dao<UsuarioParticipante2> up2 = new GenericDAO<>(UsuarioParticipante2.class);

        UsuarioParticipante upar = up.buscarPorId(1);
        UsuarioParticipante2 upar2 = up2.buscarPorId(1);
        MensagemControle msgc = new MensagemControle();
        msgc.enviarMensagem(upar2,upar,"Seu acesso foi negado" ,"Olá meu senhor, o vosso acesso foi negado :(");
        for (Mensagem mesg : upar.getMsg()) {
            if (mesg.getTipoRemetente() == 2) {
                System.out.println("Remetente: " + mesg.getTipoUser().getNome() + "\n Assunto:"+mesg.getAssunto()+"\n Mensagem: " + mesg.getTexto());
            }
            if (mesg.getTipoRemetente() == 1) {
                System.out.println("Remetente: " + mesg.getTipoAdm().getNome() + "\n Assunto:"+mesg.getAssunto()+"\n Mensagem: " + mesg.getTexto());
            }

        }

    }

}
