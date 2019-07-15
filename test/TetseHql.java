
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
    EquipeDAO equipeDAO = new EquipeDAO();
    
    List<CompeticaoModalidadeColetiva> cmc = competicaoModalidadeColetivaDAO.buscarCompeticoesColetivasVinculadasModalidadeColetiva(1);
        System.out.println("DATE: "+ cmc);  
        
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(date);
        System.out.println(sdf.format(date));
        
        System.exit(0);
        
        
        
    }
    
   
    
}
