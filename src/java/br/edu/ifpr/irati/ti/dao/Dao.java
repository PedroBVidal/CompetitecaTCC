/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import java.io.Serializable;
import java.util.List;
import org.hibernate.Session;


/**
 *
 * @author valter
 * @param <T>
 */
public interface Dao<T> {

    public T buscarPorId(Serializable id);

    public void salvar(T t);

    public void alterar(T t);
    
    public void excluir(T t);
    
    public List<T> buscarTodos(Class<T> clazz);
    
    public T buscarLogin(String email, String senha);
    
    public T buscarCodigoPrivado(String codigo);
    
    public Session abrirSessao();
    
    public void fecharSessao();
    
    public Session getSessao();
    
    public void setSessao(Session sessao);
    
}
