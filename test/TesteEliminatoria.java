
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author olive
 */
public class TesteEliminatoria {
    public static void main(String[] args) {
        Scanner leitura = new Scanner(System.in);
        int num_comp = leitura.nextInt();
        List<List<String>>partidas = new ArrayList<>();
        List<String> comp = new ArrayList<>();
        for (int i = 0; i <= num_comp; i++) {
            comp.add(i+"*");
        }
        for (int i = 0; i < comp.size(); i+=2) {
            //List<String> partida = new ArrayList<>();
           // partida.add(comp.get(i));
            System.out.println(comp.get(i));
            if (i < (comp.size()-1)) {
                System.out.println(comp.get(i+1));    
            }
            System.out.println("------------------------------------");
        }
    }
}
