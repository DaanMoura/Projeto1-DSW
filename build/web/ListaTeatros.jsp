<%-- 
    Document   : ListaTeatros
    Created on : 18/04/2019, 19:07:47
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Venda de Ingressos</title>
    </head>
    <body>
        
        <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Lista Salas</h2></caption>
            <tr>
                <th>CNPJ</th>
                <th>Nome</th>
                <th>Cidade</th>
                <th>Ações</th>
          
            </tr>
            <c:forEach var="sala" items="${requestScope.ListaTeatros}">
                <tr>
                    <td><c:out value="${sala.CNPJ}" /></td>
                    <td><c:out value="${sala.nome}" /></td>
                    <td><c:out value="${sala.cidade}" /></td>
                  
                    <td>
                        <a href="edicaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />">Edição</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="remocaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />" 
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            Remoção
                        </a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    <center>    
        <br><a href="CadastroTeatro.jsp">Cadastrar nova sala</a>
    </center>
    </body>
</html>

