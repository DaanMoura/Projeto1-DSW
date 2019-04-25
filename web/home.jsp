
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@include file="base/top.jsp" %>
<f:bundle basename="i18n.mensagens">

    <div class="container mt-2">
        <h1 class="display-4"><f:message key="welcome.index"/></h1>
        <h3><f:message key="message.index"/></h3>

        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="pills-teatros-tab" data-toggle="pill" href="#pills-teatros" role="tab" aria-controls="pills-teatros" aria-selected="true">Teatros</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-cidade-tab" data-toggle="pill" href="#pills-cidade" role="tab" aria-controls="pills-cidade" aria-selected="false">Por cidade</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="pills-promo-tab" data-toggle="pill" href="#pills-promo" role="tab" aria-controls="pills-promo" aria-selected="false">Promoções</a>
            </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="pills-teatros" role="tabpanel" aria-labelledby="pills-teatros-tab">abc</div>
            <div class="tab-pane fade" id="pills-cidade" role="tabpanel" aria-labelledby="pills-cidade-tab">123</div>
            <div class="tab-pane fade" id="pills-promo" role="tabpanel" aria-labelledby="pills-promo-tab">fnasjfnsnf</div>
        </div>

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
    </div>

</f:bundle>
<%@include file="base/bottom.jsp" %>



