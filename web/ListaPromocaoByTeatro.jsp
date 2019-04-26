<%-- 
    Document   : ListaPromocaoByTeatro
    Created on : 21/04/2019, 18:25:15
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<f:bundle basename="i18n.mensagens">
    <%@include file="base/top.jsp" %>
    <div class="container">
        <c:if test="${promocao != null}"> 
            <form action="listaTeatro" method="post">
            </c:if>
            <c:if test="${promocao == null}">
                <form action="listaTeatro" method="post">
                </c:if>
                <c:if test="${promocao != null}">
                    <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                    <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                    <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                </c:if>
                <h1 class="display-4">Promoção do teatro</h1>
                <div class="row">
                    <div class="col-7">
                        <p class="lead">See below a list of registered sales:</p>
                    </div>
                    <div class="col-3">
                        <input class="form-control" placeholder="CNPJ" type="text" name="CNPJ" required
                               value= "<c:out value='${promocao.CNPJ}' />"
                               />
                    </div>
                    <div class="col-1">
                        <input type="submit" class="btn btn-primary mr-2"value="<f:message key="search.label" />" />
                    </div>
                    <sec:authorize access="hasRole('TEATRO')">
                        <div class="col-1">
                            <a href="/Avaliacao1/cadastroPromocao" class="btn btn-primary mr-2" role="button" aria-pressed="true">+</a>
                        </div>
                    </sec:authorize>
                </div>

                <table class="table">
                    <input type="hidden"
                           name="${_csrf.parameterName}"
                           value="${_csrf.token}"/> 
                    <tr>
                        <th><f:message key="url.label" /></th>
                        <th><f:message key="name.label" /></th>
                        <th><f:message key="date.label" /></th>
                        <th><f:message key="price.label" /></th>
                        <th><f:message key="action.label" /></th>

                    </tr>
                    <c:forEach var="promocao" items="${requestScope.ListaPromocaoByTeatro}">
                        <tr>
                            <td><c:out value="${promocao.url}" /></td>
                            <td><c:out value="${promocao.nome}" /></td>
                            <td><c:out value="${promocao.horario}" /></td>
                            <td><c:out value="${promocao.preco}" /></td>
                            <sec:authorize access="hasRole('TEATRO')">
                                <td>
                                    <a href="edicaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>&listaByTeatro=true"><f:message key="edit.title" /></a>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="remocaoPromocao?CNPJ=<c:out value='${promocao.CNPJ}' />&url=<c:out value='${promocao.url}'/>&horario=<c:out value='${promocao.horario}'/>&listaByTeatro=true" 
                                       onclick="return confirm('Tem certeza de que deseja excluir este item?');">
                                        <f:message key="remove.label" />
                                    </a>                    	
                                </td>
                            </tr>
                        </sec:authorize>

                    </c:forEach>
                </table>
                <%@include file="base/bottom.jsp" %>
            </f:bundle>

