
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.dao.CompeticaoModalidadeColetivaDAO;
import br.edu.ifpr.irati.ti.dao.EquipeDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import java.text.SimpleDateFormat;
import java.util.Date;
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
    CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();

    EquipeDAO equipeDAO = new EquipeDAO();
    
    CompeticaoModalidadeColetiva cmc = competicaoControle.buscarPorId(1);
    
        System.out.println(cmc.getConfrontos());
    System.exit(0);
        
   
        
    }
    
   
    
}
