
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle;
import br.edu.ifpr.irati.ti.controle.EquipeControle;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import java.util.ArrayList;
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
public class GerarEquipesCompeticao {
    
    public static void main(String[] args) {
        
        EquipeControle equipeControle = new EquipeControle();
        EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
        CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
        
        
        Equipe equipe = equipeControle.buscarPorId(1);
        CompeticaoModalidadeColetiva cmc = competicaoModalidadeColetivaControle.buscarPorId(4);       
        List<EquipeCompeticao> equipesCompeticao = new ArrayList<>();
        
        for(int i = 1; i <= 16; i++){
            EquipeCompeticao equipeCompeticao = new EquipeCompeticao();
            equipeCompeticao.setEquipe(equipe);
            equipesCompeticao.add(equipeCompeticao);
        }
        
        cmc.setEquipesCompeticao(equipesCompeticao);
        
        for(EquipeCompeticao equipeCompeticao: equipesCompeticao){
            equipeCompeticaoControle.salvar(equipeCompeticao);
        }
        competicaoModalidadeColetivaControle.alterar(cmc);
        
        System.exit(0);
    }
    
    
}
