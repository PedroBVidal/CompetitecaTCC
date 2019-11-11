
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class TesteArredondamento {
    
    
    public static void main(String[] args) {

        int num = 4;
        double numeroPaginas =  Math.rint(num/2) + (num % 2);
        System.out.println("Número páginas: "+ numeroPaginas);

        
        System.exit(0);
    }
}
