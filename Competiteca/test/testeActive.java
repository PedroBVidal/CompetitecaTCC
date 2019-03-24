
import br.edu.ifpr.irati.ti.controle.CompeticaoControle;
import br.edu.ifpr.irati.ti.modelo.Competicao;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gustavo
 */
public class testeActive {
    public static void main(String[] args) {
        CompeticaoControle cc = new CompeticaoControle();
        Competicao comp = cc.buscarCompeticaoPorId(1);
        if (comp.isInativo()) {
            System.out.println("Está Inativo; Ativaremos");
            comp.setInativo(false);
        }else{
            System.out.println("Já está ativo, não há a necessidade de ativar");
            System.out.println("Nome:"+comp.getNome()+"\n Id:"+comp.getIdCompeticao()+"\n Inativo:"+comp.isInativo());
        System.exit(0);
        }
        cc.autualizarCompeticao(comp);
        comp = cc.buscarCompeticaoPorId(1);
        if (!comp.isInativo()) {
            System.out.println("Agora está ativo");
        }

    }
}
