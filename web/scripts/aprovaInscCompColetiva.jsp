<%-- 
    Document   : inscreverAtletaEmCompeticaoSolo
    Created on : 15/11/2018, 20:41:30
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.InscricaoCompeticaoColetivaControle"%>
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

    int idInsc = Integer.parseInt(request.getParameter("idInsc"));
    int opt = Integer.parseInt(request.getParameter("opt"));
    int idComp = Integer.parseInt(request.getParameter("idComp"));
    
    InscricaoCompeticaoColetivaControle icmsc = new InscricaoCompeticaoColetivaControle();
    EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
    ComunicadoRecebidoControle crc = new ComunicadoRecebidoControle();
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
    
    InscricaoCompeticaoColetiva icms = icmsc.buscarId(idInsc);
    UsuarioParticipante2 up2 = up2c.buscarPorId(icms.getEquipe().getAdministrador().getIdUsuario());
    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idComp);
    
    UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");

    if (opt == 1) {
        String atletas = "<ul>";
        icms.setInscricaoAceita('A');
        icmsc.alterar(icms);
        
        for (Atleta atl : icms.getAtletas()) {
            atletas += "<li>" + atl.getUsuarioParticipante().getNome() + "</li>";
        }
        atletas += "</ul>";
        icmsc.fecharSessaoDAOGeneric();
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Parabéns, a inscrição da equipe " + icms.getEquipe().getNome() + " na competição " + icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + " foi aceita. <br> Os seguintes atletas foram inscritos <br> " + atletas, 0, false, icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + " - Inscrição Aceita", up);
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        crc.fecharSessaoDAOGeneric();
        
        EquipeCompeticao equipeCompeticao = new EquipeCompeticao(0, icms.getEquipe(), icms.getAtletas());
        equipeCompeticaoControle.salvar(equipeCompeticao);
        equipeCompeticaoControle.fecharSessaoDAOGeneric();
        
        cmc.getEquipesCompeticao().add(equipeCompeticao);
        cmcc.alterar(cmc);
        cmcc.fecharSessaoDAOGeneric();
        //icmsc.fecharSessaoDAOGeneric();
        
        
        up2.adicionarMensagemRecebida(comunicado);

        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();

        // ComunicadoAPEnviado comunicado2 = new ComunicadoAPEnviado("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita",0,"Inscrição Aceita");
        response.sendRedirect("../gerenciarCompModColetiva.jsp?id=" + idComp + "&msg=Inscrição aprovada com sucesso&color=success");
    } else if (opt == 2) {
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente a inscrição da equipe " + icms.getEquipe().getNome() + " na competição " + icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + " foi recusada.", 0, false, icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + " - Inscrição Recusada", up);
       // ComunicadoAPEnviado comunicado2 = new ComunicadoAPEnviado("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita",0,"Inscrição Aceita");
        response.sendRedirect("../gerenciarCompModColetiva.jsp?id="+idComp+"&msg=Inscrição aprovada com sucesso&color=success");
    }else if(opt == 2){
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente a inscrição da equipe "+icms.getEquipe().getNome()+" na competição "+icms.getCompeticaoModalidadeColetiva().getNomeCompeticao()+" foi recusada.",0,false,icms.getCompeticaoModalidadeColetiva().getNomeCompeticao()+" - Inscrição Recusada",up);
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();
        crc.fecharSessaoDAOGeneric();

        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        icmsc.fecharSessaoDAOGeneric();
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        up2c.fecharSessaoDAOGeneric();

        response.sendRedirect("../gerenciarCompModColetiva.jsp?id=" + idComp + "&msg=Incrição negada com sucesso&color=success");
    } else if (opt == 3) {
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente a equipe " + icms.getEquipe().getNome() + " foi expulsa da competição " + icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + ", sendo assim não há mais a necessidade de comparecer ao evento.", 0, false, icms.getCompeticaoModalidadeColetiva().getNomeCompeticao() + " - Expulsão", up);
          response.sendRedirect("../gerenciarCompModColetiva.jsp?id="+idComp+"&msg=Incrição negada com sucesso&color=success");
    }else if(opt == 3){
        ComunicadoRecebido comunicado = new ComunicadoRecebido("Infelizmente a equipe "+icms.getEquipe().getNome()+" foi expulsa da competição "+icms.getCompeticaoModalidadeColetiva().getNomeCompeticao()+", sendo assim não há mais a necessidade de comparecer ao evento.",0,false,icms.getCompeticaoModalidadeColetiva().getNomeCompeticao()+" - Expulsão",up);
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        icmsc.fecharSessaoDAOGeneric();
        crc.fecharSessaoDAOGeneric();
        
    }


%>
