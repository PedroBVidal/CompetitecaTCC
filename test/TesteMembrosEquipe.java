
import br.edu.ifpr.irati.ti.controle.EquipeControle;
import br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle;
import br.edu.ifpr.irati.ti.dao.EquipeDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioParticipanteDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteMembrosEquipe {
    
    public static void main(String[] args) {
        
    
    EquipeControle equipeControle = new EquipeControle();
    //Equipe equipe = equipeControle.buscarPorId(1);
    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
        UsuarioParticipanteDAO usuarioParticipanteDAO = new UsuarioParticipanteDAO();
        EquipeDAO equipeDAO = new EquipeDAO();
        
        
        //UsuarioParticipante2 uP1 = usuarioParticipanteDAO.buscarPorId(5);
        //UsuarioParticipante2 uP2 = usuarioParticipanteDAO.buscarPorId(3);
        
        //System.out.println(uP1.getMensagensEnviadas());
        //System.out.println(uP1.getMensagensRecebidas());
        
        //System.out.println(uP2.getMensagensEnviadas());
        //System.out.println(uP2.getMensagensRecebidas());
       
        
        
        for(UsuarioParticipante2 usuarioParticipante2 : usuarioParticipante2Controle.buscarTodos()){
            System.out.println(usuarioParticipante2.getNome());
            System.out.println(usuarioParticipante2.getAtleta().getIdAtleta());
            System.out.println(usuarioParticipante2.getMensagensRecebidas());
            System.out.println(usuarioParticipante2.getMensagensEnviadas());
        }
       
        /*
        for (Equipe equipe : equipeDAO.buscarTudo()) {
            System.out.println(equipe);
        }
       */
        
        System.exit(0);
    }
}
