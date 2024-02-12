<%@page language="Java" import="java.sql.*"%>
<%
    String vemail = request.getParameter("txtemail");
    String vsenha = request.getParameter("txtsenha");

    //Variaveis para o banco de dados
    String banco    = "studio_pink_house";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario  = "root";
    String senha    = "";

    //Variavel para o Driver
    String driver = "com.mysql.jdbc.Driver";

    //Carregar o driver na memória
    Class.forName( driver );

    //Cria a variavel para conectar com o banco de dados
    Connection conexao;

    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    String sql = "SELECT * FROM contas_clientes WHERE email=? AND senha=?"; // * é a representação de todas as colunas

    //Criar o Statement para executar o comando no banco de dados
    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString( 1 , vemail) ;
    stm.setString( 2 , vsenha) ;
    ResultSet dados = stm.executeQuery();

    if (dados.next())
    {
        // Cria a sessão chama "usuario"
        session.setAttribute("usuario", dados.getString("nome"));
        response.sendRedirect("Agendamento.jsp");
    }
    else
    {
        out.print("<br><br><center> Login Incorreto! <br>");
        out.print("<a href='Login_Agendamento.html'> Login </a>");
        out.print("</center>");
    }
%>