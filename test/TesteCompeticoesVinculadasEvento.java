
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
public class TesteCompeticoesVinculadasEvento {
    public static void main(String[] args) {
        
        Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
        Dao<CompeticaoModalidadeSolo> cptMcDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
        Dao<CompeticaoModalidadeColetiva> cptMsDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
        Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(br.edu.ifpr.irati.ti.modelo.ModalidadeSolo.class);
        Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
        Dao<Sis>
        
        ModalidadeSolo ms = modalidadeSoloDAO.buscarPorId(1);
        SistemaDeContagem sC = 
        SistemaDeDesempate sD = new SistemaDeDesempate(0, "pontos marcados", "vitorias");
        SistemaTodosContraTodos sisTodos = new SistemaTodosContraTodos(, sD, 0, nome, competicaoModalidade)
        
        
        Competicao competicao = new Competicao(0, "Comp Teste", new Date(), new Date());
        

        
        
        System.exit(0);
    }
}
