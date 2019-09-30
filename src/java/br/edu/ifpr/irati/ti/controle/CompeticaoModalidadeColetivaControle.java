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
    
    public CompeticaoModalidadeColetiva buscarPorId(int id){
        return competicaoModalidadeColetivaDAOGeneric.buscarPorId(id);
    }
    
    public void alterar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        competicaoModalidadeColetivaDAOGeneric.alterar(competicaoModalidadeColetiva);
    }
    
    public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculasModalidade(int idModalidadeColetiva){
        return competicaoModalidadeColetivaDAO.buscarCompeticoesColetivasVinculadasModalidadeColetiva(idModalidadeColetiva);
    }
    
    public void fecharSessaoDAOGeneric(){
        competicaoModalidadeColetivaDAOGeneric.fecharSessao();
    }
    
    public void fechaarSessaoDAOEspecifico(){
        competicaoModalidadeColetivaDAO.fecharSessao();
    }
    
    public boolean sessaoDAOGenericEstaAberta(){
        return competicaoModalidadeColetivaDAOGeneric.getSessao().isOpen();
    }
    
    public List<EquipeCompeticao> ordenarEquipesCompeticao(String desempate1, String desempate2, int idCompeticaoColetiva){
        List<EquipeCompeticao> equipesOrdenadas = equipeCompeticaoDAO.ordenarEquipesCompeticao(desempate1, desempate2,idCompeticaoColetiva);
        Collections.reverse(equipesOrdenadas);
        return equipesOrdenadas;
    }

    
    public void gerarConfrontosSistemaTodosContraTodos(CompeticaoModalidadeColetiva cmc){
        
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
    private int criarEtapas(int numComp) {
        int numEtapas;
        double provisorio = Math.sqrt(numComp);
        if (verificaInteiro(provisorio) == true) {
            numEtapas = (int) provisorio;
            return numEtapas;
        } else {
            while (verificaInteiro(provisorio) == false) {
                numComp++;
                provisorio = Math.pow(numComp, 1 / 2);
                System.out.println(numComp);
            }
            numEtapas = (int) provisorio;
            return numEtapas;
        }
    }
    public void gerarConfrontosEliminatorias(CompeticaoModalidadeColetiva cmc) {
        BlocoEliminatorioControle bec = new BlocoEliminatorioControle();
        ConfrontoModalidadeColetivaControle cmcc = new ConfrontoModalidadeColetivaControle();
        int tamanho = cmc.getEquipesCompeticao().size();
        System.out.println("Tamanho: "+tamanho);
        boolean isencao = false;
        int i = 0;
        while (i >= 0) {
            if (Math.pow(2, i) == tamanho) {
                isencao = false;
                break;
            }
            if (Math.pow(2, i) > tamanho) {
                isencao = true;
                break;
            }
            i++;
        }
        if (isencao == false) {
            int numEtapasI = criarEtapas(tamanho);
            int numJogosTot = tamanho - 1;
            int numJogosPrime = tamanho / 2;
            List<BlocoEliminatorio> bes = new ArrayList<>();
            for (int l = 0; l < numEtapasI; l++) {
                System.out.println(numEtapasI+"/"+l);
                List<Confronto> cmcl = new ArrayList<>();
                for (int j = (numJogosPrime-1); j > - 1; j--) {
                    System.out.println("Entrei aqui");
                    if (l == 0) {
                        for (int k = 0; k < tamanho; k += 2) {
                            List<EquipeCompeticao> eqcs = new ArrayList<>();
                            eqcs.add(cmc.getEquipesCompeticao().get(k));
                            eqcs.add(cmc.getEquipesCompeticao().get(k + 1));
                            ConfrontoModalidadeColetiva cmmcc = new ConfrontoModalidadeColetiva();
                            cmmcc.setModalidadeColetiva(cmc.getModalidadeColetiva());
                            cmmcc.setEquipes(eqcs);
                            cmcc.salvar(cmmcc);
                            cmcc.fecharSessaoDAOGeneric();
                            cmcl.add(cmmcc);
                        }
                        break;
                    } else {
                        System.out.println("Amigo estou aqui; amigo ESTOU aqui!!");
                        ConfrontoModalidadeColetiva cmmcc = new ConfrontoModalidadeColetiva();
                        cmmcc.setModalidadeColetiva(cmc.getModalidadeColetiva());
                        cmcc.salvar(cmmcc);
                        cmcc.fecharSessaoDAOGeneric();
                        cmcl.add(cmmcc);
                    }
                }
                BlocoEliminatorio be = new BlocoEliminatorio(l, cmcl);
                bes.add(be);
                bec.salvar(be);
                bec.fecharSessaoDAOGeneric();
                numJogosPrime = numJogosPrime / 2;
            }
            cmc.setBlocosEliminatorios(bes);
            alterar(cmc);
        }
    
    
}

}