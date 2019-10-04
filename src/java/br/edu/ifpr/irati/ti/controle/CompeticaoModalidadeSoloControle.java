/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.AtletaCompeticao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeSolo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeSoloControle {

    Dao<CompeticaoModalidadeSolo> competicaoModalidadeSoloDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);

    public void salvar(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        competicaoModalidadeSoloDAO.salvar(competicaoModalidadeSolo);
    }

    public CompeticaoModalidadeSolo buscarPorId(int id) {
        return competicaoModalidadeSoloDAO.buscarPorId(id);
    }

    public void alterar(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        competicaoModalidadeSoloDAO.alterar(competicaoModalidadeSolo);
    }

    public void fecharSessaoDAOGeneric() {
        competicaoModalidadeSoloDAO.fecharSessao();
    }

    public void gerarPartidaTodosContraTodos(CompeticaoModalidadeSolo cms) {
        
        List<AtletaCompeticao> atcl = cms.getAtletasCompeticao();
        int tamanho = atcl.size();
        List<Confronto> lcms = new ArrayList<>();
       Dao<ConfrontoModalidadeSolo> dcfms = new GenericDAO<>(ConfrontoModalidadeSolo.class);
        //Contador do número do «bloco»
        int block = 0;
        System.out.println("Início dos Processos");
        for (AtletaCompeticao atc : atcl) {

            for (int i = block; i < tamanho; i++) {

                if (atcl.get(i).getIdAtletaCompeticao() != atc.getIdAtletaCompeticao()) {
                    List<AtletaCompeticao> temp = new ArrayList<>();
                    temp.add(atc);
                    temp.add(atcl.get(i));

                    ConfrontoModalidadeSolo cfms = new ConfrontoModalidadeSolo(temp, cms.getModalidadeSolo());
                    dcfms.salvar(cfms);
                    dcfms.fecharSessao();
                    lcms.add(cfms);
                }

            }
            block++;
            
        }
        cms.setJogosEmAndamento(true);
        cms.setConfrontos(lcms);
        competicaoModalidadeSoloDAO.alterar(cms);
        competicaoModalidadeSoloDAO.fecharSessao();
    }
    private boolean verificaInteiro (double raiz){
        int numEtapasI;
        try{
            numEtapasI = (int) raiz;
        }catch(Exception e){
            return false;
        }
        return true;
    }
    private int criarEtapas(int numComp){
        return 0;
    }
    public void gerarConfrontosEliminatorias(CompeticaoModalidadeSolo cms){
        int tamanho = cms.getAtletasCompeticao().size();
        boolean isencao = false;
        int i = 0;
        while(i >= 0) {
            if (Math.pow(2,i) == tamanho) {
                isencao = false;
                break;
            }if(Math.pow(2, i) > tamanho){
                isencao = true;
                break;
            }
            i++;
        }
        
        if (isencao == false) {
            int numEtapasI;
            
        }
    }

}
