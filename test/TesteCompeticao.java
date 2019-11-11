
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteCompeticao {
    public static void main(String[] args) {
        
    CompeticaoModalidadeColetivaControle cptModColetivaControle = new CompeticaoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva cmc = cptModColetivaControle.buscarPorId(5);
        for(BlocoEliminatorio bE: cmc.buscarBlocosEliminatoriosRepescagem()){
        System.out.println("ETAPA "+bE.getEtapa());
            System.out.println("TAMANHO"+bE.getEtapa()+": "+bE.getConfrontos().size());
            
    }
    cptModColetivaControle.fecharSessaoDAOGeneric();
    
    SistemaEliminatorio sistemaDeCompeticao = (SistemaEliminatorio) cmc.getSistemaDeCompeticao();
    boolean repescagem = sistemaDeCompeticao.isRepescagem();
    
    

    
    //cptModColetivaControle.gerarConfrontosSistemaEliminatorio(cmc, repescagem);
    
    System.exit(0);
    
    }
    
    
    
}
