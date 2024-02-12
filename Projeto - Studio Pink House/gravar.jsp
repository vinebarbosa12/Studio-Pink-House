<%@page language="java" import="java.sql.*"%>

<%
    // VARIAVEIS PARA ARMAZENAR AS INFORMAÇÕES QUE O USUÁRIO DIGITOU
    Object vnome = session.getAttribute("usuario");
    String vendereco= request.getParameter("txtendereco");
    String vtelefone = request.getParameter("txttelefone");
    // String vprocedimentos = request.getParameter("proc");
    String[] vprocedimentos = request.getParameterValues("proc");
    String procedimentoBD = "" ;
    for(String item : vprocedimentos)
    {
        procedimentoBD = procedimentoBD + item + " - ";
    }
    String vdata = request.getParameter("txtdata");
    String vhora = request.getParameter("txthora"); 

    // VARIAVEIS PARA O BANCO DE DADOS
    String banco = "studio_pink_house";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "" ;

    // VARIAVEL PARA O DRIVER
    String driver = "com.mysql.jdbc.Driver";

    // CARREGAR O DRIVER NA MEMÓRIA
    Class.forName(driver);

    // CRIA A VARIAVEL PARA CONECTAR COM O BANCO DE DADOS
    Connection conexao;

    // ABRIR A CONEXÃO COM O BANCO DE DADOS
    conexao = DriverManager.getConnection(endereco, usuario, senha); // ENTRE PARENTESES SÃO AS VARIAVEIS DO BANCO DE DADOS

    // CRIA A VARIAVEL SQL COM O COMANDO INSERT
    String sql = "INSERT INTO agendamento (NOME, ENDERECO, TELEFONE, PROCEDIMENTOS, DATA, HORA) values (?,?,?,?,?,?)"; // ENTRE PARENTESES SÃO OS NOMES DAS COLUNAS DO BANCO DE DADOS

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setObject(1, vnome); // 1- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(2, vendereco); // 2- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(3, vtelefone); // 3- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(4, procedimentoBD); // 4- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(5, vdata); // 5- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(6, vhora); // 6- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU

    stm.execute();
    stm.close();


    out.print("<center>");
    out.print("<br>");
    out.print("<h1>");
    out.print("AGENDAMENTO MARCADO COM SUCESSO!");
    out.print("</h1>");

    String endereco_final = request.getParameter("txtendereco");
    String telefone = request.getParameter("txttelefone");
    String data = request.getParameter("txtdata");
    String hora = request.getParameter("txthora");

    out.print("Ola, " + session.getAttribute("usuario") + ", seja bem vinda!");
    out.print("<br>");
    out.print("Seu endereco: " + endereco_final + ". " + "Seu telefone: " + telefone + ".");
    out.print("<br><br>");
    out.print("Voce escolheu o(s) procedimento(s): " + procedimentoBD);
    out.print("<br><br>");

    out.print("<br><br><br>");
    out.print("Seu agendamento ficou marcado as: " + hora + " do dia " + data + ".");
    out.print("<br><br><br><br>");
    out.print("<a href='Agendamento.jsp'> VOLTAR </a>");
%>