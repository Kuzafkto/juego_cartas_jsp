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
    int victory=Integer.parseInt(request.getParameter("victory"));
    int bet=Integer.parseInt(request.getParameter("bet"));
    if (victory==1){

    
    %>
        <h1>Haz Ganado</h1>
    <%}else{%>
        <h1>Haz Perdido</h1>
        <%}%>
        
        <%out.print("<h1>Tienes "+bet+ " dinero</h1>");%>

</body>
</html>