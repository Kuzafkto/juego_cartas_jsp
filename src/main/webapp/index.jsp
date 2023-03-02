<%@ page import="modelos.Mazo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apuestas</title>
</head>
<body>
    <h1>Apuestas</h1>
    <%
    session.setAttribute("bet",0);
    session.setAttribute("life",5);
    session.setAttribute("mazo",new Mazo());
    %>
    <div id="menu">
        <form method="post" action="adivinar.jsp">
            <span>Ingrese la cantidad de dinero a apostar</span>
            <input type="number" min="1" name="initialBet">
            <input type="submit" value="Comenzar">
        </form>
    </div>
</body>
</html>