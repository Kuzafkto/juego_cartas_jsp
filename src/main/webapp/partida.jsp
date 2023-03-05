<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelos.Mazo" %>
<%@ page import="modelos.CartaTemplate" %>
<%@ page import="modelos.Carta" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
        <title>Partida</title>
    </head>
    <body class="bodyGame">
    <%
            Mazo mazo = (Mazo)session.getAttribute("mazo");
            Carta card=mazo.extrae();
            int life=(int)session.getAttribute("life");
           int bet=(int)session.getAttribute("bet");
           int bet2=bet;
           Carta guess= new Carta(Integer.parseInt(request.getParameter("numero")),request.getParameter("palo"));
           if (card.equals(guess)){
               if(card.getNumeroAsString().equals("Sota")){
                   life+=2;
                   session.setAttribute("life",life);
               }else if(card.getNumeroAsString().equals("Caballo")){
                   bet*=2;
                   session.setAttribute("bet",bet);
               }
           }else{
               if(card.getNumeroAsString().equals("Rey")){
                   if(life>1){
                       session.setAttribute("life",--life);
                   }
               }else if(card.getNumeroAsString().equals("Caballo")){
                   bet/=2;
                   session.setAttribute("bet",bet);
               }
               session.setAttribute("life",--life);
           }
    %>
    <div class="gameBlock">
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
            if (card.equals(guess)){
                out.print("<div class=\"gameTitle\">ACERTASTE</div>");
                if(card.getNumeroAsString().equals("Sota")){
                    out.print("<div class=\"gameSubtitle\">Has ganado 1 vida</div>");
                }else if(card.getNumeroAsString().equals("Caballo")){
                    out.print("<div class=\"gameSubtitle\">Has ganado "+ bet2 +"€</div>");
                }
            }else{
                out.print("<div class=\"gameTitle\">FALLASTE</div>");
                if(card.getNumeroAsString().equals("Rey")){
                    out.print("<div class=\"gameSubtitle\">Has perdido 2 vidas</div>");
                }else if(card.getNumeroAsString().equals("Caballo")){
                    out.print("<div class=\"gameSubtitle\">Has perdido "+ bet2/2 +"€</div>");
                }
            }
    %>
    <div class="cartas">
        <%
        out.print(new CartaTemplate(card));
        %>
        <img src="./assets/img/reverso.png">
    </div>
      
        <div class="submitButton">
            <%if(mazo.size()==0){%>
            <form method="post" action="final.jsp?victory=1&bet=<%=bet*2%>">
                <input type="submit" value="Siguiente carta">
            </form>
            <%}else if(life<=0){%>
                <form method="post" action="final.jsp?victory=0&bet=<%=bet%>">
                    <input type="submit" value="Siguiente carta">
                </form>
            <%}else {%>
                <form method="post" action="adivinar.jsp">
                    <input type="submit" value="Siguiente carta">
                </form>
                <%}%>
        </div>
    </div>
    
</body>
</html>