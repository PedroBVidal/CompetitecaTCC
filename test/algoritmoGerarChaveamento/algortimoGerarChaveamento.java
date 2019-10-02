
package algoritmoGerarChaveamento;

import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import br.edu.ifpr.irati.ti.modelo.ParesConfronto;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class algortimoGerarChaveamento {
    
    public static void main(String[] args) {
        
    
    // Declara OS DAOS nescessários
    
    List<EquipeCompeticao> equipesCompeticao = new ArrayList();
    
    
    int numeroEquipes = 16;
        
        int potenciaDe2Anterior = 2;
        int potenciaDe2Posterior = 4;

    boolean i = true;

    
    while(i == true){

        
        if(numeroEquipes <= potenciaDe2Posterior){
            break;
        }
        
        if(numeroEquipes >= potenciaDe2Posterior){
                potenciaDe2Anterior = potenciaDe2Anterior * 2;
                potenciaDe2Posterior = potenciaDe2Posterior * 2;
        } 
    }
    
    int numeroDeConfrontosColetivos = potenciaDe2Posterior/2;
    int numBolocoEliminatorio = 1;
    int numParConfronto = 1;
    
    List<ConfrontoModalidadeColetiva> confrontos = new ArrayList();
    List<ParesConfronto> listParesConfronto = new ArrayList();
    ParesConfronto paresConfronto = new ParesConfronto(0, numParConfronto);
    BlocoEliminatorio blocoEliminatorio = new BlocoEliminatorio();
    blocoEliminatorio.setEtapa(numBolocoEliminatorio);
    List<BlocoEliminatorio> blocosElimitario = new ArrayList();
    blocosElimitario.add(blocoEliminatorio);
    
    for(int j = 1; j <=numeroDeConfrontosColetivos; j++){
        // Instancia um confronto
        ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
        confrontoModalidadeColetiva.setConfrontoRodada(j);
        confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
        // Vincula o confronto na lista
        confrontos.add(confrontoModalidadeColetiva);
        blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
        
        if(j == numeroDeConfrontosColetivos){
            if((numeroDeConfrontosColetivos / 2) == 1){
                numBolocoEliminatorio++;
                blocoEliminatorio = new BlocoEliminatorio();
                blocoEliminatorio.setEtapa(numBolocoEliminatorio);
                
                paresConfronto = new ParesConfronto(0, 1);
                // Instancia o confronto coletivo final e disputa pelo 3 e 4 lugar.
                confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                confrontoModalidadeColetiva.setConfrontoRodada(1);
                confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                confrontos.add(confrontoModalidadeColetiva);
                blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
                
                confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                confrontoModalidadeColetiva.setConfrontoRodada(2);
                confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                confrontos.add(confrontoModalidadeColetiva);
                blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
                
                blocosElimitario.add(blocoEliminatorio);
                break;
            }
            else{
                numeroDeConfrontosColetivos = numeroDeConfrontosColetivos/2;
                j = 0;
                
                numBolocoEliminatorio++;
                blocoEliminatorio = new BlocoEliminatorio();
                blocoEliminatorio.setEtapa(numBolocoEliminatorio);
                System.out.println(blocosElimitario);
                blocosElimitario.add(blocoEliminatorio);
                System.out.println("CRIANDO BLOCO "+numBolocoEliminatorio);
                System.out.println(blocosElimitario);
                ;
                numParConfronto = 0;
            }
        }
        if(j % 2 == 0){
            listParesConfronto.add(paresConfronto);
            numParConfronto++;
            paresConfronto = new ParesConfronto(0, numParConfronto);
        }
        
    }
    
    
    
    for(BlocoEliminatorio bc : blocosElimitario){
        for(Confronto c: bc.getConfrontos()){
            ConfrontoModalidadeColetiva cmc = (ConfrontoModalidadeColetiva) c;
            System.out.println("Confronto: "+cmc.getConfrontoRodada());
            System.out.println("Par confronto:"+cmc.getParesConfronto().getNumParConfrontoRodada());
            System.out.println("Bloco elimatório: "+bc.getEtapa());
            System.out.println("");
        }
    }

    
    }
    
}
