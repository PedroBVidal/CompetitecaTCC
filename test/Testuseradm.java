
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioAdministradorDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author user
 */
public class Testuseradm {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       UsuarioParticipante up = new UsuarioParticipante(0, "Gustavo H.S.Oliveira", "oliveiragugahso@hotmail.com", "curitiba320");
        UsuarioAdministradorDAO usuarioAdministradorDAO = new UsuarioAdministradorDAO();
       Dao<UsuarioParticipante> upc = new GenericDAO<>(UsuarioParticipante.class);
       
        List<Competicao> competicoes = usuarioAdministradorDAO.buscarPorIdConfrontos(1);
        
        for(Competicao competicao : competicoes){
            System.out.println(competicao.getNome());
        }
       
       
       
       
    }
    
}
