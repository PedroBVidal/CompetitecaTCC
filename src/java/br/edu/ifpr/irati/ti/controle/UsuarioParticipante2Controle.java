
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import java.util.List;


public class UsuarioParticipante2Controle {

    Dao<UsuarioParticipante2> usuarioParticipanteDAO = new GenericDAO<>(UsuarioParticipante2.class);

    public UsuarioParticipante2 buscarLogin(String email, String senha) throws Exception {

        UsuarioParticipante2 usuarioParticipante = usuarioParticipanteDAO.buscarLogin(email, senha);

        if (usuarioParticipante == null) {
            throw new Exception("Acesso Negado. Tente novamente");
        } else {
            return usuarioParticipante;
        }

    }

    public void atualizarCad(UsuarioParticipante2 user) {
        usuarioParticipanteDAO.alterar(user);
    }
    public void criar(UsuarioParticipante2 user) {
        usuarioParticipanteDAO.salvar(user);
    }
    
    public UsuarioParticipante2 buscarPorId(int id){
        return usuarioParticipanteDAO.buscarPorId(id);
    }
    
    public List<Atleta> buscarAtletasVincualdadosAoUsuarioParticipante(UsuarioParticipante2 usuarioParticipante2){
        
        UsuarioParticipante2 up = usuarioParticipanteDAO.buscarPorId(usuarioParticipante2.getIdUsuario());
        return up.getAtletas();       
    }
    
    

}
