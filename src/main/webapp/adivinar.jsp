<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelos.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
    <title>Adivina</title>
</head>
<body class="bodyGuess">
    <div id="guessBlock">
            <header class="statsHeader">
                <%
                Mazo mazo = (Mazo)session.getAttribute("mazo");
                int bet=(Integer)session.getAttribute("bet");
            if(bet==0){
                 session.setAttribute("bet",Integer.parseInt(request.getParameter("initialBet")));
                 bet=(int)session.getAttribute("bet");
              }
            int life=(int)session.getAttribute("life");
                %>
                <div class="life">
                    <img src="assets/img/hearth.png">
                    <%
                    out.print("<span>"+life+"</span>");
                    %>
                </div>
                <div class="money">
                    <img src="assets/img/coin.png">
                    <%
                    out.print("<span>"+bet+"</span>");
                    %>
                </div>
            </header>
        <div class="title">
            Cuál será la siguiente carta?
        </div>
    <div id="guessMenu">
        <div id="guessOptions">
            <form method="post" action="partida.jsp">
                <div class="item-input">
                    <label for="numero">Número:</label>
                <select name="numero" id="numero"> 
                    <option value="0" <% if (mazo.getCantidadRestanteNumero("Uno") == 0) { %>disabled<% } %>>Uno</option>
                    <option value="1"<% if (mazo.getCantidadRestanteNumero("Dos") == 0) { %>disabled<% } %>>Dos</option>
                    <option value="2"<% if (mazo.getCantidadRestanteNumero("Tres") == 0) { %>disabled<% } %>>Tres</option>
                    <option value="3"<% if (mazo.getCantidadRestanteNumero("Cuatro") == 0) { %>disabled<% } %>>Cuatro</option>
                    <option value="4"<% if (mazo.getCantidadRestanteNumero("Cinco") == 0) { %>disabled<% } %>>Cinco</option>
                    <option value="5"<% if (mazo.getCantidadRestanteNumero("Seis") == 0) { %>disabled<% } %>>Seis</option>
                    <option value="6"<% if (mazo.getCantidadRestanteNumero("Siete") == 0) { %>disabled<% } %>>Siete</option>
                    <option value="7"<% if (mazo.getCantidadRestanteNumero("Sota") == 0) { %>disabled<% } %>>Sota</option>
                    <option value="8"<% if (mazo.getCantidadRestanteNumero("Caballo") == 0) { %>disabled<% } %>>Caballo</option>
                    <option value="9"<% if (mazo.getCantidadRestanteNumero("Rey") == 0) { %>disabled<% } %>>Rey</option>
                </select>
                </div>
                <div class="item-input">
                    <label for="palo">Palo:</label>
                    <select name="palo" id="palo">
                        <option value="Oros"<% if (mazo.getCantidadRestantePalo("Oros") == 0) { %> disabled <% } %>>Oros</option>
                        <option value="Copas" <% if (mazo.getCantidadRestantePalo("Copas") == 0) { %>disabled<% } %>>Copas</option>
                        <option value="Espadas" <% if (mazo.getCantidadRestantePalo("Espadas") == 0) { %>disabled<% } %>>Espadas</option>
                        <option value="Bastos" <% if (mazo.getCantidadRestantePalo("Bastos") == 0) { %>disabled<% } %>>Bastos</option>
                    </select>
                </div>
        </div>
            <div id="guessImg">
                <img src="assets/img/gnomeSam.png">
                <span>El tio GnomeSam necesita<br>que llegues al final del arcoiris</span>
            </div>
    </div>
        <div class="submitButton">
        <input type="submit" value="Adivinar">
        </div>
        </form>
    </div>
    
</body>
</html>