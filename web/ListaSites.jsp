<%-- 
    Document   : lista
    Created on : 16/04/2019, 11:58:11
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
            <caption><h2><f:message key="listsite.title" /></h2></caption>
            <tr>
                <th><f:message key="url.label" /></th>
                <th><f:message key="name.label" /></th>
                <th><f:message key="email.label" /></th>
                <th><f:message key="password.label" /></th>
                <th><f:message key="phone.label" /></th>
                <th><f:message key="action.label" /></th>
          
            </tr>
            <c:forEach var="site" items="${requestScope.ListaSites}">
                <tr>
                    <td><c:out value="${site.url}" /></td>
                    <td><c:out value="${site.nome}" /></td>
                    <td><c:out value="${site.email}"/></td>
                    <td><c:out value="${site.senha}"/></td>
                    <td><c:out value="${site.telefone}" /></td>
                  
                    <td>
                        <a href="edicao?url=<c:out value='${site.url}' />"><f:message key="edit.label" /></a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="remocao?url=<c:out value='${site.url}' />" 
                           onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                            <f:message key="remove.label" />
                        </a>                    	
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    <center>    
        <br><a href="CadastroSite.jsp"><f:message key="newregister.label" /></a>
    </center>
    </body>
</f:bundle>
</html>
