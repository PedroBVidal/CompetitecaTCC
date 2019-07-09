
import br.edu.ifpr.irati.ti.dao.CompeticaoModalidadeColetivaDAO;
import br.edu.ifpr.irati.ti.dao.EquipeDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TetseHql {
    public static void main(String[] args) {
        
    
    CompeticaoModalidadeColetivaDAO competicaoModalidadeColetivaDAO = new CompeticaoModalidadeColetivaDAO();
    EquipeDAO equipeDAO = new EquipeDAO();
    
    List<Equipe> equipes = equipeDAO.buscarTeste(3,2);
    
        for(Equipe equipe: equipes){
            System.out.println(equipe.getNome());
        }

    System.exit(0);
        
    }
    
    
}
