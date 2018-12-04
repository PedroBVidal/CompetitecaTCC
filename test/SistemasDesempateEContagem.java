
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class SistemasDesempateEContagem {
    
    
    public static void main(String[] args) {
        
        
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
        
        
        SistemaDeContagem sistemaDeContagem1 = new SistemaDeContagem(0, 1, 0, 0, "Sistema 1-0");
        SistemaDeContagem sistemaDeContagem2 = new SistemaDeContagem(0, 2, 1, 0, "Sistema 2-1");
        SistemaDeContagem sistemaDeContagem3 = new SistemaDeContagem(0, 3, 1, 0, "Sistema 1-0");
        
        ModalidadeSolo modalidadeSolo1 = new ModalidadeSolo(0, "Tenis de Mesa");
        //ModalidadeSolo modalidadeSolo2 = new ModalidadeSolo(0, "Xadrez");
        ModalidadeSolo modalidadeSolo3 = new ModalidadeSolo(0, "Tenis de quadra");
        ModalidadeSolo modalidadeSolo4 = new ModalidadeSolo(0, "X1 LOL");
        
        ModalidadeColetiva modalidadeColetiva = new ModalidadeColetiva(0, "Basquete 3x3");
        ModalidadeColetiva modalidadeColetiva1 = new ModalidadeColetiva(0, "Handbol");
        
        sistemaDeContagemDAO.salvar(sistemaDeContagem3);
        sistemaDeContagemDAO.salvar(sistemaDeContagem2);
        sistemaDeContagemDAO.salvar(sistemaDeContagem1);
        
        
        modalidadeSoloDAO.salvar(modalidadeSolo3);
        modalidadeColetivaDAO.salvar(modalidadeColetiva);
        //modalidadeSoloDAO.salvar(modalidadeSolo2);
        modalidadeColetivaDAO.salvar(modalidadeColetiva1);
        modalidadeSoloDAO.salvar(modalidadeSolo1);
      
        modalidadeSoloDAO.salvar(modalidadeSolo4);
      
    }
    
    
}
