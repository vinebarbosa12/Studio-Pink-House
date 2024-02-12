<%@page language="Java" import="java.sql.*"%>
<%
    // Consultando se a sessão "usuario" existe
    if (session.getAttribute("usuario") == null)
    {
        out.print("<center>");
        out.print("Erro. <br> Entre com o seu login para acessar essa pagina.");
        out.print("<br><br>");
        out.print("<a href='Login_Agendamento.html'> Login </a>");
        out.print("</center>");
    }
    else
    {
%>

<!DOCTYPE html>
<html lang="pt-br">
    
    <head>
        <title> Studio Pink House - Agendamento </title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="CSS/style_menu.css">
        <style>
        .conteudo {
            padding-top: 50px;
            text-align: center;
            font-family: cocosharp-extralight;
            font-size: 30px;
            padding-bottom: 40px;
        }
        .bem_vindo {
            padding-top: 12px;
            text-align: center;
            font-family: cocosharp-extralight;
            font-size: 25px;
        }
        .consulta {
            text-align: center;
            font-family: cocosharp-extralight;
            font-size: 15px;
        }
        .agendamento {
            font-family: cocosharp-extralight;
            font-size: 20px;
            text-align: left;
            padding-left: 100px;
            letter-spacing: 0.9px;
        }
        .menu_de_procedimentos {
            font-size: 18px;
            padding: 9px;
            padding-left: 99px;
            border-radius: 3px;
            line-height: 30px;
        }
        .input_nome {
            width: 373px;
            margin: 0 auto;
            padding: 9px;
            margin-bottom: 10px;
            border-radius: 3px;
            font-size: 13px;
        }
        .input_sobrenome {
            width: 318px;
            margin: 0 auto;
            padding: 9px;
            margin-bottom: 10px;
            border-radius: 3px;
            font-size: 13px;
        }
        .input_endereco {
            width: 336px;
            margin: 0 auto;
            padding: 9px;
            margin-bottom: 10px;
            border-radius: 3px;
            font-size: 13px;
        }
        .input_telefone {
            width: 350px;
            margin: 0 auto;
            padding: 9px;
            margin-bottom: 10px;
            border-radius: 3px;
            font-size: 13px;
        }
        .input_data-hora {
            width: 384px;
            margin: 0 auto;
            padding: 9px;
            margin-bottom: 10px;
            border-radius: 3px;
            font-size: 13px;
        }
        .button1 {
            padding: 10px;
            width: 100px;
            margin: 0 auto;
            margin-top: 50px;
            border-radius: 3px;
            border: 2px solid #FA008A;
            color: #FA008A;
            text-transform: uppercase;
            font-weight: 700;
            background: linear-gradient();
            cursor: pointer;
            transition: all 0.5s ease-in-out;
        }
        .button1:hover {
            box-shadow: rgb(250, 0, 138) 180px 0px 0px 1px inset;
            color: #FFF;
        }
        .button2 {
            padding: 10px;
            width: 100px;
            margin: 0 auto;
            margin-top: 50px;
            border-radius: 3px;
            border: 2px solid #2D2926;
            color: #2D2926;
            text-transform: uppercase;
            font-weight: 700;
            background: linear-gradient();
            cursor: pointer;
            transition: all 0.5s ease-in-out;
        }
        .button2:hover {
            box-shadow: rgb(45, 41, 38) -180px 0px 0px 1px inset;
            color: #FFF;
        }
        </style>

        <script>
            function enviar()
            {
                var endereco = document.form1.txtendereco.value;
                if (endereco.length == 0)
                {
                    document.getElementById("erro_endereco").textContent = "*Campo Obrigatorio.";
                    document.getElementById("erro_endereco").style.color = "red";
                    document.getElementById("erro_endereco").style.fontStyle = "italic";
                    document.getElementById("erro_endereco").style.fontSize = "14px";
                    document.form1.txtendereco.style.border = "1px solid red";
                    document.form1.txtendereco.style.background = "#FFF5EE";
                    return false;
                }
                else 
                {
                    document.getElementById("erro_endereco").textContent = "";
                    document.form1.txtendereco.style.border = "1px solid black";
                    document.form1.txtendereco.style.background = "#FFFFFF";
                }

                var telefone = document.form1.txttelefone.value;
                if (telefone.length == 0 || isNaN(telefone))
                {
                    document.getElementById("erro_telefone").textContent = "*Campo Obrigatorio (apenas numeros).";
                    document.getElementById("erro_telefone").style.color = "red";
                    document.getElementById("erro_telefone").style.fontStyle = "italic";
                    document.getElementById("erro_telefone").style.fontSize = "14px";
                    document.form1.txttelefone.style.border = "1px solid red";
                    document.form1.txttelefone.style.background = "#FFF5EE";
                    return false;
                }
                else 
                {
                    document.getElementById("erro_telefone").textContent = "";
                    document.form1.txttelefone.style.border = "1px solid black";
                    document.form1.txttelefone.style.background = "#FFFFFF";
                }

                var checkbox1 = document.getElementById("item_01");
                var checkbox2 = document.getElementById("item_02");
                var checkbox3 = document.getElementById("item_03");
                var checkbox4 = document.getElementById("item_04");
                var checkbox5 = document.getElementById("item_05");
                var checkbox6 = document.getElementById("item_06");
                var checkbox7 = document.getElementById("item_07");
                var checkbox8 = document.getElementById("item_08");
                var checkbox9 = document.getElementById("item_09");
                var checkbox10 = document.getElementById("item_10");
                if (checkbox1.checked || checkbox2.checked || checkbox3.checked || checkbox4.checked || checkbox5.checked || checkbox6.checked || checkbox7.checked || checkbox8.checked || checkbox9.checked || checkbox10.checked)
                {
                    document.getElementById("erro_procedimento").textContent = "";
                }
                else
                {
                    document.getElementById("erro_procedimento").textContent = "*Escolha pelo menos 1 opcaoo.";
                    document.getElementById("erro_procedimento").style.color = "red";
                    document.getElementById("erro_procedimento").style.fontStyle = "italic";
                    document.getElementById("erro_procedimento").style.fontSize = "14px";
                    return false;
                }

                var data = document.form1.txtdata.value;
                if (data.length == 0)
                {
                    document.getElementById("erro_data").textContent = "*Campo Obrigatorio.";
                    document.getElementById("erro_data").style.color = "red";
                    document.getElementById("erro_data").style.fontStyle = "italic";
                    document.getElementById("erro_data").style.fontSize = "14px";
                    document.form1.txtdata.style.border = "1px solid red";
                    document.form1.txtdata.style.background = "#FFF5EE";
                    return false;
                }
                else 
                {
                    document.getElementById("erro_data").textContent = "";
                    document.form1.txtdata.style.border = "1px solid black";
                    document.form1.txtdata.style.background = "#FFFFFF";
                }

                var hora = document.form1.txthora.value;
                if (hora.length == 0)
                {
                    document.getElementById("erro_hora").textContent = "*Campo Obrigatorio.";
                    document.getElementById("erro_hora").style.color = "red";
                    document.getElementById("erro_hora").style.fontStyle = "italic";
                    document.getElementById("erro_hora").style.fontSize = "14px";
                    document.form1.txthora.style.border = "1px solid red";
                    document.form1.txthora.style.background = "#FFF5EE";
                    return false;
                }
                else 
                {
                    document.getElementById("erro_hora").textContent = "";
                    document.form1.txthora.style.border = "1px solid black";
                    document.form1.txthora.style.background = "#FFFFFF";
                }

                document.form1.submit();
            }
        </script>

    </head>

    <body>
        <div class="navbar">
            <div class="dropdown">
                <button class="dropbtn"> MENU
                    <i class="fa fa-caret down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="index.html" title="Home"><p> PAGINA INICIAL </p></a>
                    <a href="Login_Agendamento.html" title="Faça já o seu agendamento"><p> AGENDAMENTO </p></a>
                    <a href="Feedback.html" title="Sua Opinião Conta Muita"><p> FEEDBACKS </p></a>
                    <a href="Sobre Nós.html" title="Isso é quem nós somos"><p> SOBRE NOS </p></a>
                </div>
            </div>
            <h3 class="titulo"> Studio Pink House </h3>
        </div>

        <div class="conteudo">
            AGENDAMENTO <br>
            <div class="bem_vindo">
                <%
                    out.print("Seja bem vinda " + session.getAttribute("usuario") + "!");
                %>
            </div>
            <div class="consulta"> Ja possui um agendamento marcado e quer consultar? <a href="Consultar_Agendamento.jsp"> Clique aqui.</a></div>
            <br><br>
            <form class="agendamento" name="form1" method="post" action="gravar.jsp">
                Endereco: <input class="input_endereco" type="text" name="txtendereco" placeholder="Digite seu Endereco" maxlength="50">
                <span id="erro_endereco"></span> <br><br>
                Telefone: <input class="input_telefone" type="number" name="txttelefone" placeholder="Digite seu Numero de Telefone">
                <span id="erro_telefone"></span> <br><br>
                Procedimento: <span id="erro_procedimento"></span> <br>
                <div class="menu_de_procedimentos" name="menu_de_procedimentos">
                    Alongamento de Unhas <input type="checkbox" id="item_01" name="proc" value="Alongamento de Unhas"><br>
                    Manicure em Gel <input type="checkbox" id="item_02" name="proc" value="Manicure em Gel"><br>
                    Pedicure em Gel <input type="checkbox" id="item_03" name="proc" value="Pedicure em Gel"><br>
                    Extensao de Cilios <input type="checkbox" id="item_04" name="proc" value="Extensao de Cilios"><br>
                    Design de Sobrancelhas <input type="checkbox" id="item_05" name="proc" value="Design de Sobrancelhas"><br>
                    Design de Sobrancelhas com Henna <input type="checkbox" id="item_06" name="proc" value="Design de Sobrancelhas com Henna"><br>
                    Micropigmentacao Labial <input type="checkbox" id="item_07" name="proc" value="Micropigmentacao Labial"><br>
                    Micropigmentacao de Sobrancelhas <input type="checkbox" id="item_08" name="proc" value="Micropigmentacao de Sobrancelhas"><br>
                    Micropigmentacao Delineado dos Olhos <input type="checkbox" id="item_09" name="proc" value="Micropigmentacao Delineado dos Olhos"><br>
                    Camuflagem de Estrias <input type="checkbox" id="item_10" name="proc" value="Camuflagem de Estrias"><br><br>
                </div>
                Data: <input class="input_data-hora" type="date" name="txtdata">
                <span id="erro_data"></span> <br><br>
                Hora: <input class="input_data-hora" type="time" name="txthora">
                <span id="erro_hora"></span> <br>
                <center>
                    <button class="button1" type="button" value="ENVIAR" onclick="enviar()"> ENVIAR </button>
                    <button class="button2" type="reset" value="LIMPAR"> LIMPAR </button>
                </center>
            </form>
        </div>
        <div class="fale_conosco"> 
            Fale Conosco:
            <a href="https://instagram.com/studio.eduardamelo?igshid=MzRlODBiNWFlZA=="><img class="img2" src="Imagens/img_down_instagram.png" width="38px" height="38px"></a> 
            <a href="https://wa.me/message/BMCVOXGPL43FI1"><img class="img1" src="Imagens/img_down_whatsapp.png" width="35px" height="35px"></a>
        </div>
        <div class="downbar">
            <footer>
                &copy; Todos os direitos reservados.
            </footer>
        </div>
    </body>
</html>

<%
    }
%>