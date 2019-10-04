
import br.edu.ifpr.irati.ti.dao.EquipeCompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.EquipeDAO;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
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
public class TesteOrdenarTabela {
    
    public static void main(String[] args) {
        EquipeCompeticaoDAO equipeCompeticaoDAO = new EquipeCompeticaoDAO();
        
        List<EquipeCompeticao> equipes = equipeCompeticaoDAO.ordenarEquipesCompeticao("Saldo de pontos", "Pontos sofridos", 2);
        
        for(EquipeCompeticao e : equipes){
            System.out.println("Nome equipe: "+ e.getEquipe().getNome());
            System.out.println("Pontos: "+ e.getPontos());
        }
        
    }
    
    
}
