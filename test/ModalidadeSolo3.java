
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class ModalidadeSolo3 {
    
    public static void main(String[] args) {
        
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(br.edu.ifpr.irati.ti.modelo.ModalidadeSolo.class);
        
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        
        ModalidadeColetiva modalidadeColetiva = new ModalidadeColetiva(0, "Basquete 3x3");
        ModalidadeSolo modalidadeSolo = new ModalidadeSolo(0, "Xadrez");
        
        modalidadeColetivaDAO.salvar(modalidadeColetiva);
        modalidadeSoloDAO.salvar(modalidadeSolo);
    }
    
}
