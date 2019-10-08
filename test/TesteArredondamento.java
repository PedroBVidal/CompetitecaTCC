
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
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
public class TesteArredondamento {
    
    
    public static void main(String[] args) {
        /*
        double num = 1.50;
        System.out.println(cmc.getBlocosEliminatorios().size());
        double numeroPaginas =  Math.rint(cmc.getBlocosEliminatorios().size() / 3);
        System.out.println("Número páginas: "+ numeroPaginas);
        */
        
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

        
        CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(2);
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        System.out.println("Equipes competicao (ANTES): "+equipesCompeticao);
        for(BlocoEliminatorio bE : cmc.getBlocosEliminatorios()){
                                        // Verifica se já faz parte do bloco eliminatorio
                            for (Confronto confronto : bE.getConfrontos()) {
                                
                            System.out.println("CCC");
                            ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                            if(confColetivo.getEquipes().isEmpty() == false){
                                for(EquipeCompeticao eq: confColetivo.getEquipes()){
                                    for(EquipeCompeticao equipeCompeticao: equipesCompeticao){
                                        if(eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()){
                                            
                                            System.out.println("CCC: "+equipeCompeticao.getEquipe().getNome());
                                            equipesCompeticao.remove(equipeCompeticao);
                                            break;
                                        }
                                    }
                                }
                            }
                            }
        }
        
        System.out.println("Equipes competicao (DEPOIS): "+equipesCompeticao);
        
        System.exit(0);
    }
}
