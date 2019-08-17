
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.Segmento;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class GeraTudo {
    
    
    public static void main(String[] args) {
        
        
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
        Dao<Segmento> SegmentoDAO = new GenericDAO<>(Segmento.class);
        /*Dao<UsuarioParticipante> upDAO = new GenericDAO<>(UsuarioParticipante.class);
        Dao<UsuarioParticipante2> up2DAO = new GenericDAO<>(UsuarioParticipante2.class);
        */
        UsuarioParticipante up = new UsuarioParticipante(0, "Gustavo Henrique de Souza Oliveira(Admin)", "oliveiragustavo1340@gmail.com", "Curitiba320");
       // UsuarioParticipante2 up2 = new UsuarioParticipante2(0, "Gustavo Henrique de Souza Oliveira(User)", "oliveiragustavo1340@gmail.com", "Curitiba320");
        
        Segmento segum = new Segmento(0, "4o. Info");
        Segmento segdois = new Segmento(0, "4o. Agro");
        
        //upDAO.salvar(up);
       // up2DAO.salvar(up2);
        SistemaDeContagem sistemaDeContagem1 = new SistemaDeContagem(0, 1, 0, 0, "Sistema 1-0");
        SistemaDeContagem sistemaDeContagem2 = new SistemaDeContagem(0, 2, 1, 0, "Sistema 2-1");
        SistemaDeContagem sistemaDeContagem3 = new SistemaDeContagem(0, 3, 1, 0, "Sistema 3-1");
        SistemaDeContagem sistemaDeContagem = new SistemaDeContagem();
        
        ModalidadeSolo modalidadeSolo1 = new ModalidadeSolo(0, "Tenis de Mesa");
        ModalidadeSolo modalidadeSolo2 = new ModalidadeSolo(0, "Xadrez");
        ModalidadeSolo modalidadeSolo3 = new ModalidadeSolo(0, "Tenis de quadra");
        ModalidadeSolo modalidadeSolo4 = new ModalidadeSolo(0, "X1 LOL");
        
        ModalidadeColetiva modalidadeColetiva = new ModalidadeColetiva(0, "Basquete 3x3",3);
        ModalidadeColetiva modalidadeColetiva1 = new ModalidadeColetiva(0, "Handbol",6);
        
        sistemaDeContagemDAO.salvar(sistemaDeContagem3);
        sistemaDeContagemDAO.salvar(sistemaDeContagem2);
        sistemaDeContagemDAO.salvar(sistemaDeContagem1);
        
        
        modalidadeSoloDAO.salvar(modalidadeSolo3);
        modalidadeColetivaDAO.salvar(modalidadeColetiva);
        modalidadeSoloDAO.salvar(modalidadeSolo2);
        modalidadeColetivaDAO.salvar(modalidadeColetiva1);
        modalidadeSoloDAO.salvar(modalidadeSolo1);
      
        modalidadeSoloDAO.salvar(modalidadeSolo4);
        
        SegmentoDAO.salvar(segum);
        SegmentoDAO.salvar(segdois);
        System.exit(0);
      
    }
    
    
}
