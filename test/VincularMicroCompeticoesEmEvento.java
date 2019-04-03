
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao;
import java.util.Date;
import gerais.HibernateUtil;
import org.hibernate.Session;


public class VincularMicroCompeticoesEmEvento {
    
    public static void main(String[] args) {
        
    /*
    Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
    Dao<CompeticaoModalidadeSolo> cptMcDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);
    Dao<CompeticaoModalidadeColetiva> cptMsDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
    Dao<SistemaDeCompeticao> sistemaCptDAO = new GenericDAO<>(SistemaDeCompeticao.class);
    Dao<ModalidadeColetiva> modalidadeColetivaDAO = new GenericDAO<>(ModalidadeColetiva.class);
    Dao<ModalidadeSolo> modalidadeSoloDAO = new GenericDAO<>(ModalidadeSolo.class);
    
    
    Competicao competicao = new Competicao(0, "TESTE COMPETICAO", new Date(), new Date());
    ModalidadeSolo modalidadeSolo = modalidadeSoloDAO.buscarPorId(1);
    SistemaDeCompeticao sistemaDeCompeticao = new SistemaDeCompeticao(0, nome, competicaoModalidade) {
    }
    
    //CompeticaoModalidadeSolo competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, false, 0, "Compeonato Basquete IFPR", )
    
    
    */
    
    Dao<Competicao> eventoDAO = new GenericDAO<>(Competicao.class);
    Competicao competicao = eventoDAO.buscarPorId(1);
    
    
    
    
    
    }

}

