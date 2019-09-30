
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.EquipeCompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
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
public class testeResetarEquipes {
    
    public static void main(String[] args) {
        
         Dao<CompeticaoModalidadeColetiva> cptModaDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
         CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
         
         
         CompeticaoModalidadeColetiva cmc = cptModaDAO.buscarPorId(2);
         
         for(EquipeCompeticao equipeCompeticao : cmc.getEquipesCompeticao()){
             
             System.out.println(equipeCompeticao.getPontos());
             System.out.println(equipeCompeticao.getJogos());
         }
         
         cmcc.zerarPontosEquipesCompeticao(cmc);
        
        for(EquipeCompeticao equipeCompeticao : cmc.getEquipesCompeticao()){
             
             System.out.println(equipeCompeticao.getPontos());
             System.out.println(equipeCompeticao.getJogos());
             
         }
        
        cptModaDAO.alterar(cmc);
         
    }
    
    
}
