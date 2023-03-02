<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="modelos.Mazo" %>
<%@ page import="modelos.CartaTemplate" %>
<%@ page import="modelos.Carta" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
    </head>
<body>
    <div class="cartas">
        <%
            Mazo mazo = (Mazo)session.getAttribute("mazo");
            Carta card=mazo.extrae();
            int life=(int)session.getAttribute("life");
           int bet=(int)session.getAttribute("bet");        
            Carta guess= new Carta(Integer.parseInt(request.getParameter("numero")),request.getParameter("palo"));
            if (card.equals(guess)){
                out.print("<h1>Has acertado</h1>");
                if(card.getNumeroAsInt()==8){
                    life+=1;
                    session.setAttribute("life",life);
                }else if(card.getNumeroAsInt()==9){
                    bet*=2;
                    session.setAttribute("bet",bet);
                }else{
                    bet++;
                    session.setAttribute("bet",bet);
                }
            }else{
                if(card.getNumeroAsInt()==10){
                    session.setAttribute("bet",bet);
                }
                out.print("<h1>Has fallado</h1>");
                session.setAttribute("life",--life);
            }
            out.print(new CartaTemplate(card));
            out.print("</br><h1>Tienes "+bet+" dinero</h1></br>");
            out.print("</br><h1>Tienes "+life+" puntos de vida</h1></br>");
        %>
    </div>
    <div id="menu">
        <form method="post" action="adivinar.jsp">
            <input type="submit" value="Siguiente carta">
        </form>
    </div>
</body>
</html>