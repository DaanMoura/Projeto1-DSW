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
    <%@include file="base/top.jsp" %>
    <div class="container">
        <c:if test="${sala != null}"> 
            <form action="listaPorCidade" method="post">
            </c:if>
            <c:if test="${sala == null}">
                <form action="listaPorCidade" method="post">
                </c:if>

                <h1 class="display-4"> <f:message key="teatroCity.title" /></h1>
                <div class="row">
                    <div class="col-8">
                        <p class="lead"> <f:message key="descTeatro.message" /></p>
                    </div>
                    <div class="col-3">
                        <input class="form-control" placeholder="cidade" type="text" name="cidade" required
                               value= "<c:out value='${sala.cidade}' />"
                               />
                    </div>
                    <div class="col-1">
                        <input type="submit" class="btn btn-primary mr-2"value="<f:message key="search.label" />" />

                    </div>
                    <sec:authorize access="hasRole('ADMIN')">
                        <div class="col-1">
                            <a href="/Avaliacao1/cadastroSite" class="btn btn-primary mr-2" role="button" aria-pressed="true">+</a>
                        </div>
                    </sec:authorize>
                </div>
                <table class="table">
                    <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/> 
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
                        <c:forEach var="sala" items="${requestScope.ListaTeatroByCidade}">
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
                <%@include file="base/bottom.jsp" %>
            </f:bundle>



