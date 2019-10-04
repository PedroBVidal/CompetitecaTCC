
import br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author olive
 */
public class TesteGerarEliminatórias {
    public static void main(String[] args) {
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
        CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(1);
        cmcc.gerarConfrontosEliminatorias(cmc);
        System.exit(0);
    }
}
