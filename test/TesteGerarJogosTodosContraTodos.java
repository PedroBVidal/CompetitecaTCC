
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
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
public class TesteGerarJogosTodosContraTodos {
    
    public static void main(String[] args) {
        
    
    EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(1);
    List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
    
    cmc.gerarConfrontosSistemaTodosContraTodos(equipesCompeticao);
    
        System.out.println(equipesCompeticao.get(0).getIdEquipeCompeticao());
    
    }
}
