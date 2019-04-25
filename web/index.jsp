
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@include file="base/top.jsp" %>
<f:bundle basename="i18n.mensagens">

    <sec:authorize access="isAnonymous()">
        <div class="jumbotron">
            <div class="container">
                <h1 class="display-4"><f:message key="welcome.index"/></h1>  
                <p class="lead">This is a system to manage tickets sales websites</p>
                <a href="/Avaliacao1/login" class="btn btn-primary" role="button" aria-pressed="true">Login</a>
            </div>
        </div>
    </sec:authorize>

    <div class="container">
        <p class="lead"><f:message key="message.index"/></p>
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
            <div class="tab-pane fade show active" id="pills-teatros" role="tabpanel" aria-labelledby="pills-teatros-tab">
                <%@include file="ListaTeatros.jsp" %>
            </div>
            <div class="tab-pane fade" id="pills-cidade" role="tabpanel" aria-labelledby="pills-cidade-tab">
                PRECISA SER IMPLEMENTADO
            </div>
            <div class="tab-pane fade" id="pills-promo" role="tabpanel" aria-labelledby="pills-promo-tab">
                <%@include file="ListaPromocao.jsp" %>
            </div>
        </div>
    </div>

</f:bundle>
<%@include file="base/bottom.jsp" %>



