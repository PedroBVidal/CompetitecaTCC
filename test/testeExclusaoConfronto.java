
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class testeExclusaoConfronto {
    
    public static void main(String[] args) {
        
    
    Dao<CompeticaoModalidade> cptModaDAO = new GenericDAO<>(CompeticaoModalidade.class);
    Dao<Confronto> conDao = new GenericDAO<>(Confronto.class);
    
    CompeticaoModalidade cm = cptModaDAO.buscarPorId(3);
    ConfrontoModalidadeColetiva confrontoModColetiva = (ConfrontoModalidadeColetiva) conDao.buscarPorId(25);

    
    System.out.println("CM:"+ cm);
    System.out.println("Confronto: "+ confrontoModColetiva);
    
    confrontoModColetiva.removeAllEquipesCompeticao();
    
    System.out.println("Tamanho da lista de confronto: "+ cm.getConfrontos().size());
    
    for(Confronto c : cm.getConfrontos()){
        if(c.getIdConfronto() == confrontoModColetiva.getIdConfronto()){
            cm.removerConfronto(c);
            break;
        }
    }
    
    System.out.println("Tamanho lista de confronto: "+ cm.getConfrontos().size());
    cptModaDAO.alterar(cm);
    
    //conDao.alterar(confrontoModColetiva);
    //conDao.excluir(confrontoModColetiva);
    System.exit(0);
    }
}
