/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ParesConfronto;


public class ParesConfrontoControle {
    
    Dao<ParesConfronto> paresConfrontoGenericDAO = new GenericDAO<>(ParesConfronto.class);
    
    public void salvar(ParesConfronto paresConfronto){
       paresConfrontoGenericDAO.salvar(paresConfronto);
    }
    
    public void fecharSessaoDAOGeneric(){
        paresConfrontoGenericDAO.fecharSessao();
    }
    
    
}
