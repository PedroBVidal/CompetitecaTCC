
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;

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
        
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
        double num = 1.50;
        
        CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(1);
        
        System.out.println(cmc.getBlocosEliminatorios().size());
        
        
        for(BlocoEliminatorio bE : cmc.getBlocosEliminatorios()){
            System.out.println(bE.getEtapa());
        }
        
        System.exit(0);
    }
}
