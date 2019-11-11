/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.CompeticaoModalidadeColetivaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.EquipeCompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import br.edu.ifpr.irati.ti.modelo.ParesConfronto;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaControle {

    Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAOGeneric = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
    CompeticaoModalidadeColetivaDAO competicaoModalidadeColetivaDAO = new CompeticaoModalidadeColetivaDAO();
    EquipeCompeticaoDAO equipeCompeticaoDAO = new EquipeCompeticaoDAO();

    public void salvar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        competicaoModalidadeColetivaDAOGeneric.salvar(competicaoModalidadeColetiva);
    }

    public CompeticaoModalidadeColetiva buscarPorId(int id) {
        return competicaoModalidadeColetivaDAOGeneric.buscarPorId(id);
    }

    public void alterar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        competicaoModalidadeColetivaDAOGeneric.alterar(competicaoModalidadeColetiva);
    }

    public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculasModalidade(int idModalidadeColetiva) {
        return competicaoModalidadeColetivaDAO.buscarCompeticoesColetivasVinculadasModalidadeColetiva(idModalidadeColetiva);
    }

    public void fecharSessaoDAOGeneric() {
        competicaoModalidadeColetivaDAOGeneric.fecharSessao();
    }

    public void fechaarSessaoDAOEspecifico() {
        competicaoModalidadeColetivaDAO.fecharSessao();
    }

    public boolean sessaoDAOGenericEstaAberta() {
        return competicaoModalidadeColetivaDAOGeneric.getSessao().isOpen();
    }

    public List<EquipeCompeticao> ordenarEquipesCompeticao(String desempate1, String desempate2, int idCompeticaoColetiva) {
        List<EquipeCompeticao> equipesOrdenadas = equipeCompeticaoDAO.ordenarEquipesCompeticao(desempate1, desempate2, idCompeticaoColetiva);
        Collections.reverse(equipesOrdenadas);
        return equipesOrdenadas;
    }

    public void gerarConfrontosSistemaTodosContraTodos(CompeticaoModalidadeColetiva cmc) {

        List<Confronto> confrontosModalidadesColetivas = new ArrayList<>();
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

        int numeroEquipes = equipesCompeticao.size();
        System.out.println("Número de equipes: " + numeroEquipes);
        int i = 0, j = 1, z = 1;

        while (i < numeroEquipes) {
            System.out.println("I: " + i);
            while (z <= (numeroEquipes - (i + 1))) {
                System.out.println("J: " + j);
                EquipeCompeticao e1 = equipesCompeticao.get(i);
                EquipeCompeticao e2 = equipesCompeticao.get(j);

                List<EquipeCompeticao> equipesConfrontantes = new ArrayList<>();
                equipesConfrontantes.add(e1);
                equipesConfrontantes.add(e2);
                ConfrontoModalidadeColetiva confrontoColetivo = new ConfrontoModalidadeColetiva(equipesConfrontantes, cmc.getModalidadeColetiva());
                confrontosModalidadesColetivas.add(confrontoColetivo);
                j++;
                z++;
            }
            i++;
            j = i + 1;
            z = 1;
        }
        int cont = 1;
        for (Confronto confronmc : confrontosModalidadesColetivas) {

            confrontoColetivoControle.salvar((ConfrontoModalidadeColetiva) confronmc);

            cont++;
        }
        cmc.setJogosEmAndamento(true);
        cmc.setConfrontos(confrontosModalidadesColetivas);
        cmcc.alterar(cmc);

    }

    public CompeticaoModalidadeColetiva zerarPontosEquipesCompeticao(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {

        for (EquipeCompeticao equipeCompeticao : competicaoModalidadeColetiva.getEquipesCompeticao()) {
            equipeCompeticao.setAdversariosQueAEquipeVenceu(new ArrayList());
            equipeCompeticao.setAdversariosQueAEquipeEmpatou(new ArrayList());
            equipeCompeticao.setAdversariosQueAEquipePerdeu(new ArrayList());
            equipeCompeticao.setPontos(0);
            equipeCompeticao.setDerrotas(0);
            equipeCompeticao.setEmpates(0);
            equipeCompeticao.setVitorias(0);
            equipeCompeticao.setJogos(0);
            equipeCompeticao.setPontosMarcados(0);
            equipeCompeticao.setPontosSofridos(0);
            equipeCompeticao.setSaldoDePontos(0);
        }
        return competicaoModalidadeColetiva;

    }

    public void gerarConfrontosSistemaEliminatorio(CompeticaoModalidadeColetiva cmc, boolean repescagem) {
        int numeroDeConfrontosColetivos = (gerarTamanhoDoSistemaEliminatorio(cmc.getEquipesCompeticao().size()) / 2);
        int numBolocoEliminatorio = 1;
        int numParConfronto = 1;
        List<ConfrontoModalidadeColetiva> confrontos = new ArrayList();
        List<ParesConfronto> listParesConfronto = new ArrayList();
        ParesConfronto paresConfronto = new ParesConfronto(0, numParConfronto);
        listParesConfronto.add(paresConfronto);
        BlocoEliminatorio blocoEliminatorio = new BlocoEliminatorio();
        blocoEliminatorio.setEtapa(numBolocoEliminatorio);
        List<BlocoEliminatorio> blocosElimitorio = new ArrayList();
        blocosElimitorio.add(blocoEliminatorio);

        for (int j = 1; j <= numeroDeConfrontosColetivos; j++) {
            // Instancia um confronto
            ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
            confrontoModalidadeColetiva.setConfrontoRodada(j);
            confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
            // Vincula o confronto na lista
            confrontos.add(confrontoModalidadeColetiva);
            blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);

            if (j == numeroDeConfrontosColetivos) {
                if ((numeroDeConfrontosColetivos / 2) == 1) {
                    numBolocoEliminatorio++;
                    blocoEliminatorio = new BlocoEliminatorio();
                    blocoEliminatorio.setEtapa(numBolocoEliminatorio);

                    paresConfronto = new ParesConfronto(0, 1);
                    
                    confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    confrontoModalidadeColetiva.setConfrontoRodada(1);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    confrontos.add(confrontoModalidadeColetiva);
                    blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
                    // Instancia o confronto coletivo final e disputa pelo 3 e 4 lugar.
                    if(repescagem == false){
                    confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    confrontoModalidadeColetiva.setConfrontoRodada(2);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    confrontos.add(confrontoModalidadeColetiva);
                    blocoEliminatorio.adicionarConfronto(confrontoModalidadeColetiva);
                    }
                    listParesConfronto.add(paresConfronto);
                    blocosElimitorio.add(blocoEliminatorio);
                    break;
                } else {
                    numeroDeConfrontosColetivos = numeroDeConfrontosColetivos / 2;
                    j = 0;
                    numBolocoEliminatorio++;
                    blocoEliminatorio = new BlocoEliminatorio();
                    blocoEliminatorio.setEtapa(numBolocoEliminatorio);
                    blocosElimitorio.add(blocoEliminatorio);

                    numParConfronto = 0;
                }
            }
            if (j % 2 == 0) {
                numParConfronto++;
                paresConfronto = new ParesConfronto(0, numParConfronto);
                listParesConfronto.add(paresConfronto);
            }

        }

        if (repescagem == true) {
        numParConfronto = 1;
        paresConfronto.setNumParConfrontoRodada(numParConfronto);
        listParesConfronto.add(paresConfronto);
        boolean primeiraIteracao = true;
        boolean finalizarWhile = false;
        BlocoEliminatorio blocoParametro = blocosElimitorio.get(1);
        BlocoEliminatorio blocoParametroRepescagem = new BlocoEliminatorio();
        System.out.println("Etapa bloco eliminatório parâmetro: "+blocoEliminatorio.getEtapa());
         System.out.println("N confrontos bloco eliminatório parâmetro: "+blocoEliminatorio.getConfrontos().size());
        
    while(finalizarWhile == false){
        
        System.out.println("WHILE");
        if(primeiraIteracao){
            System.out.println("Primeira iteração");
            int tamanhoBloco = blocosElimitorio.get(0).getConfrontos().size();
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
            blocosElimitorio.add(blocoParametroRepescagem);
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
                blocosElimitorio.add(bER);
                blocoParametroRepescagem = bER;
                numParConfronto = 1;
                // Seleciona um novo bloco elimitario como parâmetro
                for(BlocoEliminatorio b : blocosElimitorio){
                    if(b.getEtapa() == (blocoParametro.getEtapa()+1)){
                        blocoParametro = b;
                        break;
                    }
                }
                if(blocoParametroRepescagem.getConfrontos().size() == 1){
                    // CONFRONTO FINAL
                    System.out.println("CONFRONTO FINAL");
                    BlocoEliminatorio bEF = new BlocoEliminatorio();
                    ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva();
                    paresConfronto = new ParesConfronto(0, 1);
                    confrontoModalidadeColetiva.setParesConfronto(paresConfronto);
                    confrontos.add(confrontoModalidadeColetiva);
                    bEF.setEtapa(blocoParametro.getEtapa());
                    bEF.adicionarConfronto(confrontoModalidadeColetiva);
                    bEF.setBlocoRepescagem(false);
                    bEF.setAceitaNovosRepescados(true);
                    blocosElimitorio.add(bEF);
                    listParesConfronto.add(paresConfronto);
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
                blocosElimitorio.add(bER);
                blocoParametroRepescagem = bER;
                numParConfronto = 1;
                // Muda o blocoRepescagem tido como parâmetro  
                
            }
            
            
        }
        
    }

        }
        System.out.println("N confrontos a serem salvos: "+confrontos.size());
        System.out.println("Blocos eliminatorio: "+ blocosElimitorio.size());
        // persiste os dados no banco
        persistirGerarSistemaEliminatorio(cmc, confrontos, listParesConfronto, blocosElimitorio);

    }

    // Verifica o tamanho do sistema de chaves de acordo com um dado número de equipes
    private int gerarTamanhoDoSistemaEliminatorio(int numeroEquipes) {
        boolean i = true;
        int potenciaDe2Anterior = 2;
        int potenciaDe2Posterior = 4;

        while (i == true) {
            if (numeroEquipes <= potenciaDe2Posterior) {
                break;
            }
            if (numeroEquipes >= potenciaDe2Posterior) {
                potenciaDe2Anterior = potenciaDe2Anterior * 2;
                potenciaDe2Posterior = potenciaDe2Posterior * 2;
            }
        }
        return potenciaDe2Posterior;
    }

    private void persistirGerarSistemaEliminatorio(CompeticaoModalidadeColetiva cmc, List<ConfrontoModalidadeColetiva> confrontos, List<ParesConfronto> paresConfrontos, List<BlocoEliminatorio> blocosEliminatorios) {

        ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
        ParesConfrontoControle paresConfrontoControle = new ParesConfrontoControle();
        BlocoEliminatorioControle blocoEliminatorioControle = new BlocoEliminatorioControle();
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

        for (ParesConfronto p : paresConfrontos) {
            paresConfrontoControle.salvar(p);
        }
        System.out.println("PARES CONFRONTO FINALIZADO");
        for (ConfrontoModalidadeColetiva c : confrontos) {
            confrontoModalidadeColetivaControle.salvar(c);
        }
        System.out.println("CONFRONTO MOD COLETIVA FINALIZADO");
        for (BlocoEliminatorio bE : blocosEliminatorios) {
            blocoEliminatorioControle.salvar(bE);
        }
        System.out.println("BLOCO ELIMINATORIO FINALIZADO");
        confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
        paresConfrontoControle.fecharSessaoDAOGeneric();
        blocoEliminatorioControle.fecharSessaoDAOGeneric();

        cmc.setBlocosEliminatorios(blocosEliminatorios);
        cmcc.alterar(cmc);

    }

}
