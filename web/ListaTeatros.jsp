<%-- 
    Document   : ListaTeatros
    Created on : 18/04/2019, 19:07:47
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
            <caption><h2><f:message key="listtheater.title" /></h2></caption>
            <tr>
                <th><f:message key="cnpj.label" /></th>
                <th><f:message key="name.label" /></th>
                <th><f:message key="city.label" /></th>
                <th><f:message key="action.label" /></th>
          
            </tr>
            <c:forEach var="sala" items="${requestScope.ListaTeatros}">
                <tr>
                    <td><c:out value="${sala.CNPJ}" /></td>
                    <td><c:out value="${sala.nome}" /></td>
                    <td><c:out value="${sala.cidade}" /></td>
                  
                    <td>
                        <a href="edicaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />"><f:message key="edit.label" /></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="remocaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />" 
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            <f:message key="remove.label" />
                        </a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    <center>    
        <br><a href="CadastroTeatro.jsp"><f:message key="newregister.label" /></a>
    </center>
    </f:bundle>
    </body>
</html>

