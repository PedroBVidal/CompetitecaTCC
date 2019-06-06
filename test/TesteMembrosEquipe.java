
import br.edu.ifpr.irati.ti.controle.EquipeControle;
import br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle;
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
    Equipe equipe = equipeControle.buscarPorId(1);
    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
        UsuarioParticipanteDAO usuarioParticipanteDAO = new UsuarioParticipanteDAO();
        
        System.out.println(usuarioParticipanteDAO.buscarPorId(1).getNome());
        
        for(UsuarioParticipante2 usuarioParticipante2 : usuarioParticipante2Controle.buscarTodos()){
            System.out.println(usuarioParticipante2.getNome());
            System.out.println(usuarioParticipante2.getAtleta().getIdAtleta());
        }
        
       
        
        System.exit(0);
    }
}
