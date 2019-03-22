
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
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
        
    
    Dao<Competicao> comDao = new GenericDAO<>(Competicao.class);
    
    Competicao competicao = new Competicao(0, "Comp TESTE", new Date(), new Date(), true);
    
    comDao.salvar(competicao);
    
    
    }
    
    
    
}
