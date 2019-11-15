<%-- 
    Document   : cadastrarConfrontoColetivoSisEliminatorio
    Created on : 05/10/2019, 18:22:40
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.PosicaoChave"%>
<%@page import="br.edu.ifpr.irati.ti.controle.PosicaoChaveControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.controle.BlocoEliminatorioControle"%>
<%@page import="java.util.Date"%>
<%@page import='java.util.ArrayList'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.Local'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.EquipeCompeticao'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva'%>
<%@page import='java.text.SimpleDateFormat'%>
<%@page import='br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle'%>
<%@page import='br.edu.ifpr.irati.ti.controle.LocalControle'%>
<%@page import='br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle'%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<%
    String resultado = "";
    
    int idConfronto = Integer.parseInt(request.getParameter("idConfronto"));
    int idEquipe1 = Integer.parseInt(request.getParameter("selectEquipe1"));
    int idEquipe2 = Integer.parseInt(request.getParameter("selectEquipe2"));
    int idLocal =  Integer.parseInt(request.getParameter("localJogo"));
    int idBlocoEliminatorio = Integer.parseInt(request.getParameter("idBlocoEliminatorio"));
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    
    SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
    SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
    Date dataJogo = null; Date horaInicioJogo = null; Date horaFinalJogo = null;
    
    if(request.getParameter("dataJogo") != null){
    dataJogo = sdfData.parse(request.getParameter("dataJogo"));
    }
    if(request.getParameter("horaInicioJogo") != null){
    horaInicioJogo = sdfHora.parse(request.getParameter("horaInicioJogo"));
    }
    if(request.getParameter("horaFinalJogo") != null){
    horaFinalJogo = sdfHora.parse(request.getParameter("horaFinalJogo"));
    }
    
    ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
    LocalControle localControle = new LocalControle();
    BlocoEliminatorioControle blocoEliminatorioControle = new BlocoEliminatorioControle();
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    PosicaoChaveControle posicaoChaveControle = new PosicaoChaveControle();
    EquipeCompeticaoControle  eqCompControle = new EquipeCompeticaoControle();
    EquipeCompeticao equipeComp1 = new EquipeCompeticao();
    EquipeCompeticao equipeComp2 = new EquipeCompeticao();
    Local localJogo = new Local();
    
    ConfrontoModalidadeColetiva confModColetiva = confrontoColetivoControle.buscarPorId(idConfronto);
   
    CompeticaoModalidadeColetiva competicaoModalidadeColetiva = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    confModColetiva.removeAllEquipesCompeticao();
    
    if(idEquipe1 != 0){
    equipeComp1 = eqCompControle.buscarPorId(idEquipe1);
    // Verifica se a equipeCompeticao1 já possui uma posição chave referente ao confronto,
    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
    PosicaoChave posicaoChave = new PosicaoChave(0, confModColetiva, 1);
    boolean jaPossuiPosicaoChave = false;
    for(PosicaoChave p : equipeComp1.getPosicoesChave()){
        if(p.getConfronto().getIdConfronto() == confModColetiva.getIdConfronto()){
            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
            p.setPosicaoChave(1);
            posicaoChaveControle.alterar(posicaoChave);
            jaPossuiPosicaoChave = true;
            break;
        }
    }
    if(jaPossuiPosicaoChave == false){
        posicaoChaveControle.salvar(posicaoChave);
        equipeComp1.adicionarPosicaoChave(posicaoChave);
    }
    equipeComp1.setPosicaoChave(1);
    eqCompControle.alterar(equipeComp1);
    confModColetiva.adicionarEquipeCompeticao(equipeComp1);
    }
    if(idEquipe2 != 0){
    equipeComp2 = eqCompControle.buscarPorId(idEquipe2);
    // Verifica se a equipeCompeticao2 já possui uma posição chave referente ao confronto,
    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
    PosicaoChave posicaoChave = new PosicaoChave(0, confModColetiva, 2);
    boolean jaPossuiPosicaoChave = false;
    for(PosicaoChave p : equipeComp2.getPosicoesChave()){
        if(p.getConfronto().getIdConfronto() == confModColetiva.getIdConfronto()){
            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
            p.setPosicaoChave(2);
            posicaoChaveControle.alterar(posicaoChave);
            jaPossuiPosicaoChave = true;
            break;
        }
    }
    if(jaPossuiPosicaoChave == false){
        posicaoChaveControle.salvar(posicaoChave);
        equipeComp2.adicionarPosicaoChave(posicaoChave);
    }
    
    equipeComp2.setPosicaoChave(2);
    eqCompControle.alterar(equipeComp2);
    confModColetiva.adicionarEquipeCompeticao(equipeComp2);
    }
    if(idLocal != 0){
    localJogo = localControle.buscaPorId(idLocal);
    confModColetiva.setLocal(localJogo);
    }   
    

    if(dataJogo != null){
        confModColetiva.setDataConfronto(dataJogo);
    }
    if(horaInicioJogo != null){
        confModColetiva.setHoraInicio(horaInicioJogo);
    }
    if(horaFinalJogo != null){
        confModColetiva.setHoraTermino(horaFinalJogo);
    }
    
    
    
    //Altera confronto coletivo
    confrontoColetivoControle.alterar(confModColetiva);
    
    String nomeEq1 = "";
    String nomeEq2 = "";
    if(idEquipe1 != 0 && idEquipe2 != 0){ 
    nomeEq1 = confModColetiva.getEquipes().get(0).getEquipe().getNome();
    nomeEq2 = confModColetiva.getEquipes().get(1).getEquipe().getNome();
    }
    if(idEquipe1 != 0 && idEquipe2 == 0){
    nomeEq1 = confModColetiva.getEquipes().get(0).getEquipe().getNome();
    }
    if(idEquipe1 == 0 && idEquipe2 != 0){
    nomeEq2 = confModColetiva.getEquipes().get(0).getEquipe().getNome();
    }

    confrontoColetivoControle.fecharSessaoDAOGeneric();
    
    resultado+= "<ul class='list-group list-group-flush'>";
    resultado+=     "<li class='list-group-item'>";  
    resultado+=     "<div class='input-group mb-2 mr-sm-2'>";
    resultado+=     "<div class='input-group-prepend'>";
    resultado+=     "<div class='input-group-text' style='width: 10rem;'>"+nomeEq1+"</div>";
    resultado+=     "</div>";
    resultado+=     "<input type='text' class='form-control' id='inlineFormInputGroupUsername2'>";
    resultado+=     "</div>";
    resultado+=     "<div class='input-group mb-2 mr-sm-2'>";
    resultado+=     "<div class='input-group-prepend'>";
    resultado+=     "<div class='input-group-text' style='width: 10rem;'>"+nomeEq2+"</div>";
    resultado+=     "</div>";
    resultado+=     "<input type='text' class='form-control' id='inlineFormInputGroupUsername2'>";
    resultado+=     "</div>";
    resultado+=     "<a href='#' class='badge badge-info'><i class='fas fa-eye'></i></a>";
    resultado+=     "\n";
    resultado+=     "<a href='javascript:acionarModalInserirDadosConfronto("+confModColetiva.getIdConfronto()+");' class='badge badge-primary'>Inserir dados do jogo</a>";
    resultado+=     "\n";
    if(idEquipe1 != 0 && idEquipe2 != 0){
    resultado+=     "<a href='javascript:acionarModalprogredirEquipe("+confModColetiva.getIdConfronto()+","+idEquipe1+","+idEquipe2+");' class='badge badge-success'><i class='fas fa-greater-than'></i></a>";
    }
    else{
    resultado+=     "<a href='' class='badge badge-success'><i class='fas fa-greater-than'></i></a>";  
    }
    resultado+=     "\n";
    resultado+=     "</li>";
    resultado+=     "</ul>";                        
    resultado+=     "$";
    
    
    
    
     BlocoEliminatorio blocoEliminatorio = blocoEliminatorioControle.buscarPorId(idBlocoEliminatorio);
     
    List<EquipeCompeticao> equipesCompeticao = competicaoModalidadeColetiva.getEquipesCompeticao();
    List<EquipeCompeticao> equipesJaSelecionadas = new ArrayList();
        for (Confronto confronto : blocoEliminatorio.getConfrontos()) {
            resultado+=confronto.getIdConfronto();
            resultado+="$";
            System.out.println("CCC");
            ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                if (confColetivo.getEquipes().isEmpty() == false) {
                    for (EquipeCompeticao eq : confColetivo.getEquipes()) {
                        for (EquipeCompeticao equipeCompeticao : equipesCompeticao) {
                            if (eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()) {

                                equipesJaSelecionadas.add(equipeCompeticao);
                                break;
                            }
                        }
                    }
                }
        }
        
        
    for (Confronto confronto : blocoEliminatorio.getConfrontos()) {

    ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;    
    boolean adicionarOption = true;
    resultado+= "<option selected='false' value='0'></option>";
    
        for (EquipeCompeticao equipe1 : equipesCompeticao) {
            adicionarOption = true;
                for(EquipeCompeticao equipeSelecionada : equipesJaSelecionadas){
                                                                            
                    if(equipeSelecionada.getIdEquipeCompeticao() == equipe1.getIdEquipeCompeticao()){
                        adicionarOption = false;
                        break;
                    }
                }
                    if(adicionarOption == true){
                       resultado+= "<option value="+equipe1.getIdEquipeCompeticao()+">"+equipe1.getEquipe().getNome()+"</option>"; 
                    }
        }
        EquipeCompeticao equipe1Conf = new EquipeCompeticao();
        EquipeCompeticao equipe2Conf = new EquipeCompeticao();
        
        if(confColetivo.getEquipes().size() == 2){
        
        equipe1Conf = confColetivo.getEquipes().get(0);
        equipe2Conf = confColetivo.getEquipes().get(1);
         resultado+= "<option value="+equipe1Conf.getIdEquipeCompeticao()+" selected='true'>"+equipe1Conf.getEquipe().getNome()+"</option>"; 
         resultado+= "<option value="+equipe2Conf.getIdEquipeCompeticao()+">"+equipe2Conf.getEquipe().getNome()+"</option>"; 
        }
        else if(confColetivo.getEquipes().size() == 1){
            if(confColetivo.getEquipes().get(0).getPosicaoChave() == 1){
                equipe1Conf = confColetivo.getEquipes().get(0);
                resultado+= "<option value="+equipe1Conf.getIdEquipeCompeticao()+" selected='true'>"+equipe1Conf.getEquipe().getNome()+"</option>"; 
            }
            else if(confColetivo.getEquipes().get(0).getPosicaoChave() == 2){
                equipe2Conf = confColetivo.getEquipes().get(0);
                resultado+= "<option value="+equipe2Conf.getIdEquipeCompeticao()+">"+equipe2Conf.getEquipe().getNome()+"</option>"; 
            }
        }
        
        resultado+= "$";
        
        resultado+= "<option selected='false' value='0'></option>";
        for (EquipeCompeticao equipe2 : equipesCompeticao) {
            adicionarOption = true;
                for(EquipeCompeticao equipeSelecionada : equipesJaSelecionadas){
                                                                            
                    if(equipeSelecionada.getIdEquipeCompeticao() == equipe2.getIdEquipeCompeticao()){
                        adicionarOption = false;
                        break;
                    }
                }
                    if(adicionarOption == true){
                       resultado+= "<option value="+equipe2.getIdEquipeCompeticao()+">"+equipe2.getEquipe().getNome()+"</option>"; 
                    }
        }
        if(confColetivo.getEquipes().size() == 2){
        
        equipe1Conf = confColetivo.getEquipes().get(0);
        equipe2Conf = confColetivo.getEquipes().get(1);
        resultado+= "<option value="+equipe1Conf.getIdEquipeCompeticao()+">"+equipe1Conf.getEquipe().getNome()+"</option>"; 
        resultado+= "<option value="+equipe2Conf.getIdEquipeCompeticao()+" selected='true'>"+equipe2Conf.getEquipe().getNome()+"</option>"; 
        
        }
        else if(confColetivo.getEquipes().size() == 1){
            if(confColetivo.getEquipes().get(0).getPosicaoChave() == 1){
                equipe1Conf = confColetivo.getEquipes().get(0);
                resultado+= "<option value="+equipe1Conf.getIdEquipeCompeticao()+">"+equipe1Conf.getEquipe().getNome()+"</option>"; 
            }
            else if(confColetivo.getEquipes().get(0).getPosicaoChave() == 2){
                equipe2Conf = confColetivo.getEquipes().get(0);
                resultado+= "<option value="+equipe2Conf.getIdEquipeCompeticao()+" selected='true'>"+equipe2Conf.getEquipe().getNome()+"</option>"; 
            }
        }
        resultado+= "$";
    }
    
    
    if(idEquipe1 != 0 && idEquipe2 != 0){

    resultado+=       "<div class='modal fade bd-example-modal-lg' id='modalFinalizarJogo"+confModColetiva.getIdConfronto()+"' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>";
    resultado+=       "<div class='modal-dialog modal-lg' role='document'>";
    resultado+=         "<div class='modal-content'>";
                                                
                                                    idEquipe1 = confModColetiva.getEquipes().get(0).getIdEquipeCompeticao();
                                                    idEquipe2 = confModColetiva.getEquipes().get(1).getIdEquipeCompeticao();
                                                
    resultado+=         "<input type='hidden' name='idCompeticao' value='"+idCompeticao+"'>";
    resultado+=         "<input type='hidden' name='idConfronto' value='"+confModColetiva.getIdConfronto()+"'>";
    resultado+=         "<input type='hidden' name='"+idEquipe1+"' value='"+confModColetiva.getEquipes().get(0).getIdEquipeCompeticao()+"'>";
    resultado+=         "<input type='hidden' name='"+idEquipe2+"' value='"+confModColetiva.getEquipes().get(1).getIdEquipeCompeticao()+"'>";
    resultado+=                         "<div class='modal-header'>";
    resultado+=                             "<h5 class='modal-title' id='exampleModalLabel'>Deseja realmente finalizar o jogo?</h5>";
    resultado+=                             "<button type='button' class='close' data-dismiss='modal' aria-label='Close'>";
    resultado+=                             "<span aria-hidden='true'>&times;</span>";
    resultado+=                             "</button>";
    resultado+=                             "</div>";
    resultado+=                             "<div class='modal-body'>";
    resultado+=                             "<input type='hidden' id='contadorSets"+confModColetiva.getIdConfronto()+"' value='0'>";
    resultado+=                             "<p class='text-bolder'>Sets jogo:</p>";
    resultado+=                                        "<table class='table table-sm' id='tableSetsConfronto"+confModColetiva.getIdConfronto()+"'>";
    resultado+=                                         "<thead>";
    resultado+=                                         "<tr class='col-4'>";
    resultado+=                                                           "<th scope='col' style='margin-left: auto;'>";
    resultado+=                                                                "<a href='javascript:novoSet("+confModColetiva.getIdConfronto()+","+idEquipe1+","+idEquipe2+");' class='badge badge-success'><i class='fas fa-plus'></i>&nbsp;Novo set</a>";
    resultado+=                                                                "<a href='javascript:excluirSet("+confModColetiva.getIdConfronto()+");' class='badge badge-danger'><i class='fas fa-minus'></i>&nbsp;Excluir set</a>";
    resultado+=                                                            "</th>";
    resultado+=                                                            "<th scope='col'>"+confModColetiva.getEquipes().get(0).getEquipe().getNome()+"</th>";
    resultado+=                                                            "<th scope='col'>"+confModColetiva.getEquipes().get(1).getEquipe().getNome()+"</th>";
    resultado+=                                                            
    resultado+=                                         "</tr>";
    resultado+=                                         "</thead>";
    resultado+=                                         "<tbody id='tbodySets"+confModColetiva.getIdConfronto()+"';";
                                                            

    resultado+=                                     "</tbody>";
    resultado+=                                     "</table>";
    resultado+=                                      "<p class='font-weight-bold'>Resultado do jogo:</p>";
    resultado+=                                                "<table class='table table-sm'>";
    resultado+=                                                    "<thead>";
    resultado+=                                                       "<tr>";
                                                                
    resultado+=                                                            "<th scope='col'>"+confModColetiva.getEquipes().get(0).getEquipe().getNome()+"</th>";
    resultado+=                                                            "<th scope='col'>"+confModColetiva.getEquipes().get(1).getEquipe().getNome()+"</th>";
                                                                
    resultado+=                                                        "</tr>";
    resultado+=                                                    "</thead>";
    resultado+=                                                    "<tbody>";
    resultado+=                                                    "<tr>";
                                                                
    resultado+=                                                    "<td>";
    resultado+=                                                    "<div class='form-row'>";
    resultado+=                                                    "<div class='form-group col-md-5'></div>";                                                                              
    resultado+=                                                                            "<div class='form-group col-md-2'>";
    resultado+=                                                                              "<input type='text' class='form-control' id='resultadoConfrontoEquipe"+confModColetiva.getIdConfronto()+idEquipe1+"' style='text-align: center;'>";
    resultado+=                                                                            "</div>";
    resultado+=                                                                            "<div class='form-group col-md-5'></div>";
    resultado+=                                                                          "</div>";                                                                       
    resultado+=                                                                    "</td>";
    resultado+=                                                                    "<td>";
    resultado+=                                                                        "<div class='form-row'>";
    resultado+=                                                                                   "<div class='form-group col-md-5'></div>";                                                                            
    resultado+=                                                                                     "<div class='form-group col-md-2'>";
    resultado+=                                                                                         "<input type='text' class='form-control' id='resultadoConfrontoEquipe"+confModColetiva.getIdConfronto()+idEquipe2+"' style='text-align: center;'>";
    resultado+=                                                                                      "</div>";
    resultado+=                                                                                    "<div class='form-group col-md-5'></div>";
    resultado+=                                                                          "</div>";                                                                        
    resultado+=                                                                    "</td>";
    resultado+=                                                        "</tr>";
    resultado+=                                                    "</tbody>";
    resultado+=                                                "</table>";

    resultado+=                                                "<div class='form-group'>";
    resultado+=                                                    "<p class='text-left' style='margin-top: 10px;'>Informações adicionais do jogo:</p>";
    resultado+=                                                    "<textarea class='form-control' id='informacoesConfronto"+confModColetiva.getIdConfronto()+"'></textarea>";
    resultado+=                                                 "</div>";

    resultado+=                                             "</div>";
    resultado+=                                             "<div class='modal-footer'>";
    resultado+=                                                 "<button type='button' class='btn btn-secondary' data-dismiss='modal'>Fechar</button>";
    resultado+=                                                "<button type='submit' class='btn btn-success' onclick='progredirEquipe("+confModColetiva.getIdConfronto()+","+idEquipe1+","+idEquipe2+","+idCompeticao+",'false',"+idBlocoEliminatorio+");' >Finalizar jogo</button>";
    resultado+=                                           "</div>";
                                            
    resultado+=                                     "</div>";
    resultado+=                                     "</div>";
    resultado+=                                     "</div>";
 }
    resultado+= "$";
    out.print(resultado);
%>
