<%-- 
    Document   : ListaPromocoes
    Created on : 19/04/2019, 20:17:13
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">

    <table class="table">
        <thead>
            <tr>
                <th><f:message key="url.label" /></th>
                <th><f:message key="cnpj.label" /></th>
                <th><f:message key="name.label" /></th>
                <th><f:message key="date.label" /></th>
                <th><f:message key="price.label" /></th>
                    <sec:authorize access="hasRole('ADMIN')">
                    <th><f:message key="action.label" /></th>
                    </sec:authorize>

            </tr>
        </thead>

        <tbody>
            <c:forEach var="promocao" items="${requestScope.ListaPromocao}">
                <tr>
                    <td><c:out value="${promocao.url}" /></td>
                    <td><c:out value="${promocao.CNPJ}" /></td>
                    <td><c:out value="${promocao.nome}" /></td>
                    <td><c:out value="${promocao.horario}" /></td>
                    <td><c:out value="${promocao.preco}" /></td>

                    <sec:authorize access="hasRole('ADMIN')">

                        <td>
                            <a href="edicaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>"><f:message key="edit.label" /></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="remocaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>" 
                               onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                <f:message key="remove.label" />
                            </a>                    	
                        </td>
                    </sec:authorize>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <sec:authorize access="hasRole('ADMIN')">
        <a href="CadastroPromocao.jsp"><f:message key="newregister.label" /></a>
    </sec:authorize>
</f:bundle>
