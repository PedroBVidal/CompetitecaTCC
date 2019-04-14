
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gustavo
 */
public class CriarModalidadeColetiva {
    public static void main(String[] args) {
        Dao<ModalidadeColetiva> modal = new GenericDAO<>(ModalidadeColetiva.class);
        ModalidadeColetiva handebol = new ModalidadeColetiva(0, "Handebol");
        ModalidadeColetiva basquete = new ModalidadeColetiva(0, "Basquete");
        ModalidadeColetiva volei = new ModalidadeColetiva(0, "Volei");
        ModalidadeColetiva futsal = new ModalidadeColetiva(0, "Futsal");
        
        modal.salvar(futsal);
        modal.salvar(handebol);
        modal.salvar(basquete);
        modal.salvar(volei);
        
        System.exit(0);
    }
}
