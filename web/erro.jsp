<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Erro</title>
    </head>
    <body>
        <center>
            <h1>Ocorrou um erro :(</h1>
            <h3>Mensagem do erro</h3>
            <p><%= exception.getMessage()%><br/> </p>
        </center>	
    </body>
</html>
