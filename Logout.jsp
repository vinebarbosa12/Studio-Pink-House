<%
    if (session != null)
    {
        session.invalidate();
        response.sendRedirect("Login_Agendamento.html");
    }
%>