
import br.edu.ifpr.irati.ti.controle.AtletaControle;
import br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class AdicionarUserParticipantes {
    
    public static void main(String[] args) throws Exception {
        
        UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
        AtletaControle atletaControle = new AtletaControle();
        
        
        UsuarioParticipante2 u1 = new UsuarioParticipante2(0, "joao@gmail.com", "João Bosta", "senha");       
        Atleta a1 = new Atleta(0, new Date(), "090.976.459-05");
        u1.setAtleta(a1);
        a1.setUsuarioParticipante(u1);
        
        atletaControle.criarAtleta(a1);
        usuarioParticipante2Controle.criar(u1);
        
        
        
        
        UsuarioParticipante2 u3 = new UsuarioParticipante2(0, "marina@gmail.com", "Marina", "Marina");       
        Atleta a3 = new Atleta(0, new Date(), "090.976.459-05");
        u3.setAtleta(a3);
        a3.setUsuarioParticipante(u3);
        
        atletaControle.criarAtleta(a3);
        usuarioParticipante2Controle.criar(u3);
        
        UsuarioParticipante2 u4 = new UsuarioParticipante2(0, "ines@gmail.com", "Inês Maria", "senha");       
        Atleta a4 = new Atleta(0, new Date(), "090.976.459-05");
        u4.setAtleta(a4);
        a4.setUsuarioParticipante(u4);
        
        atletaControle.criarAtleta(a4);
        usuarioParticipante2Controle.criar(u4);
        
        UsuarioParticipante2 u5 = new UsuarioParticipante2(0, "denis@gmail.com", "Denis", "Denis");       
        Atleta a5 = new Atleta(0, new Date(), "090.976.459-05");
        u5.setAtleta(a5);
        a5.setUsuarioParticipante(u5);
        
        atletaControle.criarAtleta(a5);
        usuarioParticipante2Controle.criar(u5);
        
        
        UsuarioParticipante2 u6 = new UsuarioParticipante2(0, "pedropopa98@gmail.com", "Pedro V", "pedro");       
        Atleta a6 = new Atleta(0, new Date(), "090.976.459-05");
        u6.setAtleta(a6);
        a6.setUsuarioParticipante(u6);
        
        atletaControle.criarAtleta(a6);
        usuarioParticipante2Controle.criar(u6);
        
        System.exit(0);
    }
    
    
    
    
    
    
}
