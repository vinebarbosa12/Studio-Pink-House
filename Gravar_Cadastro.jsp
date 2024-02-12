<%@page language="java" import="java.sql.*"%>

<%
    // VARIAVEIS PARA ARMAZENAR AS INFORMAÇÕES QUE O USUÁRIO DIGITOU
    String vnome = request.getParameter("txtnome");
    String vemail= request.getParameter("txtemail");
    String vsenha= request.getParameter("txtsenha");

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
    String sql = "INSERT INTO contas_clientes (nome, email, senha) values (?,?,?)"; // ENTRE PARENTESES SÃO OS NOMES DAS COLUNAS DO BANCO DE DADOS

    PreparedStatement stm = conexao.prepareStatement(sql) ;
    stm.setString(1, vnome); // 1- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(2, vemail); // 2- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    stm.setString(3, vsenha); // 3- É O QUE VAI SUBSTITUIR O '?' E DEPOIS DA VIRGULA É A VARIAVEL CRIADA PARA O QUE O USUÁRIO DIGITOU
    
    stm.execute();
    stm.close();

    out.print("<center>");
    out.print("Seus dados foram criados com sucesso!");
    out.print("<br><br>");
    out.print("<a href='Login_Agendamento.html'> VOLTAR </a>");
    out.print("</center>");
%>