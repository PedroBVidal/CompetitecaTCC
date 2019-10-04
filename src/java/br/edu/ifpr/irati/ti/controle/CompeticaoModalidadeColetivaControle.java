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
    
    public void salvar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
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
    
    public List<EquipeCompeticao> ordenarEquipesCompeticao(String desempate1, String desempate2, int idCompeticaoColetiva){
        List<EquipeCompeticao> equipesOrdenadas = equipeCompeticaoDAO.ordenarEquipesCompeticao(desempate1, desempate2,idCompeticaoColetiva);
        Collections.reverse(equipesOrdenadas);
        return equipesOrdenadas;
    }

    public void gerarConfrontosSistemaTodosContraTodos(CompeticaoModalidadeColetiva cmc) {

        List<Confronto> confrontosModalidadesColetivas = new ArrayList<>();
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

        int numeroEquipes = equipesCompeticao.size();
        System.out.println("Número de equipes: "+ numeroEquipes);
        int i = 0, j = 1,z=1;
        
        while(i < numeroEquipes){
            System.out.println("I: "+ i);
            while(z <= (numeroEquipes - (i + 1))){
            System.out.println("J: "+ j);
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
        for(Confronto confronmc : confrontosModalidadesColetivas){
            
            confrontoColetivoControle.salvar((ConfrontoModalidadeColetiva) confronmc);

            cont++;
        }
        cmc.setJogosEmAndamento(true);
        cmc.setConfrontos(confrontosModalidadesColetivas);
        cmcc.alterar(cmc);

    }

    private boolean verificaInteiro(double raiz) {
        int numEtapasI;
       // String raizq = String.valueOf(raiz);
        //System.out.println("Raíz: "+raiz);
        try {
            numEtapasI = (int) raiz;
            System.out.println("numEtapasI");
            return true;
        } catch (Exception e) {
            return false;
            
        }
        
    }
    
    
    public CompeticaoModalidadeColetiva zerarPontosEquipesCompeticao(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        
        
        for(EquipeCompeticao equipeCompeticao : competicaoModalidadeColetiva.getEquipesCompeticao()){
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
    
    
    public void gerarConfrontosSistemaEliminatorio(CompeticaoModalidadeColetiva cmc){
        int numeroDeConfrontosColetivos = (gerarTamanhoDoSistemaEliminatorio(cmc.getEquipesCompeticao().size()) / 2);
        int numBolocoEliminatorio = 1;
        int numParConfronto = 1;
        List<ConfrontoModalidadeColetiva> confrontos = new ArrayList();
        List<ParesConfronto> listParesConfronto = new ArrayList();
        ParesConfronto paresConfronto = new ParesConfronto(0, numParConfronto);
        BlocoEliminatorio blocoEliminatorio = new BlocoEliminatorio();
        blocoEliminatorio.setEtapa(numBolocoEliminatorio);
        List<BlocoEliminatorio> blocosElimitorio = new ArrayList();
        blocosElimitorio.add(blocoEliminatorio);
        
        
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
                // (CASO ESPECÍFICO)Instancia o confronto coletivo final e disputa pelo 3 e 4 lugar.
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
                
                blocosElimitorio.add(blocoEliminatorio);
                break;
            }
            else{
                numeroDeConfrontosColetivos = numeroDeConfrontosColetivos/2;
                j = 0;
                
                numBolocoEliminatorio++;
                blocoEliminatorio = new BlocoEliminatorio();
                blocoEliminatorio.setEtapa(numBolocoEliminatorio);
                blocosElimitorio.add(blocoEliminatorio);                
                numParConfronto = 0;
            }
        }
        if(j % 2 == 0){
            listParesConfronto.add(paresConfronto);
            numParConfronto++;
            paresConfronto = new ParesConfronto(0, numParConfronto);
        }
        
    }
        // persiste os dados no banco
        persistirGerarSistemaEliminatorio(confrontos, listParesConfronto, blocosElimitorio);

    }
    // Verifica o tamanho do sistema de chaves de acordo com um dado número de equipes
    private int gerarTamanhoDoSistemaEliminatorio(int numeroEquipes){  
        boolean i = true;  
        int potenciaDe2Anterior = 2;
        int potenciaDe2Posterior = 4;

        while(i == true){        
            if(numeroEquipes <= potenciaDe2Posterior){
                break;
            }        
            if(numeroEquipes >= potenciaDe2Posterior){
                    potenciaDe2Anterior = potenciaDe2Anterior * 2;
                    potenciaDe2Posterior = potenciaDe2Posterior * 2;
            } 
        }
        return potenciaDe2Posterior;  
    }
    
    
    private void persistirGerarSistemaEliminatorio(List<ConfrontoModalidadeColetiva> confrontos, List<ParesConfronto> paresConfrontos, List<BlocoEliminatorio> blocosEliminatorios){
        
        ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
        ParesConfrontoControle paresConfrontoControle = new ParesConfrontoControle();
        BlocoEliminatorioControle blocoEliminatorioControle = new BlocoEliminatorioControle();
        
        for(ParesConfronto p: paresConfrontos){
            paresConfrontoControle.salvar(p);
        }
        
        for(ConfrontoModalidadeColetiva c: confrontos){
            confrontoModalidadeColetivaControle.salvar(c);
        }
        
        for(BlocoEliminatorio bE : blocosEliminatorios){
            blocoEliminatorioControle.salvar(bE);
        }
    }
    

}
