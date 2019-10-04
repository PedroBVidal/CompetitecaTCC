
import br.edu.ifpr.irati.ti.controle.ParesConfrontoControle;
import br.edu.ifpr.irati.ti.modelo.ParesConfronto;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Usuário
 */
public class testeSalvarParConfronto {
    
    public static void main(String[] args) {
        
    
    ParesConfrontoControle paresConfrontoControle = new ParesConfrontoControle();
    
    ParesConfronto p = new ParesConfronto(0, 21);
    
    paresConfrontoControle.salvar(p);
    System.exit(0);
    }
}
