<%-- 
    Document   : ListaPromocaoBySite
    Created on : 23/04/2019, 15:42:12
    Author     : Marcos Felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<f:bundle basename="i18n.mensagens">
    <%@include file="base/top.jsp" %>
    <sec:authorize access="hasRole('SITE')">

        <div class="container">
            <c:if test="${promocao != null}"> 
                <form action="listaBySite" method="post">
                </c:if>
                <c:if test="${promocao == null}">
                    <form action="listaBySite" method="post">
                    </c:if>

                    <h1 class="display-4">Promoção do site</h1>
                    <div class="row">
                        <div class="col-7">
                            <p class="lead">See below a list of registered sales:</p>
                        </div>
                        <div class="col-3">
                            <input class="form-control" placeholder="url" type="text" name="url" required
                                   value= "<c:out value='${promocao.url}' />"
                                   />
                        </div>
                        <div class="col-1">
                            <input type="submit" class="btn btn-primary mr-2"value="<f:message key="search.label" />" />

                        </div>
                    </div>
                    <c:if test="${promocao != null}">
                        <input type="hidden" name="url" value="<c:out value='${promocao.url}' />"/> 
                        <input type="hidden" name="CNPJ" value="<c:out value='${promocao.CNPJ}' />"/>
                        <input type="hidden" name="horario" value="<c:out value='${promocao.horario}'/>"/>                                
                    </c:if>
                    <table class="table">
                        <input type="hidden"
                               name="${_csrf.parameterName}"
                               value="${_csrf.token}"/> 
                        <tr>
                            <th><f:message key="url.label" /></th>
                            <th><f:message key="name.label" /></th>
                            <th><f:message key="date.label" /></th>
                            <th><f:message key="price.label" /></th>

                        </tr>
                        <c:forEach var="promocao" items="${requestScope.ListaPromocaoBySite}">
                            <tr>
                                <td><c:out value="${promocao.url}" /></td>
                                <td><c:out value="${promocao.nome}" /></td>
                                <td><c:out value="${promocao.horario}" /></td>
                                <td><c:out value="${promocao.preco}" /></td>
                            </tr>
                        </c:forEach>
                    </table>


                    </div>
                </sec:authorize>
                <%@include file="base/bottom.jsp" %>
            </f:bundle>



