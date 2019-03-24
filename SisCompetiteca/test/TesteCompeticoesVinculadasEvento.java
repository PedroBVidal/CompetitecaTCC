
import br.edu.ifpr.irati.ti.dao.CompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;
import br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteCompeticoesVinculadasEvento {
    public static void main(String[] args) {
        
        Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
        Dao<CompeticaoModalidadeSolo> cptMsDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
        Dao<CompeticaoModalidadeColetiva> cptMcDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(br.edu.ifpr.irati.ti.modelo.ModalidadeSolo.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<SistemaTodosContraTodos> sistemaTodosContraTodosDAO = new GenericDAO<>(SistemaTodosContraTodos.class);
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        CompeticaoDAO competicaoDAO = new CompeticaoDAO();
        
        /*
        ModalidadeSolo ms = modalidadeSoloDAO.buscarPorId(1);
        ModalidadeColetiva mc = modalidadeColetivaDAO.buscarPorId(1);
        SistemaDeContagem sC = sistemaDeContagemDAO.buscarPorId(1);
        
        SistemaDeDesempate sD = new SistemaDeDesempate(0, "pontos marcados", "vitorias");
        SistemaTodosContraTodos sisTodos = new SistemaTodosContraTodos(sC, sD, 0,"Sistema todos contra todos", new CompeticaoModalidadeSolo());
        CompeticaoModalidadeSolo compSolo = new CompeticaoModalidadeSolo(ms, 0, "Competição inserida manualmente", new SistemaTodosContraTodos());
        //CompeticaoModalidadeColetiva compColetiva = new CompeticaoModalidadeColetiva(mc, 0,"Comp teste", sisTodos);
        
        
        Competicao competicao = eventoDAO.buscarPorId(11);
        
        competicao.adcionarCompeticaoModalidadeSolo(compSolo);
        //competicao.adicionarCompeticaoModalidadeColetiva(compColetiva);
        sisTodos.setCompeticaoModalidade(compSolo);
        //sisTodos.setCompeticaoModalidade(compColetiva);
        compSolo.setSistemaDeCompeticao(sisTodos);
        //compColetiva.setSistemaDeCompeticao(sisTodos);
        sistemaDeDesempateDAO.salvar(sD);
        
        cptMsDAO.salvar(compSolo);
        //cptMcDAO.salvar(compColetiva);
        sistemaTodosContraTodosDAO.salvar(sisTodos);

        
        eventoDAO.alterar(competicao);
        
        */
        
        Competicao competicao = competicaoDAO.buscarPorId(11);
        
        for(CompeticaoModalidade cm : competicao.getCmodalidadecole()){
            System.out.println("Nome competição coletiva " + cm.getNomeCompeticao());
        }
        
        for(CompeticaoModalidade cm : competicao.getCmodalidadesolo()){
            System.out.println("Nome competição solo " + cm.getNomeCompeticao());
        }
        
        System.exit(0);
    }
}
