<%@page language="Java" import="java.sql.*"%>
<%
    // Consultando se a sessão "usuario" existe
    if (session.getAttribute("usuario") == null)
    {
        out.print("<center>");
        out.print("Erro. <br> Faca o login para acessar essa pagina.");
        out.print("<br><br>");
        out.print("<a href='Login_Agendamento.html'> Fazer Login. </a>");
        out.print("</center>");
    }
    else
    {
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title> Studio Pink House - Consulta Agendamento </title>
    <style>
        @font-face {
            font-family: "Coco";
            src: url("Fontes/CocoSharp-ExtraLight.otf") format("opentype");
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: "Sig";
            src: url("Fontes/Signatra.otf") format("opentype"), url(Fontes/Signatra.ttf) format("truetype");
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: "Big";
            src: url("Fontes/BigCaslonFB-Regular.ttf") format("truetype");
            font-weight: normal;
            font-style: normal;
        }
        div {
            text-align: center;
            font-family: "Coco";
            font-size: 30px;
        }
        a {
            text-align: center;
            font-family: "Coco";
            font-size: 15px;
        }
        .logout {
            padding-right: 15px;
        }
        table {
            background-color: rgb(248, 207, 228);
            text-align: center;
            table-layout: fixed;
            font-family: "Coco";
            font-size: 15px;
        }
        td {
            width: 180px;
            height: 35px;
            padding: 0px 10px;
        }
        .cabeca {
            background-color: white;
            font-size: 18px;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <%
        Object vnome = session.getAttribute("usuario");

        //variaveis para o banco de dados
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

        String sql = "SELECT * FROM agendamento WHERE nome = ?"; // * é a representação de todas as colunas

        //Criar o Statement para executar o comando no banco de dados
        PreparedStatement stm = conexao.prepareStatement(sql);
        stm.setObject( 1 , vnome);
        ResultSet dados = stm.executeQuery();

        out.print("<br><br>");
        out.print("<center>");
        out.print("<div>");
        out.print("Seja bem vinda " + session.getAttribute("usuario") + "! ");
        out.print("</div>");
        out.print("<a class=logout href=Logout.jsp> Fazer Logout. </a>" + "<a href=Agendamento.jsp> Voltar para pagina de agendamento. </a>");
        out.print("<br><br><br></center>");

        out.print("<center>");
        out.print("<table border=1>");
            out.print("<tr class=cabeca>");
                out.print("<th> Nome </th>");
                out.print("<th> Endereco </th>");
                out.print("<th> Telefone </th>");
                out.print("<th> Procedimentos </th>");
                out.print("<th> Data </th>");
                out.print("<th> Hora </th>");
            out.print("</tr>");

        while (dados.next())
        {
            out.print("<tr>");
                out.print("<td>");
                    out.print(dados.getString("nome"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("endereco"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("telefone"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("procedimentos"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("data"));
                out.print("</td>");

                out.print("<td>");
                    out.print(dados.getString("hora"));
                out.print("</td>");
            out.print("<tr>");
        }


        out.print("</center>");
    %>
</body>
</html>

<%
    }
%>