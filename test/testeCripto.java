
import br.ifpr.irati.ti.util.GerarCodigoAcessoPrivado;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author gustavo
 */
public class testeCripto {
    public static void main(String[] args) {
        GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
    
        System.out.println(gcap.criptografar("2"));
        System.out.println("C4CA4238A0B923820DCC509A6F75849B");
        System.exit(0);
    
    }
    
    
}
