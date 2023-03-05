<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ page import="modelos.Mazo" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="assets/css/styles.css" type="text/css">
            <title>Apuestas</title>
        </head>
        <% session.setAttribute("bet",0); session.setAttribute("life",5); session.setAttribute("mazo",new Mazo()); int
            life=(int)session.getAttribute("life"); int bet=(int)session.getAttribute("bet"); %>

            <body class="bodyBet">
                <div class="betBlock">
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
                    <div class="betTitle">
                        Apuestas
                    </div>
                    <div class="betMenu">
                        <form method="post" action="adivinar.jsp" class="betForm">
                            <div class="betInputBlock">
                                <span>Ingrese la cantidad de dinero a apostar<br>(Mínimo 25€)</span>
                                <div class="item-input">
                                    <input type="number" min="25" name="initialBet" required>
                                </div>
                            </div>
                          
                            <div class="betImg">
                                <img src="./assets/img/gnomoEstadoFondo.png">
                                <p class="betP1">LOTERÍAS</p>
                                <p class="betP2">Y APUESTAS DEL GNOMOESTADO</p>
                            </div>
                    </div>

                    <div class="submitButton">
                        <input type="submit" value="Comenzar">
                    </div>
                    </form>
                </div>
            </body>

        </html>