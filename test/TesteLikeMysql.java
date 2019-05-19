
import br.edu.ifpr.irati.ti.dao.CompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
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
public class TesteLikeMysql {
    
    public static void main(String[] args) {
        
    
    Dao<Competicao> competicaoDAOGeneric = new GenericDAO<>(Competicao.class);
    CompeticaoDAO competicaoDAO = new CompeticaoDAO();
    
    List<Competicao> competicoes = competicaoDAO.buscarPorParteNome("Market");
    
    for(Competicao c : competicoes){
        
        System.out.println(c.getNome());
    }
    
    System.exit(0);
    }
}
