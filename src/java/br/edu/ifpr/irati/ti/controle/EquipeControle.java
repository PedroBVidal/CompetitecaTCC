/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.EquipeDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import java.util.List;

/**
 *
 * @author user
 */
public class EquipeControle {
    Dao<Equipe> eqpd = new GenericDAO<>(Equipe.class);
    EquipeDAO equipeDAO = new EquipeDAO();
    
    
    public List<Equipe> buscarTodasEquipe(){
        return eqpd.buscarTodos(Equipe.class);
    }
    public Equipe buscarPorId(int id){
        return equipeDAO.buscarPorId(id);
    }
    public void criarEquipe(Equipe equipe){
        
        eqpd.salvar(equipe);
    }
    public void alterarEquipe(Equipe equipe){
        eqpd.alterar(equipe);
    }
    public void droparEquipe(Equipe equipe){
        eqpd.excluir(equipe);
    }
    
    public boolean sessaoEstaAbertaDAOGeneric() {
        return eqpd.getSessao().isOpen();
    }
    
    public boolean sessaoEstaAbertaDAOEspecifico(){
        return equipeDAO.getSessao().isOpen();
    }
    
    public void fecharSessaoDAOGeneric(){
        eqpd.fecharSessao();
    }
    
    public void fecharSessaoDAOEspecifico(){
        equipeDAO.fecharSessao();
    }
    public List<Equipe> buscarEquipesAbertasCmc(int idCmc){
        return equipeDAO.buscarEquipesAbertasACmc(idCmc);
    }
        public List<Equipe> buscarEquipesAbertasCmc2(int idCmc){
        return equipeDAO.buscarEquipesAbertasACmc2(idCmc);
    }
    public void abrirSessaoDAOEspecifico(){
        equipeDAO.abrirSessao();
    }
    
    
    
}
