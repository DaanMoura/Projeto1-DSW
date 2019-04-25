<%-- 
    Document   : ListaTeatros
    Created on : 18/04/2019, 19:07:47
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
        <table class="table">
        <thead>
            <tr>
                <th><f:message key="cnpj.label" /></th>
                <th><f:message key="name.label" /></th>
                <th><f:message key="city.label" /></th>

                <sec:authorize access="hasRole('ADMIN')">
                    <th><f:message key="action.label" /></th>
                    </sec:authorize>

            </tr>
        </thead>
        <tbody>
            <c:forEach var="sala" items="${requestScope.ListaTeatros}">
                <tr>
                    <td><c:out value="${sala.CNPJ}" /></td>
                    <td><c:out value="${sala.nome}" /></td>
                    <td><c:out value="${sala.cidade}" /></td>
                    <sec:authorize access="hasRole('ADMIN')">
                        <td>
                            <a href="edicaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />"><f:message key="edit.label" /></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="remocaoTeatro?CNPJ=<c:out value='${sala.CNPJ}' />" 
                               onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                <f:message key="remove.label" />
                            </a>                    	
                        </td>
                    </sec:authorize>

                </tr>
            </c:forEach>
        </tbody>
    </table>

</f:bundle>



