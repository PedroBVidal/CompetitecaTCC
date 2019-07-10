<%-- 
    Document   : inscreverAtletaEmCompeticaoSolo
    Created on : 15/11/2018, 20:41:30
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoRecebidoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoRecebido"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.InscricaoCompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
   request.setCharacterEncoding("UTF-8");
   
    int idInsc = Integer.parseInt(request.getParameter("idInsc"));
    int opt = Integer.parseInt(request.getParameter("opt"));
    String idComp = request.getParameter("idComp");
    InscricaoCompeticaoModalidadeSoloControle icmsc = new InscricaoCompeticaoModalidadeSoloControle();
    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
    InscricaoCompeticaoSolo icms = icmsc.buscarId(idInsc);
    UsuarioParticipante2 up2 = up2c.buscarPorId(icms.getAtleta().getUsuarioParticipante().getIdUsuario());
    ComunicadoRecebidoControle crc = new ComunicadoRecebidoControle();
    UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
    if(opt == 1){
        icms.setInscricaoAceita('A');
        icmsc.alterar(icms);
        icmsc.fecharSessaoDAOGeneric();
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita.",0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Inscrição Aceita",up);
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        crc.fecharSessaoDAOGeneric();
        
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();
       // ComunicadoAPEnviado comunicado2 = new ComunicadoAPEnviado("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita",0,"Inscrição Aceita");
        //response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Inscrição aprovada com sucesso&color=success");
    }else if(opt == 2){
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi recusada.",0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Inscrição Recusada",up);
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        crc.fecharSessaoDAOGeneric();
        
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        icmsc.fecharSessaoDAOGeneric();
          //response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Incrição negada com sucesso&color=success");
    }else if(opt == 3){
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente você foi expulso da competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+", sendo assim não há mais a necessidade de comparecer ao evento.",0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Expulsão",up);
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        crc.fecharSessaoDAOGeneric();
        
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();
        
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        icmsc.fecharSessaoDAOGeneric();
        //response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Competidor Expluso com sucesso&color=success");
    }

    
%>
<meta charset="utf-8">

    <form method="POST" name="formEnviarDadosInscricao">
        <input type="hidden" name="id" value="<%=idComp%>">
        <input type="hidden" name="color" value="success">
        <%if(opt == 1){%>
        <input type="hidden" name="msg" value="Ingresso aceito com sucesso">
        <%}%>
        <%if(opt == 2){%>
        <input type="hidden" name="msg" value="Ingresso recusado com sucesso">
        <%}%>
        <%if(opt == 3){%>
        <input type="hidden" name="msg" value="Competidor Expluso com sucesso">
        
        <%}%>
    </form>

<script>
    window.onload = enviarFormulario();
    function enviarFormulario(){
            document.forms["formEnviarDadosInscricao"].action = "../gerenciarCompeticaoModSolo.jsp";
            document.forms["formEnviarDadosInscricao"].submit();  
    }
</script>