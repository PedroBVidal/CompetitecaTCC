/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.CompeticaoModalidadeColetivaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaControle {
    
    Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAOGeneric = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
    CompeticaoModalidadeColetivaDAO competicaoModalidadeColetivaDAO = new CompeticaoModalidadeColetivaDAO();
    
    
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

}
