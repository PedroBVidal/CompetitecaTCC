
import br.edu.ifpr.irati.ti.dao.UsuarioAdministradorDAO;
import br.edu.ifpr.irati.ti.modelo.Segmento;
import java.util.Set;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteSET {
    
    
    public static void main(String[] args) {
        
        UsuarioAdministradorDAO usuarioAdministradorDAO = new UsuarioAdministradorDAO();
        
        usuarioAdministradorDAO.buscarPorId(1);
        
    }
    
}
