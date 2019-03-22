/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class UsuarioParticipanteControle {
    Dao<UsuarioParticipante> uspd = new GenericDAO<>(UsuarioParticipante.class);
    public void criar(UsuarioParticipante up){
        uspd.salvar(up);
    }
    public List<UsuarioParticipante> buscarTodos(){
        return uspd.buscarTodos(UsuarioParticipante.class);
    }
    public UsuarioParticipante buscarPorId(int id){
        return uspd.buscarPorId(id);
    }
    public UsuarioParticipante buscarLogin(String email, String senha) throws Exception{
        UsuarioParticipante uspdc = uspd.buscarLogin(email, senha);
        if (uspdc == null) {
            throw new Exception("Acesso Negado. Tente novamente");
        }else{
        return uspdc;    
        }
        
        
    }
    public void atualizarCad(UsuarioParticipante user){
        uspd.alterar(user);
    }
}
