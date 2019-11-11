
package algoritmoGerarChaveamento;

import br.edu.ifpr.irati.ti.controle.BlocoEliminatorioControle;
import br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle;
import br.edu.ifpr.irati.ti.controle.ParesConfrontoControle;
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
    listParesConfronto.add(paresConfronto);
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
                
                /*
                confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                confrontoModalidadeColetiva.setConfrontoRodada(2);
                confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                confrontos.add(confrontoModalidadeColetiva);
                blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
                */
                listParesConfronto.add(paresConfronto);
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
                
                numParConfronto = 0;
            }
        }
        if(j % 2 == 0){
            
            numParConfronto++;
            paresConfronto = new ParesConfronto(0, numParConfronto);
            listParesConfronto.add(paresConfronto);
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
    // INÍCIO 
    numParConfronto = 1;
    paresConfronto.setNumParConfrontoRodada(numParConfronto);
    listParesConfronto.add(paresConfronto);
    boolean primeiraIteracao = true;
    boolean finalizarWhile = false;
    BlocoEliminatorio blocoParametro = blocosElimitario.get(1);
    BlocoEliminatorio blocoParametroRepescagem = new BlocoEliminatorio();
    System.out.println("Etapa bloco eliminatório parâmetro: "+blocoEliminatorio.getEtapa());
    System.out.println("N confrontos bloco eliminatório parâmetro: "+blocoEliminatorio.getConfrontos().size());
    
    while(finalizarWhile == false){
        System.out.println("WHILE");
        if(primeiraIteracao){
            System.out.println("Primeira iteração");
            int tamanhoBloco = blocosElimitario.get(0).getConfrontos().size();
            for(int k = 1; k <= (tamanhoBloco/2); k++){
                ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                confrontoModalidadeColetiva.setConfrontoRodada(k);
                confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                confrontos.add(confrontoModalidadeColetiva);
                blocoParametroRepescagem.adicionarConfronto(confrontoModalidadeColetiva);
                if(k % 2 == 0){
                    numParConfronto++;
                    paresConfronto = new ParesConfronto(0, numParConfronto);
                    listParesConfronto.add(paresConfronto);
                }

            }
            blocoParametroRepescagem.setEtapa(1);
            blocoParametroRepescagem.setAceitaNovosRepescados(true);
            blocoParametroRepescagem.setBlocoRepescagem(true);
            primeiraIteracao = false;
            blocosElimitario.add(blocoParametroRepescagem);
            numParConfronto = 1;

            System.out.println("Bloco parametro repescagem"+blocoParametroRepescagem.getEtapa());
            System.out.println("Num confrontos: "+blocoParametroRepescagem.getConfrontos().size());
        }
        else{
            // Compara se os tamanhos dos blocos parâmetros são iguais ou não
            int tamanhoBlocoParametro = blocoParametro.getConfrontos().size();
            int tamanhoBlocoRepescagemParametro = blocoParametroRepescagem.getConfrontos().size();
            paresConfronto.setNumParConfrontoRodada(numParConfronto);
            
            if(tamanhoBlocoParametro == tamanhoBlocoRepescagemParametro){
                System.out.println("ETAPA 1");
                BlocoEliminatorio bER = new BlocoEliminatorio();
                bER.setEtapa(blocoParametroRepescagem.getEtapa() + 1);
                for(int k = 1; k <= tamanhoBlocoParametro; k++){
                    ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    confrontoModalidadeColetiva.setConfrontoRodada(k);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    confrontos.add(confrontoModalidadeColetiva);
                    bER.adicionarConfronto(confrontoModalidadeColetiva);
                    
                    if(k % 2 == 0){
                    numParConfronto++;
                    paresConfronto = new ParesConfronto(0, numParConfronto);
                    listParesConfronto.add(paresConfronto);
                    }
                }
                bER.setAceitaNovosRepescados(true);
                bER.setBlocoRepescagem(true);
                blocosElimitario.add(bER);
                blocoParametroRepescagem = bER;
                numParConfronto = 1;
                // Seleciona um novo bloco elimitario como parâmetro
                for(BlocoEliminatorio b : blocosElimitario){
                    if(b.getEtapa() == (blocoParametro.getEtapa()+1)){
                        blocoParametro = b;
                        break;
                    }
                }
                if(blocoParametroRepescagem.getConfrontos().size() == 1){
                    // CONFRONTO FINAL
                    System.out.println("Confronto final");
                    BlocoEliminatorio bEF = new BlocoEliminatorio();
                    ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    paresConfronto = new ParesConfronto(0, 1);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    bEF.setEtapa(blocoParametro.getEtapa() +1);
                    bEF.adicionarConfronto(confrontoModalidadeColetiva);
                    blocosElimitario.add(bEF);
                    finalizarWhile = true;
                }
                
            }
            else if(tamanhoBlocoParametro != tamanhoBlocoRepescagemParametro){
                System.out.println("ETAPA 2");
                BlocoEliminatorio bER = new BlocoEliminatorio();
                bER.setEtapa(blocoParametroRepescagem.getEtapa() + 1);
                for(int k = 1; k <= (tamanhoBlocoRepescagemParametro/2); k++){
                    ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    confrontoModalidadeColetiva.setConfrontoRodada(k);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    confrontos.add(confrontoModalidadeColetiva);
                    bER.adicionarConfronto(confrontoModalidadeColetiva);
                    
                    if(k % 2 == 0){
                    numParConfronto++;
                    paresConfronto = new ParesConfronto(0, numParConfronto);
                    listParesConfronto.add(paresConfronto);
                    }
                }
                bER.setAceitaNovosRepescados(false);
                bER.setBlocoRepescagem(true);
                blocosElimitario.add(bER);
                blocoParametroRepescagem = bER;
                numParConfronto = 1;
                // Muda o blocoRepescagem tido como parâmetro  
                
            }
            
            
        }
        
    }
    //FIM
    
                System.out.println("Tamanho sistema comum: "+blocosElimitario.size());
    int cont = 0;
    for(BlocoEliminatorio bE : blocosElimitario){
        System.out.println("ETAPA BLOCO ELIMINATORIO REPESCAGEM: "+bE.getEtapa());
        //System.out.println("ACEITA NOVOS REPESCADOS?"+ bE.isAceitaNovosRepescados());
        for(Confronto c: bE.getConfrontos()){
            ConfrontoModalidadeColetiva cmc = (ConfrontoModalidadeColetiva) c;
            System.out.println("Confronto rodada"+ cmc.getConfrontoRodada());
            System.out.println("Par confronto pertencente: "+ cmc.getParesConfronto().getNumParConfrontoRodada());
            cont++;

        }
    }
    
                System.out.println(cont);
    
    
    
        /*
        ParesConfrontoControle pControle = new ParesConfrontoControle();
        ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
        BlocoEliminatorioControle blocoEliminatorioControle = new BlocoEliminatorioControle();
        System.out.println("Tamanho pares confronto"+ listParesConfronto.size());
        System.out.println("Tamanho confrontos"+ confrontos.size());
        */
      

    
    
    
    System.exit(0);
    }
    
}
