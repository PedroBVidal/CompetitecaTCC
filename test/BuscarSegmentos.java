
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.SegmentoDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.Segmento;
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
public class BuscarSegmentos {
    
    public static void main(String[] args) {
        
        SegmentoDAO segmentoDAO = new SegmentoDAO();
        Dao<Segmento> segmentoDAO2 = new GenericDAO<>(Segmento.class);
        
        List<Segmento> segmentos = segmentoDAO2.buscarTodos(Segmento.class);
        
        System.out.println(segmentos);
    }
    
}
