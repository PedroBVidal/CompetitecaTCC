
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import br.edu.ifpr.irati.ti.modelo.Local;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author olive
 */
public class GeraConfrontos {

    public static void main(String[] args) {
        //Código gerador de confrontos todos x todos
        /* O código entende que cada equipe pode criar um «bloco» de confrontos
           este bloco vai diminuindo de tamanho de acordo com o seu número.
           Exemplo:
              O bloco 0 não possui nenhum desconto, já o bloco 2 deve descontar 1 confronto.
           Isto ocorre pelo fato de que o numero de repetições aumentam de acordo com o «bloco», sendo
           que a última equipe do range não possui nenhum confronto em seu bloco, pois todas as possíveis a
           ele já foram criadas.
        */
        Dao<Equipe> eqpd = new GenericDAO<>(Equipe.class);
        List<Equipe> leqp = eqpd.buscarTodos(Equipe.class);
        ModalidadeColetiva mc = new ModalidadeColetiva(1, "Basquete 3x3", 3);
        List<ConfrontoModalidadeColetiva> lcmdc = new ArrayList<>();
        int tamanho = leqp.size();
        
        Random rd = new Random();
        //Contador do número do «bloco»
        int block = 0;
        System.out.println("Início dos Processos");
        for (Equipe eq : leqp) {

            for (int i = block; i < tamanho; i++) {

                if (leqp.get(i).getIdEquipe() != eq.getIdEquipe()) {
                    List<Equipe> temp = new ArrayList<>();
                    temp.add(eq);
                    temp.add(leqp.get(i));

                    ConfrontoModalidadeColetiva cmc = new ConfrontoModalidadeColetiva(temp, mc, rd.nextInt(), new Date(), new Date(), new Date(), "Manhã", new Local(), true, "V");
                    lcmdc.add(cmc);
                }

            }
            block++;
        }
        System.out.println(lcmdc.size());
        int i = 0;
        for (ConfrontoModalidadeColetiva cc : lcmdc) {
            System.out.println("Confronto " + i);
            for (int j = 0; j < cc.getEquipes().size(); j++) {
                System.out.println(cc.getEquipes().get(j).getNome() + "; id: " + cc.getEquipes().get(j).getIdEquipe());
            }
            i++;
        }
        System.exit(0);
    }
}
