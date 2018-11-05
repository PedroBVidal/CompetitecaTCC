
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
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
public class VincularCompeticaoColetivaEmEventoExistente {
    public static void main(String[] args) {
        
        Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
        Dao<SistemaTodosContraTodos> sistemaCptDAO = new GenericDAO<>(SistemaTodosContraTodos.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
        Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
        Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
        Dao<CompeticaoModalidadeSolo> competicaoModalidadeSoloDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
        Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
        
        // CRIANDO NOVAS ENTIDADES
        ModalidadeColetiva mC = new ModalidadeColetiva(0, "Truco (Duplas)");
        SistemaDeContagem sistemaDeContagem = new SistemaDeContagem(0, 3, 0, 1);
        SistemaDeDesempate sistemaDeDesempate = new SistemaDeDesempate(0, "Saldos de Gols", "Taxa de vitória");
        
        
        
        /*
        //BUSCANDO ENTIDADES EXISTENTES
        ModalidadeSolo mS = modalidadeSoloDAO.buscarPorId(1);
        ModalidadeColetiva mC = modalidadeColetivaDAO.buscarPorId(1);
        SistemaDeContagem sistemaDeContagem = sistemaDeContagemDAO.buscarPorId(1);
        SistemaDeDesempate sistemaDeDesempate = sistemaDeDesempateDAO.buscarPorId(1);
        */
       
        
        SistemaTodosContraTodos sistemaTodosContraTodos = new SistemaTodosContraTodos(sistemaDeContagem, sistemaDeDesempate, 0, "Sistema todos contra todos", new CompeticaoModalidadeColetiva());

        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva(mC, 0, "Tenis (Dupla)", new SistemaTodosContraTodos());
        
        //CRIANDO UMA NOVA COMPETIÇÃO
        Competicao competicao = new Competicao(0, "Jogos IFPR 2018", new Date(), new Date());
        
        
        /*
        // BUSCANDO UMA COMPETICAO EXISTENTE
        //Competicao competicao = eventoDAO.buscarPorId(1);
        */
        
        // ADICIONA A MODALIDADE COLETIVA A COMPETIÇÃO
        competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        
        
        // RELAÇÃO @OneToOne
        // ADICONA O SISTEMA DE COMPETIÇÃO A COMPETIÇÃO MODALIDADE
        competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaTodosContraTodos);
        // ADICIONA A COMPETIÇÃO MODALIDADE AO SISTEMA DE COMPETIÇÃO
        sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeColetiva);

        
        
        modalidadeColetivaDAO.salvar(mC);
        sistemaDeContagemDAO.salvar(sistemaDeContagem);
        sistemaDeDesempateDAO.salvar(sistemaDeDesempate);
        
        competicaoModalidadeColetivaDAO.salvar(competicaoModalidadeColetiva);
        eventoDAO.salvar(competicao);

        
        
        
        System.exit(0);
    }
}

