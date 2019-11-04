
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import br.ifpr.irati.ti.util.GerarCodigoAcessoPrivado;
import java.util.List;


public class UsuarioParticipante2Controle {

    Dao<UsuarioParticipante2> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante2.class);
    GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
    
    public UsuarioParticipante2 buscarLogin(String email, String senha) throws Exception {

        UsuarioParticipante2 usuarioParticipante = usuarioParticipanteDAO.buscarLogin(email, gcap.criptografar(senha));

        if (usuarioParticipante == null) {
            throw new Exception("Acesso Negado. Tente novamente");
        } else {
            return usuarioParticipante;
        }

    }

    public void atualizarCad(UsuarioParticipante2 user) {
        usuarioParticipanteDAO.alterar(user);
    }
    public void criar(UsuarioParticipante2 user) throws Exception {
        try{
        usuarioParticipanteDAO.salvar(user);
        }catch(Exception e){
            throw new Exception("O Email "+user.getEmail()+" ja existe. Tente novamente");
        }
    }
    public UsuarioParticipante2 recuperaSenhaByEmail(String email) throws Exception{
        UsuarioParticipante2 up = usuarioParticipanteDAO.buscarPorEmail(email);
        if (up == null) {
            throw new Exception("Email inexistente em nossa base de dados de Participantes, verifique se o tipo de usuário ou o email estão corretos.");
        }else{
            return up;
        }
    }
    public UsuarioParticipante2 buscarPorId(int id){
        return usuarioParticipanteDAO.buscarPorId(id);
    }
    
    public List<UsuarioParticipante2> buscarTodos(){
        return usuarioParticipanteDAO.buscarTodos(UsuarioParticipante2.class);
    }
    
    public void fecharSessaoDAOGeneric(){
        usuarioParticipanteDAO.fecharSessao();
    }
    
    public boolean sessaoEstaAberta(){
        return usuarioParticipanteDAO.getSessao().isOpen();
    }
    
    public void abrirSessaoDAOGeneric(){
        usuarioParticipanteDAO.abrirSessao();
    }
    

    
    

}
