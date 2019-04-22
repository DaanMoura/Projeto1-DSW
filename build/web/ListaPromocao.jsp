<%-- 
    Document   : ListaPromocoes
    Created on : 19/04/2019, 20:17:13
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><f:message key="page.title" /></title>
    </head>
    <body>
        
        <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2><th><f:message key="listpromo.title" /></th></h2></caption>
            <tr>
                <th><f:message key="url.label" /></th>
                <th><f:message key="cnpj.label" /></th>
                <th><f:message key="name.label" /></th>
                <th><f:message key="date.label" /></th>
                <th><f:message key="price.label" /></th>
                <th><f:message key="action.label" /></th>
          
            </tr>
            <c:forEach var="promocao" items="${requestScope.ListaPromocao}">
                <tr>
                    <td><c:out value="${promocao.url}" /></td>
                    <td><c:out value="${promocao.CNPJ}" /></td>
                    <td><c:out value="${promocao.nome}" /></td>
                    <td><c:out value="${promocao.horario}" /></td>
                    <td><c:out value="${promocao.preco}" /></td>
                  
                    <td>
                        <a href="edicaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>"><f:message key="edit.label" /></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="remocaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>" 
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            <f:message key="remove.label" />
                        </a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    <center>    
        <br><a href="CadastroPromocao.jsp"><f:message key="newregister.label" /></a>
    </center>
    </body>
</f:bundle>
</html>
