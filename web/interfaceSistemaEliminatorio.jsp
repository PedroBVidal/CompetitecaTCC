<%-- 
    Document   : interfaceSistemaEliminatorio
    Created on : 30/09/2019, 14:56:18
    Author     : Usuário
--%>


<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();
    LocalControle localControle = new LocalControle();
    int idCompeticao = Integer.parseInt(request.getParameter("id"));
    CompeticaoModalidadeColetiva competicao = competicaoControle.buscarPorId(idCompeticao);

    SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
%>
<style>
    div.ex1 {
        background-color: lightblue;
        width: 1700px;
        overflow-x: scroll;
    }
</style>
<!-- List group -->
<div class="row">
    <div class="list-group col-2" id="myList" role="tablist">
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Mensagens</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#competidores" role="tab">Competidores</a>
        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#jogos" role="tab">Jogos</a>


    </div>

    <!-- Tab panes -->
    <div class="tab-content col-10">
        <div class="tab-pane dark" id="inscricao" role="tabpanel">
            <div class="form-group input-group">
                <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                    </a></span>
                <input name="consulta" id="txt_consulta1" placeholder="Consultar" type="text" class="form-control">
            </div>
            <table id="tabela1" class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Equipe</th>
                        <th scope="col">Ação</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        for (InscricaoCompeticaoColetiva iMc : competicao.getInscricoesCompeticoesColetivas()) {
                            if (iMc.getInscricaoAceita() == 'E') {
                                String nomeEquipe = iMc.getEquipe().getNome();


                    %>    
                <td><%=nomeEquipe%></td>
                <td>
                    <a href="scripts/aprovaInscCompColetiva.jsp?opt=1&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-success">
                        <!-- Adicionar icone -->
                        <i class="fas fa-check"></i>
                    </a> &nbsp;
                    <a href="scripts/aprovaInscCompColetiva.jsp?opt=2&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-danger">
                        <!-- Adicionar icone -->
                        <i class="fas fa-times"></i>
                    </a> &nbsp;
                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMc.getEquipe().getIdEquipe()%>">
                        <!-- Adicionar icone -->
                        <i class="fas fa-eye"></i>
                    </button></td>

                </tbody>

                <div class="modal fade" id="<%=iMc.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                                <b>Email para Contato:</b>&nbsp;<%=iMc.getEquipe().getAdministrador().getEmail()%><br>
                                <b>Atletas Inscritos:</b><br>
                                <ul>
                                    <%for (Atleta atl : iMc.getAtletas()) {%>
                                    <li><%=atl.getUsuarioParticipante().getNome()%></li>   
                                        <%    }
                                        %>
                                </ul>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%}
                    }%>
            </table>
            <script>
                //Código de busca da tabela
                $('input#txt_consulta1').quicksearch('table#tabela1 tbody tr');

            </script>

        </div>






        <div class="tab-pane" id="messages" role="tabpanel">

        </div>

        <!--TAB PANE DOS JOGOS DA COMPETIÇÃO!-->

        <div class="tab-pane active" id="jogos" role="tabpanel">

            <div class="card text-center">
                <div class="card-header">

                    <nav aria-label="Page navigation example" style="margin-bottom: -12px;">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="card-body">
                    <div class="row">          
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">Rodada 1</h5>


                                <div class="card" style="margin-bottom: 15px; height: 9rem;">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">  
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;">Fulanos</div>
                                                </div>
                                                
                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">

                                            </div>
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;">Magnatas</div>
                                                </div>
                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">
                                            </div>
                                            
                                            <a href="#" class="badge badge-info"><i class="fas fa-eye"></i></a>
                                            <a href="#" class="badge badge-primary">Inserir dados do jogo</a>
                                            <a href="#" class="badge badge-success"><i class="fas fa-greater-than"></i></a>
                                            
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card" style="width: 18rem; margin-left: 10px;">
                            <div class="card-body">
                                <h5 class="card-title">Rodada 2</h5>

                                <div style="margin-bottom: 15px; height: 6.5rem;">

                                </div>
                                <div class="card" style="margin-bottom: 15px; height: 6.5rem;">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Dapibus ac facilisis in</li>
                                        <li class="list-group-item">Vestibulum at eros</li>
                                    </ul>
                                </div>
                                <div class="card" style="margin-bottom: 15px; height: 6.5rem;">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Dapibus ac facilisis in</li>
                                        <li class="list-group-item">Vestibulum at eros</li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 15px; height: 6.5rem;">

                                </div>

                            </div>
                        </div>


                        <div class="card" style="width: 18rem; margin-left: 10px;">
                            <div class="card-body">
                                <h5 class="card-title">Rodada 3</h5>

                                <div style="margin-bottom: 15px; height: 6.5rem;">

                                </div>
                                <div class="card" style="margin-bottom: 15px; height: 8rem;">
                                    <span>Final</span>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Dapibus ac facilisis in</li>
                                        <li class="list-group-item">Vestibulum at eros</li>
                                    </ul>
                                </div>
                                <div class="card" style="margin-bottom: 15px; height: 8rem;">
                                    <span>DISPUTA DE 3º E 4º</span>
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">Dapibus ac facilisis in</li>
                                        <li class="list-group-item">Vestibulum at eros</li>
                                    </ul>
                                </div>
                                <div style="margin-bottom: 15px; height: 6.5rem;">

                                </div>

                            </div>
                        </div>

                    </div>          
                </div>
            </div>
        </div>

        <!--Tab pane competidores-->
        <div class="tab-pane" id="competidores" role="tabpanel">
            <div class="form-group input-group">
                <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                    </a></span>
                <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
            </div>
            <table id="table" class="table table-striped">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Equipe</th>
                        <th scope="col">Ação</th>
                    </tr>
                </thead>

                <tbody>
                    <%

                        for (EquipeCompeticao equipeCompeticao : competicao.getEquipesCompeticao()) {

                            String nomeEquipe = equipeCompeticao.getEquipe().getNome();


                    %>    
                <td><%=nomeEquipe%></td>
                <td>

                    <a href="#" class="btn btn-danger">
                        <!-- Adicionar icone -->
                        <i class="fas fa-trash-alt"></i>
                    </a> &nbsp;
                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=equipeCompeticao.getEquipe().getIdEquipe()%>">
                        <!-- Adicionar icone -->
                        <i class="fas fa-eye"></i>
                    </button></td>

                </tbody>

                <div class="modal fade" id="<%=equipeCompeticao.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                                <b>Email para Contato:</b>&nbsp;<%=equipeCompeticao.getEquipe().getAdministrador().getEmail()%><br>
                                <b>Atletas Inscritos:</b><br>
                                <ul>
                                    <%for (Atleta atl : equipeCompeticao.getAtletasEquipe()) {%>
                                    <li><%=atl.getUsuarioParticipante().getNome()%></li>       
                                        <% }
                                        %>
                                </ul>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%}%>
            </table>



            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalConfirmarGerarJogos">
                Gerar jogos da competição
            </button>

            <!-- Modal -->
            <div class="modal fade" id="modalConfirmarGerarJogos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <%if (competicao.isJogosEmAndamento()) {%>
                            <h5 class="modal-title" id="exampleModalLabel">Deseja gerar novamente os jogos desta competição? <%=competicao.getNomeCompeticao()%></h5>
                            <%} else {
                            %>
                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente gerar os jogos da competição <%=competicao.getNomeCompeticao()%></h5>
                            <%}%>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-footer">
                            <form action="scripts/gerarJogosCompeticaoModalidadeColetivaSistemaEliminatorio.jsp">
                                <input type="hidden" value="<%=competicao.getIdCompeticaoModalidade()%>" name="idCompModColetiva">
                                <button type="submit" class="btn btn-primary">Sim</button>
                            </form>

                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

