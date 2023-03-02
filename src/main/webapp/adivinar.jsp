<%@ page import="modelos.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adivina</title>
</head>
<body>
    <h1>Cual sera la siguiente carta?</h1>
    <div id="guessBlock">
        <%
        Mazo mazo = (Mazo)session.getAttribute("mazo");
        int bet=(int)session.getAttribute("bet");
          if(bet==0){
             session.setAttribute("bet",Integer.parseInt(request.getParameter("initialBet")));
             bet=(int)session.getAttribute("bet");
          }
        int life=(int)session.getAttribute("life");
        out.print("<h1>Tienes "+ life + " puntos de vida</h1>");
        out.print("<h1>Tienes "+ bet + " dinero</h1>");
        %>
        <form method="post" action="partida.jsp">
            <div class="item-input">
                <label for="numero">Numero:</label>
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
            <input type="submit" value="Adivinar">
        </form>
    </div>
</body>
</html>