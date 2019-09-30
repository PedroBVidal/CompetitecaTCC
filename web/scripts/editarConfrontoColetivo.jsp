<%-- 
    Document   : editarConfrontoColetivo
    Created on : 10/08/2019, 00:13:32
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        
     int op = Integer.parseInt(request.getParameter("op"));
     int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
     
     LocalControle localControle = new LocalControle();
     ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
     CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
     EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
     
     SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
     SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");

     // Cadastro de um novo jogo
     if(op == 1){
     

     int idLocal = Integer.parseInt(request.getParameter("localJogoNovoJogo"));
     int idEquipe1 = Integer.parseInt(request.getParameter("selectEquipe1"));
     int idEquipe2 = Integer.parseInt(request.getParameter("selectEquipe2"));
     
     EquipeCompeticao equipe1 = equipeCompeticaoControle.buscarPorId(idEquipe1);
     EquipeCompeticao equipe2 = equipeCompeticaoControle.buscarPorId(idEquipe2);
     List<EquipeCompeticao> equipesCompeticao = new ArrayList();
     ModalidadeColetivaControle modalidadeColetivaControle = new ModalidadeColetivaControle();
     
     CompeticaoModalidadeColetiva cmc = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
     ModalidadeColetiva modalidadeColetiva = modalidadeColetivaControle.buscaPorId(cmc.getModalidadeColetiva().getIdModColetiva());
     modalidadeColetivaControle.fecharSessaoDAOGeneric();
     
     equipesCompeticao.add(equipe1);
     equipesCompeticao.add(equipe2);
     
     String sDataJogo = request.getParameter("dataJogoNovoJogo");
     String sHoraInicio = request.getParameter("horaInicioJogoNovoJogo");
     String sHoraTermino = request.getParameter("horaTerminoJogoNovoJogo");
     
     Date dataJogo = sdfData.parse(sDataJogo);
     Date horaInicio = sdfHora.parse(sHoraInicio);
     Date horaTermino = sdfHora.parse(sHoraTermino);
     
     Local local = localControle.buscaPorId(idLocal);
     localControle.fecharSessaoDAOGeneric();
     
     
     ConfrontoModalidadeColetiva confrontoModalidadeColetiva = new ConfrontoModalidadeColetiva(equipesCompeticao, modalidadeColetiva);
     confrontoModalidadeColetiva.setHoraInicio(horaInicio);
     confrontoModalidadeColetiva.setHoraTermino(horaTermino);
     confrontoModalidadeColetiva.setDataConfronto(dataJogo);
     confrontoModalidadeColetiva.setLocal(local);
     
     confrontoModalidadeColetivaControle.salvar(confrontoModalidadeColetiva);
     
     cmc.adicionarConfronto(confrontoModalidadeColetiva);
     competicaoModalidadeColetivaControle.alterar(cmc);
     
     competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
     }
     
     
     // Alteração de um jogo
     if(op == 2){
    

     int idConfrontoColetivo = Integer.parseInt(request.getParameter("idConfronto"));
     
     int idLocal = Integer.parseInt(request.getParameter("localJogo"+idConfrontoColetivo));
     String sDataJogo = request.getParameter("dataJogo"+idConfrontoColetivo);
     String sHoraInicio = request.getParameter("horaInicioJogo"+idConfrontoColetivo);
     String sHoraTermino = request.getParameter("horaTerminoJogo"+idConfrontoColetivo);
     
     Date dataJogo = sdfData.parse(sDataJogo);
     Date horaInicio = sdfHora.parse(sHoraInicio);
     Date horaTermino = sdfHora.parse(sHoraTermino);
     
     Local local = localControle.buscaPorId(idLocal);
     localControle.fecharSessaoDAOGeneric();
     
     ConfrontoModalidadeColetiva confmc = confrontoModalidadeColetivaControle.buscarPorId(idConfrontoColetivo);
     
     confmc.setHoraInicio(horaInicio);
     confmc.setHoraTermino(horaTermino);
     confmc.setDataConfronto(dataJogo);
     confmc.setLocal(local);
     
     confrontoModalidadeColetivaControle.alterar(confmc);
     // Fecha as sessões abertas durante a transação;
     confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
     }
     
     
     if(op == 3){
         CompeticaoModalidadeColetiva cmc = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
         
         int idConfrontoColetivo = Integer.parseInt(request.getParameter("idConfronto"));
         System.out.println("ID CONFRONTO: " +idConfrontoColetivo);
         
         ConfrontoModalidadeColetiva confrontoModalidadeColetiva = confrontoModalidadeColetivaControle.buscarPorId(idConfrontoColetivo);
         
         for(Confronto c : cmc.getConfrontos()){
             if(c.getIdConfronto() == confrontoModalidadeColetiva.getIdConfronto()){
                 cmc.removerConfronto(c);
                 break;
             }
         }

         competicaoModalidadeColetivaControle.alterar(cmc);
         
         confrontoModalidadeColetiva.removeAllEquipesCompeticao();
         confrontoModalidadeColetivaControle.alterar(confrontoModalidadeColetiva);
         confrontoModalidadeColetivaControle.excluir(confrontoModalidadeColetiva);
         
         //cmc.removerConfronto(confrontoModalidadeColetiva);
         //confrontoModalidadeColetivaControle.excluir(confrontoModalidadeColetiva);
         //competicaoModalidadeColetivaControle.alterar(cmc);
         confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
         competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
         //competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
     }
     
     
     
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">

    <form method="POST" name="formAlterarDadosJogo">
        <input type="hidden" name="id" value="<%=idCompeticao%>">
        <input type="hidden" name="op" value="<%=op%>" id="op">
    </form>
    
</html>
<script>
    window.onload = enviarFormulario();
    function enviarFormulario(){
        alert("Entrei aqui");
        var op = document.getElementById("op").value;
        alert(op);
        if(op === '1'){
            alert("Cadastro!");
            document.forms["formAlterarDadosJogo"].action = "../gerenciarCompModColetiva.jsp?msg=Jogo cadastrado com sucesso.&color=success";
            document.forms["formAlterarDadosJogo"].submit();
        }
        if(op === '2'){
            document.forms["formAlterarDadosJogo"].action = "../gerenciarCompModColetiva.jsp?msg=Dados inseridos com sucesso.&color=success";
            document.forms["formAlterarDadosJogo"].submit();
        }
        if(op === '3'){
            document.forms["formAlterarDadosJogo"].action = "../gerenciarCompModColetiva.jsp?msg=Jogo removido com sucesso.&color=success";
            document.forms["formAlterarDadosJogo"].submit();
        }
    }
</script>