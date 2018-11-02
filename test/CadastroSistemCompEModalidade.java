
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;
import br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos;
import gerais.HibernateUtil;
import org.hibernate.Session;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class CadastroSistemCompEModalidade {
    public static void main(String[] args) {
        
        
        Dao<SistemaTodosContraTodos> sistemaCptDAO = new GenericDAO<>(SistemaTodosContraTodos.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeCompeticao.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        Dao<CompeticaoModalidadeSolo> competicaoModalidadeSoloDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
        
        
        ModalidadeSolo mS = new ModalidadeSolo(0, "Tênis");
        ModalidadeColetiva mC = new ModalidadeColetiva(0, "Basquete");
        SistemaDeContagem sistemaDeContagem = new SistemaDeContagem(0, 3, 0, 1);
        SistemaDeDesempate sistemaDeDesempate = new SistemaDeDesempate(0, "saldoDeGols", "vitorias");
        
       
        
        SistemaTodosContraTodos sistemaTodosContraTodos = new SistemaTodosContraTodos(sistemaDeContagem, sistemaDeDesempate, 0, "Sistema todos contra todos", new CompeticaoModalidadeSolo());

        CompeticaoModalidadeSolo competicaoModalidadeSolo = new CompeticaoModalidadeSolo(mS, true, 0, "IRAJIF TESTE", new SistemaTodosContraTodos());
        
        competicaoModalidadeSolo.setSistemaDeCompeticao(sistemaTodosContraTodos);
        sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeSolo);
        
        //
        modalidadeSoloDAO.salvar(mS);
        modalidadeColetivaDAO.salvar(mC);
        sistemaDeContagemDAO.salvar(sistemaDeContagem);
        sistemaDeDesempateDAO.salvar(sistemaDeDesempate);
        competicaoModalidadeSoloDAO.salvar(competicaoModalidadeSolo);
        //sistemaCptDAO.salvar(sistemaTodosContraTodos);
        
        
        
        System.exit(0);
        
    }
}
