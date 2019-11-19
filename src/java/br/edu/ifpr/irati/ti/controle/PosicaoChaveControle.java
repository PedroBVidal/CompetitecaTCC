
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.PosicaoChave;


public class PosicaoChaveControle {
    
    Dao<PosicaoChave> posicaoChaveGenericDAO = new GenericDAO<>(PosicaoChave.class);
    
    public void salvar(PosicaoChave p){
        posicaoChaveGenericDAO.salvar(p);
    }
    
    public void alterar(PosicaoChave p){
        posicaoChaveGenericDAO.alterar(p);
    }
    
    public void excluir(PosicaoChave p){
        posicaoChaveGenericDAO.excluir(p);
    }
    
    public PosicaoChave buscarPorId(int id){
        return posicaoChaveGenericDAO.buscarPorId(id);
    }
    
    public void fecharSessaoDAOGeneric(){
        posicaoChaveGenericDAO.fecharSessao();
    }
    
}
