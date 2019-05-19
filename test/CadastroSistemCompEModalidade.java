
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;
import br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio;
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
        
        Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
        Dao<SistemaTodosContraTodos> sistemaCptDAO = new GenericDAO<>(SistemaTodosContraTodos.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        Dao<CompeticaoModalidadeSolo> competicaoModalidadeSoloDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
        Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);

        
        ModalidadeSolo mS = modalidadeSoloDAO.buscarPorId(1);
        ModalidadeColetiva mC = modalidadeColetivaDAO.buscarPorId(1);
        SistemaDeContagem sistemaDeContagem = sistemaDeContagemDAO.buscarPorId(1);
        SistemaDeDesempate sistemaDeDesempate = sistemaDeDesempateDAO.buscarPorId(1);
        
       
        
        SistemaTodosContraTodos sistemaTodosContraTodos = new SistemaTodosContraTodos(sistemaDeContagem, sistemaDeDesempate, 0, "Sistema todos contra todos", new CompeticaoModalidadeColetiva());

        //CompeticaoModalidadeSolo competicaoModalidadeSolo = new CompeticaoModalidadeSolo(mS, true, 0, "IRAJIF TESTE", new SistemaTodosContraTodos());
        //CompeticaoModalidadeColetiva competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva(mC, 0, "Tenis (Dupla)", new SistemaTodosContraTodos());
        
        Competicao competicao = eventoDAO.buscarPorId(1);
        //competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        //competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        
        //competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaTodosContraTodos);
       // sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeColetiva);
        //competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaTodosContraTodos);
        //sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeSolo);
        
        //
        //modalidadeSoloDAO.salvar(mS);
        //modalidadeColetivaDAO.salvar(mC);
        //sistemaDeContagemDAO.salvar(sistemaDeContagem);
        //sistemaDeDesempateDAO.salvar(sistemaDeDesempate);
        //competicaoModalidadeSoloDAO.salvar(competicaoModalidadeSolo);
       // competicaoModalidadeColetivaDAO.salvar(competicaoModalidadeColetiva);
        eventoDAO.alterar(competicao);

        
        
        
        System.exit(0);
        
    }
}
