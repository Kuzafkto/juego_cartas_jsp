<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
    <title>Final</title>
</head>
<%
int victory=Integer.parseInt(request.getParameter("victory"));
int bet=Integer.parseInt(request.getParameter("bet"));
int life=(int)session.getAttribute("life");
%>
<body class="bodyGame">
<div class="finalBlock">

<header class="statsHeader">
    <div class="life">
        <img src="assets/img/hearth.png">
        <% out.print("<span>"+life+"</span>");
            %>
    </div>
    <div class="money">
        <img src="assets/img/coin.png">
        <% out.print("<span>"+bet+"</span>");
            %>
    </div>
</header>
<%
if (victory==1){
%>
        <div class="gameTitle">LLEGASTE AL FINAL<br>DEL ARCOIRIS!</div>
        <div class="finalImg">
            <img src="./assets/img/pot.png">
        </div>
        <%}else{%>
        <div class="gameTitle">NO LLEGASTE AL FINAL<br>DEL ARCOIRIS</div>
        <div class="finalImg">
            <img src="./assets/img/vomit.gif">
        </div>
        <%}%>
        <div class="gameTitle2">
            <%out.print("<div class=\"gameTitle\">Has terminado con "+bet+ "€</div>");%>
        </div>
        <div class="submitButton">
            <form method="post" action="index.jsp">
                <input type="submit" value="Volver a Jugar">
            </form>
        </div>
    </div>
</body>
</html>