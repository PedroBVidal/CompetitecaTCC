
import br.edu.ifpr.irati.ti.controle.CompeticaoControle;
import br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gustavo
 */
public class testeDelete {
    public static void main(String[] args) {
        CompeticaoControle cc = new CompeticaoControle();
        UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
        
        UsuarioParticipante up = upc.buscarPorId(1);
        Competicao comp = cc.buscarCompeticaoPorId(1);
        int i = 0;
        for(UsuarioParticipante upa : comp.getAdministradores()){
            System.out.println(upa.getNome());
        }
        
        comp.removerAdministrador(up);
        
        for(UsuarioParticipante upa : comp.getAdministradores()){
            
            System.out.println("int 2: "+upa.getNome());
        }
        
    }
}
