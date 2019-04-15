<%-- 
    Document   : editarModalidadeS
    Created on : 07/10/2018, 21:48:18
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");

String nome = request.getParameter("nomeModalidade");

//int id = Integer.parseInt(request.getParameter("id"));
int op = Integer.parseInt(request.getParameter("op"));
int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
ModalidadeSoloControle msc = new ModalidadeSoloControle();
CompeticaoControle cptc = new CompeticaoControle();
//ModalidadeSolo mc = new ModalidadeSolo(id,nome);


if(op == 1){
    try{
        Competicao competicao = cptc.buscarCompeticaoPorId(idCompeticao);
        ModalidadeSolo modalidadeSolo = new ModalidadeSolo(0, nome);
        
        System.out.println("OPÇÃO:" + idCompeticao);
        System.out.println("Nome competicao: " + competicao.getNome());
        System.out.println("Nome modalidade:" + nome);
        
        competicao.adicionarModalidadeSolo(modalidadeSolo);
        cptc.autualizarCompeticao(competicao);
        msc.salvaModalidadeSolo(modalidadeSolo);
      
        response.sendRedirect("../gerenciamentoDeCompeticao.jsp?idCompeticao="+idCompeticao+"&msg=Modalidade Criada com sucesso&color=success");
    }catch(Exception e){
        response.sendRedirect("../gerenciamentoDeCompeticao.jsp?msg=Houve um erro ao criar a Modalidade&color=danger");

        
   }
}

%>
