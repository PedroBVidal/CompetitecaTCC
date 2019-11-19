<%-- 
    Document   : progredirEquipe
    Created on : 08/11/2019, 08:32:03
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.PosicaoChaveControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.PosicaoChave"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ParesConfronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.controle.BlocoEliminatorioControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int idConfronto = Integer.parseInt(request.getParameter("idConfronto"));
    int idBlocoEliminatorio = Integer.parseInt(request.getParameter("idBlocoEliminatorio"));
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    int resultadoJogoEquipe1 = Integer.parseInt(request.getParameter("resultadoJogoEquipe1"));
    int resultadoJogoEquipe2 = Integer.parseInt(request.getParameter("resultadoJogoEquipe2"));
    int idEquipe1 = Integer.parseInt(request.getParameter("idEquipe1"));
    int idEquipe2 = Integer.parseInt(request.getParameter("idEquipe2"));
    int numSets = Integer.parseInt(request.getParameter("numSets"));
    String informacoesExtra = request.getParameter("informacoesExtra");
    
    
    String sContemRepescagem = request.getParameter("repescagem");
    boolean repescagem = false;
    
    if(sContemRepescagem.equals("repescagem")){
        repescagem = true;
    }else{
        repescagem = false;
    }
    
    ConfrontoModalidadeColetivaControle cmcc = new ConfrontoModalidadeColetivaControle();
    ConfrontoModalidadeColetiva conf = cmcc.buscarPorId(idConfronto);
    
    BlocoEliminatorioControle blocoEliminatorioControle = new BlocoEliminatorioControle();
    BlocoEliminatorio bE = blocoEliminatorioControle.buscarPorId(idBlocoEliminatorio);
    
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    CompeticaoModalidadeColetiva cmc = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    
    EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
    EquipeCompeticao equipe1 = equipeCompeticaoControle.buscarPorId(idEquipe1);
    EquipeCompeticao equipe2 = equipeCompeticaoControle.buscarPorId(idEquipe2);
    
    PosicaoChaveControle posicaoChaveControle = new PosicaoChaveControle();
    
    int numParConfronto = conf.getParesConfronto().getNumParConfrontoRodada();
    double numParConfrontoNovo = 0;
    int rodadaConfronto = conf.getConfrontoRodada();
    int rodadaConfrontoNovo = 0;
    int etapaBlocoEliminatorioNovo = 0;
    int posicaoChaveConfrontoNovo = 0;
    
    etapaBlocoEliminatorioNovo = bE.getEtapa() + 1;
    numParConfrontoNovo =  Math.rint(numParConfronto/2) + (numParConfronto % 2);
    rodadaConfrontoNovo = numParConfronto;
    int contador = 0;
    
    
    for(Confronto  c : bE.getConfrontos()){
        ConfrontoModalidadeColetiva confModC = (ConfrontoModalidadeColetiva) c;
        
        if(c.getIdConfronto() == conf.getIdConfronto()){
            break;
        }
        if(confModC.getConfrontoRodada() % 2 == 0){
          contador = confModC.getConfrontoRodada();
        }
    }
    
    posicaoChaveConfrontoNovo = rodadaConfronto - contador;

    // Encontra bloco eliminatorio novo
    BlocoEliminatorio blocoEliminatorio = new BlocoEliminatorio();
    
    for(BlocoEliminatorio b : cmc.buscarBlocosEliminatorios()){
        if(b.getEtapa() == etapaBlocoEliminatorioNovo){
            blocoEliminatorio = b;
            break;
        }
    }
    
    int idConfrontoNovo = 0;
    for(Confronto c : blocoEliminatorio.getConfrontos()){
        ConfrontoModalidadeColetiva confModColetiva = (ConfrontoModalidadeColetiva) c;
        
        if(confModColetiva.getConfrontoRodada() == rodadaConfrontoNovo){
            idConfrontoNovo = confModColetiva.getIdConfronto();
            break;
        }
    }
    //Fechamento de sessões
    competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
    blocoEliminatorioControle.fecharSessaoDAOGeneric();
    cmcc.fecharSessaoDAOGeneric();
    ConfrontoModalidadeColetiva confrontoNovo = cmcc.buscarPorId(idConfrontoNovo);

    String nomeEquipe1 = "";
    String nomeEquipe2 = "";
    //Indica se já existe um equipeCompetição no local em que a equipe deverá ser progredida.
    boolean flag = false;
    if(resultadoJogoEquipe1 > resultadoJogoEquipe2){
        equipe1.setPosicaoChave(posicaoChaveConfrontoNovo);
        // CASO POSIÇÃO CHAVE 1
        if(posicaoChaveConfrontoNovo == 1){
            //Verifica se já existe uma equipeCompeticao na posição chave (1) do confronto.
            for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                for(PosicaoChave p: e.getPosicoesChave()){
                    if(p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto() && p.getPosicaoChave() == posicaoChaveConfrontoNovo){
                        flag = true;
                    }
                }
            }
            if(flag == false){
                // Verifica se a equipeCompeticao1 já possui uma posição chave referente ao confronto,
                    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
                    PosicaoChave posicaoChave = new PosicaoChave(0, confrontoNovo, posicaoChaveConfrontoNovo);
                    boolean jaPossuiPosicaoChave = false;
                    for (PosicaoChave p : equipe1.getPosicoesChave()) {
                        if (p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto()) {
                            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
                            p.setPosicaoChave(1);
                            posicaoChaveControle.alterar(posicaoChave);
                            jaPossuiPosicaoChave = true;
                            break;
                        }
                    }
                    if (jaPossuiPosicaoChave == false) {
                        posicaoChaveControle.salvar(posicaoChave);
                        equipe1.adicionarPosicaoChave(posicaoChave);
                    }
                //Verifica se existe uma equipeCompeticao com posição chave == 2 no confrontoNovo, e acrescenta
                //o nome da equipe na variável nomeEquipe2
                for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                    if(e.getPosicaoChave() == 2){
                        nomeEquipe2 = e.getEquipe().getNome();
                        break;
                    }
                } 
            nomeEquipe1 = equipe1.getEquipe().getNome();
            //Persiste dados no banco
            equipeCompeticaoControle.alterar(equipe1);
            confrontoNovo.adicionarEquipeCompeticao(equipe1);
            cmcc.alterar(confrontoNovo);
        }
        }
        
        // CASO POSIÇÃO CHAVE 2
        if(posicaoChaveConfrontoNovo == 2){
            equipe1.setPosicaoChave(posicaoChaveConfrontoNovo);
            //Verifica se já existe uma equipeCompeticao na posição chave (2) do confronto.
            for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                for(PosicaoChave p: e.getPosicoesChave()){
                    if(p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto() && p.getPosicaoChave() == posicaoChaveConfrontoNovo){
                        flag = true;
                    }
                }
            }
            
          if(flag == false){
                // Verifica se a equipeCompeticao1 já possui uma posição chave referente ao confronto,
                    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
                    PosicaoChave posicaoChave = new PosicaoChave(0, confrontoNovo, posicaoChaveConfrontoNovo);
                    boolean jaPossuiPosicaoChave = false;
                    for (PosicaoChave p : equipe1.getPosicoesChave()) {
                        if (p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto()) {
                            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
                            p.setPosicaoChave(2);
                            posicaoChaveControle.alterar(posicaoChave);
                            jaPossuiPosicaoChave = true;
                            break;
                        }
                    }
                    if (jaPossuiPosicaoChave == false) {
                        // Persiste nova posição chave
                        posicaoChaveControle.salvar(posicaoChave);
                        equipe1.adicionarPosicaoChave(posicaoChave);
                    }
                    
                //Verifica se existe uma equipeCompeticao com posição chave == 1 no confrontoNovo, e acrescenta
                //o nome da equipe na variável nomeEquipe1
                for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                    if(e.getPosicaoChave() == 1){
                        nomeEquipe1 = e.getEquipe().getNome();
                        break;
                    }
                } 
             
            nomeEquipe2 = equipe1.getEquipe().getNome();
            //Persiste dados no banco
            equipeCompeticaoControle.alterar(equipe1);
            confrontoNovo.adicionarEquipeCompeticao(equipe1);
            cmcc.alterar(confrontoNovo);
        } 
        }

        
    }
    
    else if(resultadoJogoEquipe2 > resultadoJogoEquipe1){
        equipe2.setPosicaoChave(posicaoChaveConfrontoNovo);
        
        //CASO POSIÇÃO CHAVE 1
        if(posicaoChaveConfrontoNovo == 1){
            //Verifica se já existe uma equipeCompeticao na posição chave (1) do confronto.
            for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                for(PosicaoChave p: e.getPosicoesChave()){
                    if(p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto() && p.getPosicaoChave() == posicaoChaveConfrontoNovo){
                        flag = true;
                    }
                }
            }
            if(flag == false){
                // Verifica se a equipeCompeticao2 já possui uma posição chave referente ao confronto,
                    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
                    PosicaoChave posicaoChave = new PosicaoChave(0, confrontoNovo, posicaoChaveConfrontoNovo);
                    boolean jaPossuiPosicaoChave = false;
                    for (PosicaoChave p : equipe2.getPosicoesChave()) {
                        if (p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto()) {
                            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
                            p.setPosicaoChave(posicaoChaveConfrontoNovo);
                            posicaoChaveControle.alterar(posicaoChave);
                            jaPossuiPosicaoChave = true;
                            break;
                        }
                    }
                    if (jaPossuiPosicaoChave == false) {
                        posicaoChaveControle.salvar(posicaoChave);
                        equipe2.adicionarPosicaoChave(posicaoChave);
                    }
                //Verifica se existe uma equipeCompeticao com posição chave == 2 no confrontoNovo, e acrescenta
                //o nome da equipe na variável nomeEquipe2
                for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                    if(e.getPosicaoChave() == 2){
                        nomeEquipe2 = e.getEquipe().getNome();
                        break;
                    }
                } 
            nomeEquipe1 = equipe2.getEquipe().getNome();
            //Persiste dados no banco
            equipeCompeticaoControle.alterar(equipe2);
            confrontoNovo.adicionarEquipeCompeticao(equipe2);
            cmcc.alterar(confrontoNovo);
        }
        }
        //CASO POSIÇÃO CHAVE == 2
        if(posicaoChaveConfrontoNovo == 2){
            //Verifica se já existe uma equipeCompeticao na posição chave (2) do confronto.
            for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                for(PosicaoChave p: e.getPosicoesChave()){
                    if(p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto() && p.getPosicaoChave() == posicaoChaveConfrontoNovo){
                        flag = true;
                    }
                }
            }
            if(flag == false){
                // Verifica se a equipeCompeticao2 já possui uma posição chave referente ao confronto,
                    // caso não tenha será vinculada uma nova posição chave referente ao confronto.
                    PosicaoChave posicaoChave = new PosicaoChave(0, confrontoNovo, posicaoChaveConfrontoNovo);
                    boolean jaPossuiPosicaoChave = false;
                    for (PosicaoChave p : equipe2.getPosicoesChave()) {
                        if (p.getConfronto().getIdConfronto() == confrontoNovo.getIdConfronto()) {
                            posicaoChave = posicaoChaveControle.buscarPorId(p.getId());
                            p.setPosicaoChave(posicaoChaveConfrontoNovo);
                            posicaoChaveControle.alterar(posicaoChave);
                            jaPossuiPosicaoChave = true;
                            break;
                        }
                    }
                    if (jaPossuiPosicaoChave == false) {
                        posicaoChaveControle.salvar(posicaoChave);
                        equipe2.adicionarPosicaoChave(posicaoChave);
                    }
                //Verifica se existe uma equipeCompeticao com posição chave == 1 no confrontoNovo, e acrescenta
                //o nome da equipe na variável nomeEquipe1
                for(EquipeCompeticao e: confrontoNovo.getEquipes()){
                    if(e.getPosicaoChave() == 1){
                        nomeEquipe1 = e.getEquipe().getNome();
                        break;
                    }
                } 
            nomeEquipe2 = equipe2.getEquipe().getNome();
            //Persiste dados no banco
            equipeCompeticaoControle.alterar(equipe2);
            confrontoNovo.adicionarEquipeCompeticao(equipe2);
            cmcc.alterar(confrontoNovo);

        }

    }
    }
    
    
    cmcc.fecharSessaoDAOGeneric();
    equipeCompeticaoControle.fecharSessaoDAOGeneric();
    
    out.print("$"+confrontoNovo.getIdConfronto()+"$");
    %>
                <div class="card" style="margin-bottom: 15px; height: 9rem;" id="cardConfrontoColetivo<%=confrontoNovo.getIdConfronto()%>">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item disabled">  
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe1%></div>
                                                </div>
                                                    <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=confrontoNovo.getIdConfronto()%><%=idEquipe1%>">

                                            </div>
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                </div>
                                                <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=confrontoNovo.getIdConfronto()%><%=idEquipe2%>">
                                            </div>

                                            <a href="#" class="badge badge-info"><i class="fas fa-eye"></i></a>
                                            <a href="javascript:acionarModalInserirDadosConfronto(<%=confrontoNovo.getIdConfronto()%>);" class="badge badge-primary">Inserir dados do jogo</a>
                                            <!--ícone progredir-->
                                            <a href="javascript:acionarModalprogredirEquipe(<%=confrontoNovo.getIdConfronto()%>,<%=idEquipe1%>,<%=idEquipe2%>);" class="badge badge-success"><i class="fas fa-greater-than"></i></a>

                                        </li>
                                    </ul>
            </div>
    <%
    System.out.println("----------------------Relatorio progredir equipe----------------------------");
    System.out.println("ID competição: "+idCompeticao);
    System.out.println("ID confronto: "+idConfronto);
    System.out.println("Repescagem: "+repescagem);
    System.out.println("ID equipe 1"+idEquipe1);
    System.out.println("ID equipe 2"+idEquipe2);
    System.out.println("Informações: "+informacoesExtra);
    System.out.println("Resultado jogo1: "+resultadoJogoEquipe1);
    System.out.println("Resultado jogo2: "+resultadoJogoEquipe2);
    System.out.println("ID bloco eliminatorio: "+idBlocoEliminatorio);
    

    for(int i=1; i<=numSets; i++){
        System.out.println("PLACAR SET(1): "+request.getParameter("placarSet"+i+"Equipe1"));
        System.out.println("PLACAR SET(2): "+request.getParameter("placarSet"+i+"Equipe2"));
    }
    
    
    



%>