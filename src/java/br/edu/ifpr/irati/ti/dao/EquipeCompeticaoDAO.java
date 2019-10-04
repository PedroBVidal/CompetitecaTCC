/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class EquipeCompeticaoDAO extends Sessao{
    

    
    
    public List<EquipeCompeticao> ordenarEquipesCompeticao(String desempatePrimario, String desempateSecundario, int idCompeticaoColetiva){
        
        String parametro1 = "", parametro2 = "";
        
        if(desempatePrimario.equals("Saldo de pontos")){
            parametro1 = "saldoDePontos";
            if(desempateSecundario.equals("Pontos marcados")){
                parametro2 = "pontosMarcados";
            }
            else if(desempateSecundario.equals("Pontos sofridos")){
                parametro2 = "pontosSofridos";
            }
            else if(desempateSecundario.equals("Vitórias")){
                parametro2 = "vitorias";
            }
        }
        else if(desempatePrimario.equals("Pontos sofridos")){
            parametro1 = "pontosSofridos";
            if(desempateSecundario.equals("Pontos marcados")){
                parametro2 = "pontosMarcados";
            }
            else if(desempateSecundario.equals("Saldo de pontos")){
                parametro2 = "saldoDePontos";
            }
            else if(desempateSecundario.equals("Vitórias")){
                parametro2 = "vitorias";
            }
        }
        else if(desempatePrimario.equals("Pontos marcados")){
            parametro1 = "pontosMarcados";
            if(desempateSecundario.equals("Saldo de pontos")){
                parametro2 = "saldoDePontos";
            }
            else if(desempateSecundario.equals("Pontos sofridos")){
                parametro2 = "pontosSofridos";
            }
            else if(desempateSecundario.equals("Vitórias")){
                parametro2 = "vitorias";
            }
        }
        else if(desempatePrimario.equals("Vitorias")){
            parametro1 = "vitorias";
            if(desempateSecundario.equals("Pontos marcados")){
                parametro2 = "pontosMarcados";
            }
            else if(desempateSecundario.equals("Pontos sofridos")){
                parametro2 = "pontosSofridos";
            }
            else if(desempateSecundario.equals("Saldo de pontos")){
                parametro2 = "saldoDePontos";
            }
        }

        abrirSessao();
        sessao.beginTransaction();
        String hql = "select cmc.equipesCompeticao from competicaomodalidadecoletiva as cmc WHERE cmc.idCompeticaoModalidade ="+idCompeticaoColetiva+" ORDER BY pontos,"+parametro1+","+parametro2+""; 
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
        
        
    }

    
    
}
