
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle;
import br.edu.ifpr.irati.ti.controle.EquipeControle;
import br.edu.ifpr.irati.ti.dao.BlocoEliminatorioDAO;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
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
public class TestFiltro {
    
    public static void main(String[] args) {
        
        CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
        BlocoEliminatorioDAO blocoEliminatorioDAO = new BlocoEliminatorioDAO();
        
        CompeticaoModalidadeColetiva cmc = competicaoModalidadeColetivaControle.buscarPorId(2);
        
        List<BlocoEliminatorio> blocosEliminatorios = cmc.filtrarBlocoEliminatorioPorEtapa(cmc, 1, 3, false);
        
        System.out.println(blocosEliminatorios);
        

        System.exit(0);
        
    }
    
    
    
}
