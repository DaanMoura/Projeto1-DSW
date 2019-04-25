
<%-- 
    Document   : ListaTeatros
    Created on : 18/04/2019, 19:07:47
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
    <%@include file="base/top.jsp" %>

    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th><f:message key="url.label" /></th>
                    <th><f:message key="name.label" /></th>
                    <th><f:message key="email.label" /></th>
                    <th><f:message key="phone.label" /></th>


                    <sec:authorize access="hasRole('ADMIN')">
                        <th><f:message key="action.label" /></th>
                        </sec:authorize>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="site" items="${requestScope.ListaSites}">
                    <tr>
                        <td><c:out value="${site.url}" /></td>
                        <td><c:out value="${site.nome}" /></td>
                        <td><c:out value="${site.email}" /></td>
                        <td><c:out value="${site.telefone}" /></td>
                        <sec:authorize access="hasRole('ADMIN')">
                            <td>
                                <a href="edicaoSite?url=<c:out value='${site.url}' />"><f:message key="edit.label" /></a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="remocaoSite?url=<c:out value='${site.url}' />" 
                                   onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                    <f:message key="remove.label" />
                                </a>                    	
                            </td>
                        </sec:authorize>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</f:bundle>

<%@include file="base/bottom.jsp" %>
