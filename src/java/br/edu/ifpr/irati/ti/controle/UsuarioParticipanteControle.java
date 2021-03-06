/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.UsuarioAdministradorDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.Usuario;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.ifpr.irati.ti.util.GerarCodigoAcessoPrivado;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class UsuarioParticipanteControle {
    
    Dao<Usuario> genericUsuarioDAO = new GenericDAO<>(Usuario.class);
    Dao<UsuarioParticipante> genericUsuarioAdministradorDAO = new GenericDAO<>(UsuarioParticipante.class);
    UsuarioAdministradorDAO usuarioAdministradorDAO = new UsuarioAdministradorDAO();
    GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
    public void criar(UsuarioParticipante up) throws Exception{
        try{
        genericUsuarioAdministradorDAO.salvar(up);
        }catch(Exception e){
            throw new Exception("O Email "+up.getEmail()+" ja existe em nossa base de dado. Tente novamente");
        }
    }
    public List<UsuarioParticipante> buscarTodos(){
        return genericUsuarioAdministradorDAO.buscarTodos(UsuarioParticipante.class);
    }
    public UsuarioParticipante buscarPorId(int id){
        UsuarioParticipante usuarioParticipante =  usuarioAdministradorDAO.buscarPorId(id);
        return usuarioParticipante;
    }
    
    public UsuarioParticipante buscarLogin(String email, String senha) throws Exception{
        
        UsuarioParticipante usuarioParticipante = genericUsuarioAdministradorDAO.buscarLogin(email, gcap.criptografar(senha));
        if (usuarioParticipante == null) {
            throw new Exception("Acesso Negado. Tente novamente");
        }else{
        return usuarioParticipante;    
        }
        
        
    }
    public UsuarioParticipante recuperaSenhaByEmail(String email) throws Exception{
        UsuarioParticipante up = genericUsuarioAdministradorDAO.buscarPorEmail(email);
        if (up == null) {
            throw new Exception("Email inexistente em nossa base de dados de administradores,  verifique se o tipo ou o email estão corretos.");
        }else{
            return up;
        }
    }
    public void atualizarCad(UsuarioParticipante user){
        genericUsuarioAdministradorDAO.alterar(user);
    }
    
    public void fecharSessaoDAOEspecifico(){
        usuarioAdministradorDAO.fecharSessao();
    }
    
    public void fecharSessaoDAOGeneric(){
        genericUsuarioAdministradorDAO.fecharSessao();
    }
    
    public void abrirSessaoDAOGeneric(){
        genericUsuarioAdministradorDAO.abrirSessao();
    }
    
    public void flush(){
        genericUsuarioAdministradorDAO.flush();
    }
    
    public boolean isDirty(){
        return genericUsuarioAdministradorDAO.isDirty();
    }
    
    public List<Competicao> buscarCompeticoesVinculadasAoUsuarioParticipante(int idUsuario){
        return usuarioAdministradorDAO.buscarPorIdConfrontos(idUsuario);
    }
}
