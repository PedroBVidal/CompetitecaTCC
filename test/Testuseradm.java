
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

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
       Dao<UsuarioParticipante> upc = new GenericDAO<>(UsuarioParticipante.class);
       upc.salvar(up);
    }
    
}
