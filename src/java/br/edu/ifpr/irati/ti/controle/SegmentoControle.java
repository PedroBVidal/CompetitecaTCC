/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.SegmentoDAO;
import br.edu.ifpr.irati.ti.modelo.Segmento;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class SegmentoControle {
    
    SegmentoDAO segmentoDAO = new SegmentoDAO();
    
    public List<Segmento> buscarSegmentos(){
        return segmentoDAO.buscarTodos();
    }
    
    public Segmento buscarSegmentoPorId(int id){
        return segmentoDAO.buscarPorId(id);
    }
    
    public boolean sessaoEstaAberta(){
        return segmentoDAO.getSessao().isOpen();
    }
    
    public void fecharSessao(){
        segmentoDAO.fecharSessao();
    }
}
